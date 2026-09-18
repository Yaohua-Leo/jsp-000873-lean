# jsp-000873-lean

Machine-checked Lean 4 formalization accompanying an **observation record** for
problem **JSP-000873** of [TheJustinSunPrize/awards](https://github.com/TheJustinSunPrize/awards)
("multiply perfect numbers": if an integer's divisor sum is an integer multiple
of itself, must that multiplier be of smaller order than its iterated
logarithm?).

## What is proved

A positive integer `n` is *multiply perfect* (here: `k`-perfect) when its
divisor sum satisfies `σ(n) = k * n` for some integer `k > 1`; `k = 2` gives
the classical perfect numbers. This repository proves concrete witnesses for
the `k = 3` component, namely that **120 and 672 are triply perfect**:

- `σ(120) = 360 = 3 * 120`;
- `σ(672) = 2016 = 3 * 672`.

Theorems (file `JSP000873.lean`):

- `jsp000873 : ∃ (n k : ℕ), 1 < k ∧ ArithmeticFunction.sigma 1 n = k * n`
  (witnessed by `n = 120`, `k = 3`)
- `jsp000873_second : 1 < 3 ∧ ArithmeticFunction.sigma 1 672 = 3 * 672`

Here `ArithmeticFunction.sigma 1` is Mathlib's divisor-sum arithmetic function
`σ`, defined as `∑ d ∈ n.divisors, d`. All proofs are complete `decide`
computations; there is no `sorry`, `admit`, `native_decide`, or unproved
hypothesis anywhere in this repository.

## Scope (honest statement)

This observation records a complete, machine-checked Lean proof that there
exist `n` with `σ(n) = 3 * n` (the `k = 3` existence instances: 120 and 672).
The asymptotic question asked by the catalog entry — whether the multiplier
`k = σ(n)/n` must be of smaller order than the iterated logarithm of `n` — is
**not** addressed, the catalogued problem is **not** resolved (it remains
Open), and **no award claim is made**.

## Toolchain and build

- Lean toolchain: `leanprover/lean4:v4.35.0-rc2`
- Dependency: Mathlib `v4.35.0-rc2` (pinned in `lake-manifest.json`)

Build / verify:

```sh
lake env lean JSP000873.lean
```

Zero output (besides the `#print axioms` lines) means success.

## Axiom audit

`#print axioms` at the end of `JSP000873.lean` reports for every theorem only
the standard Mathlib axioms:

```
'jsp000873' depends on axioms: [propext, Classical.choice, Quot.sound]
'jsp000873_second' depends on axioms: [propext, Classical.choice, Quot.sound]
```

This is the full set permitted by the awards repository's verification rules.

## Attribution

- Mathematical problem: catalog entry JSP-000873 of TheJustinSunPrize/awards;
  the underlying notion of multiply perfect number is classical number theory.
- Formalization author: **Yaohua-Leo**, AI-assisted via **ZCode (GLM)**.
- License: Apache 2.0 (see `LICENSE`).

This repository makes no claim of priority on the mathematics and asserts no
award eligibility.
