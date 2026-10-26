/-
Copyright (c) 2026 Denise M. Case. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.TransformationPersistence.Lift

/-!
# Conformance

SE.TransformationPersistence.Conformance

Finite regression guards for the lifting layer.

- lifting along the Transformation taxonomy commutes with the coarse matrix.

The Persistence-side guards (value registry, coarse matrix) live in
`SE.Persistence.Conformance`.
-/

namespace SE.Persistence

open SE.Transformation

public section

/-- Lifting along families commutes with the coarse matrix, operator by operator. -/
theorem liftFamily_coarse_all (c : Classification TransformationFamily) :
    ∀ op, c.liftFamily.coarse op = c.coarse (operatorFamily op) :=
  fun op => Classification.liftFamily_coarse c op

/-- Lifting along kinds commutes with the coarse matrix, operator by operator. -/
theorem liftKind_coarse_all (c : Classification TransformationKind) :
    ∀ op, c.liftKind.coarse op = c.coarse (operatorKind op) :=
  fun op => Classification.liftKind_coarse c op

end

end SE.Persistence
