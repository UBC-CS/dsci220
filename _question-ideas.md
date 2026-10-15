# Question ideas, by where they fit

Not published (Quarto ignores `_`-prefixed files). Puzzles Cinda has collected
(mostly mathalon.app screenshots), with checked answers and where each one
belongs. Remove an entry once it is built, and say where it went.

## HW3 — induction (L11–13), plus earlier proof techniques

- **(36a + b)(a + 36b) is never a power of 2** (screenshot 2026-10-14).
  Strong induction on a + b, with a contradiction inside: both factors are
  powers of 2 and at least 37, so even, so a and b are even, and (a/2, b/2) is
  a smaller pair. Works for any even c in place of 36 (checked c = 2..40, a, b
  < 200). Fails for odd c: c = 3, 7 at a = b = 1; c = 5 at (1, 3); c = 9 at
  (1, 7). None found for 11 or 13 (a, b < 60).
- **The Wrong Envelopes** (mathalon, 2026-09-03). Five letters, none in its own
  envelope: 44 of 120. Derangements D_n = 0, 1, 2, 9, 44, 265, 1854. HW3 angle:
  given D_n = (n-1)(D_{n-1} + D_{n-2}), prove by induction that
  D_n = n·D_{n-1} + (-1)^n (checked through n = 7). The counting argument for
  the first recurrence belongs to the counting module.
- **24 | p² − 1 for primes p > 3.** Cases on p = 3k+1, 3k+2 (L10), and
  consecutive evens. Fails at p = 2, 3.

## Representation (L17–18)

- **The gold chain** (mathalon, 2026-10-09). 7 links, one per night, change
  allowed: cut 1 link (link 3 or 5), leaving 1, 2, 4. With k cuts the longest
  chain is (k+1)·2^(k+1) − 1: 1, 7, 23, 63 (brute force agrees for k = 0, 1, 2).
  Two cuts on 23 links: links 4 and 11. Pieces of size 1, 2, 4, ... are binary.

## Sets (module 5)

- **Euler diagram challenge** (screenshot 2026-08-30). Nine three-circle
  diagrams; match each triple (apples/fruits/red things, multiples of
  2/6/12, penguins/birds/flightless animals, ...) to its diagram. Good for
  subset vs. overlap vs. disjoint, and for "not all fruits are red".

## Probability (module 8)

- **You Pick First** (mathalon, 2026-09-03). Penney's game: HHH vs THH.
  THH comes first with probability 7/8 (HHH wins only if the first three flips
  are HHH; simulation 0.874).
- **The Last Sticker** (mathalon, 2026-09-03). Coupon collector with 6
  stickers: expected 6(1 + 1/2 + ... + 1/6) = 14.7 purchases. Harmonic sum.
