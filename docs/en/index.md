# SE Theory: Transformation Persistence

> Lean 4 formalization connecting Transformation and
> Persistence theory for Structural Explainability.

This repository formalizes relationships between transformation
classifications, operator structure, and dimension-based observation.

Lean source files under `SE/` are authoritative for formal definitions,
predicates, assumptions, theorems, and proof obligations.

- [Lean API Reference](https://structural-explainability.github.io/se-theory-transformation-persistence/lean/)
- [GitHub Repository](https://github.com/structural-explainability/se-theory-transformation-persistence)
- [Research Doubts and Open Questions](https://github.com/structural-explainability/se-theory-transformation-persistence/blob/main/DOUBTS.md)
- [Research Decisions](https://github.com/structural-explainability/se-theory-transformation-persistence/blob/main/DECISIONS.md)

## Transformation Persistence

Transformation Persistence connects formal descriptions
of changes with classifications and observations
relevant to persistence.

The bridge supports classification lifting across
transformation descriptions and observation of
selected dimensions in modeled states.

Its results depend on supplied classifications,
transformation models, and observation assumptions.

These mathematical relationships do not independently
establish that modeled transformations correspond
to real-world operations or that observed agreement
establishes identity of intended referents.

## Scope

Repository scope is defined in `SE_MANIFEST.toml`.

## Exclusions

Repository exclusions are defined in `SE_MANIFEST.toml`.

## Import

Downstream Lean projects should import the public surface:

`import SE.TransformationPersistence`
