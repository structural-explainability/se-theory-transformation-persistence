module

public import SE.TransformationPersistence.Observer
public import SE.TransformationPersistence.Lift

set_option autoImplicit false

/-!
# Observer Checks

Concrete instances of the dimension-level soundness and detection criteria in
the maximal model.
-/

namespace SETest.TransformationPersistence

open SE.Persistence SE.Transformation SE.TransformationPersistence

/-- Only attribution (`AT`, which changes the `evidence` dimension) preserves
identity; every other operator is ignored. -/
@[expose] public def attributionOnly : Classification OperatorCode where
  pattern op := if op = OperatorCode.AT then some .prs else some .ign
  persist _ := False

-- An observer that sees no dimension is sound for every classification.
example (c : Classification OperatorCode) :
    c.PresentationSound (dynamicsOf maximalModel) (observe maximalModel []) :=
  (presentationSound_observe_maximal_iff c []).2 fun _ _ _ hd => absurd hd (by simp)

-- The footprint criterion holds in every state model.
example (c : Classification OperatorCode) (S : List Dimension)
    (h : ∀ op, c.IsPrs op → ∀ d, d ∈ S → d ∉ footprint op) :
    c.PresentationSound (dynamicsOf maximalModel) (observe maximalModel S) :=
  presentationSound_of_disjoint maximalModel c S h

-- If only attribution preserves, an observer of content, lineage and standing
-- is sound: the footprint of `AT` is the `evidence` dimension alone.
example :
    attributionOnly.PresentationSound (dynamicsOf maximalModel)
      (observe maximalModel
        [Dimension.content, Dimension.lineage, Dimension.standing]) := by
  rw [presentationSound_observe_maximal_iff]
  intro op hop
  cases op <;> first | exact absurd hop (by decide) | decide

-- An observer of evidence is not sound for that classification: `AT` changes
-- evidence and preserves.
example :
    ¬ attributionOnly.PresentationSound (dynamicsOf maximalModel)
      (observe maximalModel [Dimension.evidence]) := by
  rw [presentationSound_observe_maximal_iff]
  intro h
  exact h OperatorCode.AT (by decide) Dimension.evidence (by decide) (by decide)

end SETest.TransformationPersistence
