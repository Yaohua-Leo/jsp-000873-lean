/- leanprover/lean4:v4.35.0-rc2  mathlib v4.35.0-rc2 -/
/-
  JSP-000873 · "multiply perfect numbers" — Lean formalization observation

  Problem (TheJustinSunPrize/awards, JSP-000873, Number theory, status Open):
  If an integer's divisor sum is an integer multiple of itself, must that
  multiplier be of smaller order than its iterated logarithm?

  A positive integer n is *multiply perfect* (here: k-perfect) when
  σ(n) = k * n for some integer k > 1, where σ is the divisor-sum function.
  k = 2 gives the classical perfect numbers.

  This file formalizes an observation only: concrete witnesses exist for the
  k = 3 component of the problem. Namely

      σ(120) = 360 = 3 * 120,
      σ(672) = 2016 = 3 * 672,

  i.e. 120 and 672 are triply perfect (3-perfect) numbers.

  SCOPE HONESTY: this does NOT resolve JSP-000873. The problem asks whether
  the multiplier k = σ(n)/n must be of smaller order than the iterated
  logarithm of n (an asymptotic question about all such n, including
  infinitude/density aspects). We only prove the trivial-to-state but
  formally checked existence instances for k = 3. The problem remains Open.
  No award is claimed.

  Formalization author: Yaohua-Leo, AI-assisted via ZCode (GLM).
-/

import Mathlib

/-- `120` and `3` witness the `k = 3` component: `σ(120) = 360 = 3 * 120`.
    `ArithmeticFunction.sigma 1` is the divisor-sum function `σ`. -/
theorem jsp000873 : ∃ (n k : ℕ), 1 < k ∧ ArithmeticFunction.sigma 1 n = k * n :=
  ⟨120, 3, by decide, by decide⟩

/-- `672` is also triply perfect: `σ(672) = 2016 = 3 * 672`. -/
theorem jsp000873_second : 1 < 3 ∧ ArithmeticFunction.sigma 1 672 = 3 * 672 :=
  ⟨by decide, by decide⟩

#print axioms jsp000873
#print axioms jsp000873_second
