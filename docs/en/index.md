# SE Theory: Transformation Persistence

Lean 4 formalization connecting Transformation and Persistence theory for Structural Explainability.

This repository provides classification lifting and dimension-based observation using the foundational definitions of the two theories.

- [Lean API Reference](https://structural-explainability.github.io/se-theory-transformation-persistence/lean/)
- [GitHub Repository](https://github.com/structural-explainability/se-theory-transformation-persistence)

## Dependencies

This repository depends on:

- `se-theory-transformation`
- `se-theory-persistence`

Both theories retain ownership of their foundational definitions.

## Lean Modules

The authoritative definitions, theorem statements, proofs, and limitations are documented in the Lean source files.

- **`SE.TransformationPersistence.Lift`** — Classification lifting along the Transformation taxonomy.
- **`SE.TransformationPersistence.Observer`** — Presentations and observation over Transformation dimensions.
- **`SE.TransformationPersistence.Conformance`** — Regression guards for classification lifting.

See the [Lean API Reference](https://structural-explainability.github.io/se-theory-transformation-persistence/lean/) for the public declarations.

## Owns

This repository owns:

- the public import surface `SE/TransformationPersistence.lean`
- the repository-level aggregator `SE.lean`
- the `SE/TransformationPersistence/` module family
- reference artifacts under `reference/`
- generated artifacts under `data/transformation-persistence/`

## Design Constraints

Lean source files are authoritative for formal semantics and proofs.

Reference registries describe the registered public surface and must correspond to that Lean surface.

Python and generated data may mirror, validate, export, or document the Lean surface. They must not define theory semantics independently of Lean.

## Documentation Constraints

Documentation provides orientation, summaries, and navigation.

It must not introduce or duplicate formal semantics maintained in Lean.

Machine-readable artifacts mirror the Lean surface and reference registries under `data/transformation-persistence/`.

## Import

`import SE.TransformationPersistence`

## Tooling

Python and other tooling may be used for documentation generation, formatting, linting, repository automation, reference validation, and generated artifact checks.

Tooling must not replace Lean definitions or proofs or independently define theory semantics.
