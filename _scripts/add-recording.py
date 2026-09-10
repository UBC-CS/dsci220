#!/usr/bin/env python3
"""
Wire forwarded Zoom recording links into data/additional-resources.csv.

Reads the `dsci220` Gmail label via ~/Repos/AIprograms/gmail_fetch.py, finds
forwarded Zoom "Meeting assets ... are ready!" mails, maps each recording's date
to the lecture that met that day, and updates the recording row for it.

    python3 _scripts/add-recording.py            # unread only, show the plan
    python3 _scripts/add-recording.py --all      # include already-read mail
    python3 _scripts/add-recording.py --write    # actually update the CSV

Underscore-prefixed so Quarto ignores this directory.
"""
import argparse, csv, datetime, os, re, subprocess, sys, pathlib

REPO = pathlib.Path(__file__).resolve().parent.parent
FETCH = os.path.expanduser("~/Repos/AIprograms/gmail_fetch.py")
DAY_OFFSET = {"Mon": 0, "Tue": 1, "Wed": 2, "Thu": 3, "Fri": 4, "Sat": 5, "Sun": 6}


def term_start():
    import yaml
    v = yaml.safe_load((REPO / "_variables.yml").read_text())
    return datetime.date.fromisoformat(str(v["course"]["monday-of-first-term-week"]))


def date_to_lecture():
    """date -> lecture id, from schedule.csv."""
    mon0 = term_start()
    out = {}
    with open(REPO / "data" / "schedule.csv") as f:
        for row in csv.DictReader(f):
            if row["id"].startswith("lecture-") and row["slot"] in DAY_OFFSET:
                d = mon0 + datetime.timedelta(weeks=int(row["week"]) - 1,
                                              days=DAY_OFFSET[row["slot"]])
                out[d] = row["id"]
    return out


def parse_mail(text):
    """Yield (meeting_date, share_url) for each Zoom asset mail in the dump."""
    blocks = re.split(r"\n(?=From:\s)", text)
    for b in blocks:
        share = re.search(r"Shareable link:\s*(https://\S+)", b)
        if not share:
            continue
        # Prefer the ORIGINAL Zoom mail's date (the meeting), not the forward's.
        inner = re.search(r"Date:\s*([A-Z][a-z]+ \d{1,2}, \d{4})\s+at", b)
        if inner:
            d = datetime.datetime.strptime(inner.group(1), "%B %d, %Y").date()
        else:
            outer = re.search(r"Date:\s*\w{3}, (\d{1,2} \w{3} \d{4})", b)
            if not outer:
                continue
            d = datetime.datetime.strptime(outer.group(1), "%d %b %Y").date()
        yield d, share.group(1).rstrip(">").rstrip()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--label", default="dsci220")
    ap.add_argument("--all", action="store_true", help="include already-read mail")
    ap.add_argument("--write", action="store_true", help="update the CSV")
    a = ap.parse_args()

    cmd = [sys.executable, FETCH, a.label] + (["--all"] if a.all else [])
    text = subprocess.run(cmd, capture_output=True, text=True).stdout
    found = list(parse_mail(text))
    if not found:
        print("No Zoom recording mails found on label", a.label)
        return

    lookup = date_to_lecture()
    csv_path = REPO / "data" / "additional-resources.csv"
    rows = list(csv.DictReader(open(csv_path)))
    changed = []
    for d, url in found:
        lid = lookup.get(d)
        if not lid:
            print(f"  {d}  no lecture met that day -- skipped")
            continue
        for r in rows:
            if r["id"] == lid and r["type"] == "recording":
                if r["resource"] == url:
                    print(f"  {d}  {lid}  already set")
                else:
                    print(f"  {d}  {lid}  {'UPDATE' if a.write else 'would update'}")
                    r["resource"] = url
                    changed.append(lid)
                break
        else:
            print(f"  {d}  {lid}  no recording row in additional-resources.csv")

    if changed and a.write:
        with open(csv_path, "w", newline="") as f:
            w = csv.DictWriter(f, fieldnames=["id", "type", "resource"])
            w.writeheader()
            w.writerows(rows)
        print(f"\nwrote {len(changed)} link(s): {', '.join(changed)}")
    elif changed:
        print(f"\n{len(changed)} change(s) pending -- rerun with --write")


if __name__ == "__main__":
    main()
