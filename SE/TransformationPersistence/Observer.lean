/-
Copyright (c) 2026 Denise M. Case. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Denise M. Case
-/
module

public import SE.Persistence.Relation.Observability
public import SE.Transformation.Effect.Model

set_option autoImplicit false

/-!
# Observers over Transformation Dimensions

SE.TransformationPersistence.Observer

An observer that sees a set `S` of Transformation dimensions presents each
configuration of a state model by its values on `S`. This module relates that
presentation to a persistence classification of the operators.

Three questions are answered, each at the level of dimensions:

- when is the `S`-presentation sound for a classification (identity-related
  configurations have equal presentations)?
  Exactly when every step of every preserving operator agrees on `S`
  (`presentationSound_observe_iff`);
- when does that follow from the footprints alone?
  When `S` avoids the footprint of every preserving operator
  (`presentationSound_of_disjoint`);
- in the maximal model, when is the converse true, and when does an observer
  see every step of every breaking operator?
  Soundness holds exactly when `S` avoids those footprints
  (`presentationSound_observe_maximal_iff`), and every step of a breaking
  operator is seen exactly when `S` contains a whole required clause
  (`detectsBreaks_maximal_iff`).

Scope. The model-specific statements are about `maximalModel`, which assumes
only the frame law and the change law. Soundness is relative to the supplied
classification; this module does not say which classification is correct.
Completeness of an `S`-presentation is not treated here.
-/

namespace SE.TransformationPersistence

open SE.Persistence SE.Transformation

@[expose] public section

-- RR.DEFINES: TP.DEF.DYNAMICS_OF
/-- The operator dynamics of a state model: its atomic steps. -/
def dynamicsOf (M : StateModel) : Dynamics OperatorCode M.State where
  step := M.step

-- RR.DEFINES: TP.DEF.AGREES_ON
/-- Two configurations agree on every dimension in `S`. -/
def AgreesOn (M : StateModel) (S : List Dimension) (s t : M.State) : Prop :=
  ∀ d, d ∈ S → M.agree d s t

-- RR.DEFINES: TP.DEF.OBSERVER_SETOID
/-- Agreement on `S` is an equivalence on configurations. -/
def observerSetoid (M : StateModel) (S : List Dimension) : Setoid M.State where
  r := AgreesOn M S
  iseqv :=
    ⟨fun s d _ => (M.agree_equiv d).refl s,
     fun h d hd => (M.agree_equiv d).symm (h d hd),
     fun h1 h2 d hd => (M.agree_equiv d).trans (h1 d hd) (h2 d hd)⟩

-- RR.DEFINES: TP.DEF.OBSERVE
/-- The presentation of a configuration by an observer that sees exactly the
dimensions in `S`: its class under agreement on `S`. -/
def observe (M : StateModel) (S : List Dimension) :
    M.State → Quotient (observerSetoid M S) :=
  Quotient.mk (observerSetoid M S)

-- RR.DEFINES: TP.THM.OBSERVE_EQ_IFF
/-- Equal presentations are exactly agreement on the observed dimensions. -/
theorem observe_eq_iff (M : StateModel) (S : List Dimension) (s t : M.State) :
    observe M S s = observe M S t ↔ AgreesOn M S s t :=
  ⟨fun h => Quotient.exact h, fun h => Quotient.sound h⟩

-- RR.DEFINES: TP.THM.PRESENTATION_SOUND_OBSERVE_IFF
/-- The `S`-presentation is sound for `c` exactly when every step of every
preserving operator agrees on `S`. -/
theorem presentationSound_observe_iff (M : StateModel)
    (c : Classification OperatorCode) (S : List Dimension) :
    c.PresentationSound (dynamicsOf M) (observe M S) ↔
      ∀ op, c.IsPrs op → ∀ s t, M.step op s t → AgreesOn M S s t := by
  constructor
  · intro h op hop s t hst
    exact (observe_eq_iff M S s t).1 (h s t (Generated.rel ⟨op, hop, hst⟩))
  · intro h x y hxy
    unfold Classification.identityRel at hxy
    induction hxy with
    | rel hr =>
      obtain ⟨op, hop, hst⟩ := hr
      exact (observe_eq_iff M S _ _).2 (h op hop _ _ hst)
    | refl _ => rfl
    | symm _ ih => exact ih.symm
    | trans _ _ ih1 ih2 => exact ih1.trans ih2

-- RR.DEFINES: TP.THM.PRESENTATION_SOUND_OF_DISJOINT
/-- Footprint criterion: if `S` avoids the footprint of every preserving
operator, the `S`-presentation is sound. This holds in every state model, by
the frame law. -/
theorem presentationSound_of_disjoint (M : StateModel)
    (c : Classification OperatorCode) (S : List Dimension)
    (h : ∀ op, c.IsPrs op → ∀ d, d ∈ S → d ∉ footprint op) :
    c.PresentationSound (dynamicsOf M) (observe M S) :=
  (presentationSound_observe_iff M c S).2 fun op hop _ _ hst d hd =>
    M.frame hst d (h op hop d hd)

/-- A step of `op` in the maximal model that changes every dimension of the
footprint. -/
private theorem maximalModel_step_footprint (op : OperatorCode) :
    maximalModel.step op (fun _ => 0)
      (fun d => if d ∈ footprint op then 1 else 0) := by
  refine ⟨?_, ?_⟩
  · intro d hd
    simp [hd]
  · intro C hC
    obtain ⟨d, hd⟩ := List.exists_mem_of_ne_nil C (requirements_clause_ne_nil hC)
    exact ⟨d, hd, by simp [requirements_subset_footprint hC hd]⟩

-- RR.DEFINES: TP.THM.MAXIMAL_MODEL_AGREES_IFF_DISJOINT
/-- In the maximal model, every step of `op` agrees on `S` exactly when `S`
avoids the footprint of `op`. -/
theorem maximalModel_agrees_iff_disjoint (op : OperatorCode)
    (S : List Dimension) :
    (∀ s t, maximalModel.step op s t → AgreesOn maximalModel S s t) ↔
      ∀ d, d ∈ S → d ∉ footprint op := by
  constructor
  · intro h d hd hfp
    have hag := h _ _ (maximalModel_step_footprint op) d hd
    simp [maximalModel, hfp] at hag
  · intro h s t hst d hd
    exact maximalModel.frame hst d (h d hd)

-- RR.DEFINES: TP.THM.PRESENTATION_SOUND_OBSERVE_MAXIMAL_IFF
/-- In the maximal model, the `S`-presentation is sound for `c` exactly when
`S` avoids the footprint of every preserving operator. -/
theorem presentationSound_observe_maximal_iff
    (c : Classification OperatorCode) (S : List Dimension) :
    c.PresentationSound (dynamicsOf maximalModel) (observe maximalModel S) ↔
      ∀ op, c.IsPrs op → ∀ d, d ∈ S → d ∉ footprint op := by
  rw [presentationSound_observe_iff]
  constructor
  · intro h op hop
    exact (maximalModel_agrees_iff_disjoint op S).1 (h op hop)
  · intro h op hop
    exact (maximalModel_agrees_iff_disjoint op S).2 (h op hop)

-- RR.DEFINES: TP.THM.DETECTS_BREAKS_MAXIMAL_IFF
/-- In the maximal model, an `S`-observer sees every step of every breaking
operator exactly when, for each breaking operator, `S` contains a whole
required clause of it. -/
theorem detectsBreaks_maximal_iff
    (c : Classification OperatorCode) (S : List Dimension) :
    (∀ op, c.IsBrk op → ∀ s t, maximalModel.step op s t →
        ¬ AgreesOn maximalModel S s t) ↔
      ∀ op, c.IsBrk op →
        ∃ C, C ∈ requirements op ∧ ∀ d, d ∈ C → d ∈ S := by
  constructor
  · intro h op hop
    exact (maximalModel_breaks_agreementOn_iff op S).1 (h op hop)
  · intro h op hop
    exact (maximalModel_breaks_agreementOn_iff op S).2 (h op hop)

end

end SE.TransformationPersistence
