# Research Doubts and Open Questions

This document records the current research assessment,
known limitations, unresolved questions, and safeguards
against overclaiming for this theory.

For the three research criteria, doubt classifications,
status definitions, and procedures, see the
[SE Research Doubts Standard](https://raw.githubusercontent.com/structural-explainability/.github/refs/heads/main/docs/en/research/doubts.md).

## Repository Summary

This assessment is a summary of the present evidence.

| Criterion                | Current assessment                                                                                                                                                                                                                                          |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Mathematical Correctness | Formal results are established under stated hypotheses, relative to a supplied Transformation state model, Persistence classification, and selected effect dimensions. Presentation soundness is conditional. Presentation completeness is not established. |
| Scientific Adequacy      | Not established. Four application-level obligations remain unresolved by this bridge.                                                                                                                                                                       |
| Theoretical Contribution | The proposed contribution is a bridge between the two theories: classification lifting along the Transformation taxonomy and dimension-based observation of Transformation state models. No related-work discussion is recorded in this repository.         |

The doubts below identify specific issues affecting these assessments.

---

<!-- markdownlint-disable MD024 -->

## Register 1. Doubts About Assumptions (Undermining Doubts)

These questions concern the premises of an argument.
Even if a theorem is correctly proved, can we establish the assumptions necessary to apply it?

### UM-001. (OPEN) Mapping Observations to Operators and Dimensions

#### Research criterion

Scientific Adequacy

#### Concern

Which modeled operator represents an observed real-world operation, and which dimension represents an observed field?

#### Current Knowledge

The bridge assumes no universal interpretation mapping.

#### Remaining Work

A concrete application must justify each mapping independently.

### UM-002. (OPEN) Adequacy of the State Model

#### Research criterion

Scientific Adequacy

#### Concern

Do the state-model laws, footprints, and required-change clauses describe the observed transformations?

#### Current Knowledge

The observer results are relative to the supplied state model and selected dimensions.

#### Remaining Work

A concrete application must justify the model for its transformations.

### UM-003. (OPEN) Persistence Classification for the Referent Kind

#### Research criterion

Scientific Adequacy

#### Concern

Is the supplied classification appropriate for the intended referent kind?

#### Current Knowledge

No substantive referent-identity criterion is assumed.

#### Remaining Work

A concrete application must justify the classification.

## Register 2. Doubts About Conclusions (Rebutting Doubts)

These questions concern whether a claimed conclusion is false.
For example, a counterexample satisfying all the premises
but violating the conclusion would challenge the claimed theorem or its formalization.
A model that violates a required assumption does not
necessarily refute a conditional theorem.
If a counterexample is found,
we must identify the exact claim it challenges and
whether its assumptions are satisfied.

**None currently identified.**

## Register 3. Doubts About What Our Results Mean (Undercutting Doubts)

These questions concern the connection
between a formal theorem and the scientific claim made about it.
A theorem may be correct while its informal interpretation is too strong.
Some of these doubts are addressed by permanent documentation
rules rather than additional proofs.

### UC-001. (STANDING RULES) Agreement on Dimensions Is Not Referent Identity

#### Research criterion

Scientific Adequacy

#### Concern

A reader might read agreement on observed dimensions as identity.

#### Current Knowledge

Distinct referents may agree on all selected dimensions.

#### Standing Rules

1. Do not present agreement on selected dimensions as establishing referent identity.
2. State the state model, classification, and dimension set with every observer result.

### UC-002. (STANDING RULES) Soundness and Completeness

#### Research criterion

Mathematical Correctness

#### Concern

A reader might read presentation soundness as unconditional, or completeness as established.

#### Current Knowledge

`presentationSound_observe_iff` and `presentationSound_of_disjoint` give soundness under conditions.
`detectsBreaks_maximal_iff` is a model-specific break-detection result.
Presentation completeness and scientific adequacy are not established.

#### Standing Rules

1. State the conditions with every soundness result.
2. Do not present completeness as established.

<!-- markdownlint-enable MD024 -->
