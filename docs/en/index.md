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

The authoritative definitions, theorem statements, proofs, and
limitations are documented in the Lean source files.

- **`SE.TransformationPersistence.Lift`** - Classification lifting along the Transformation taxonomy.
- **`SE.TransformationPersistence.Observer`** - Presentations and observation over Transformation dimensions.
- **`SE.TransformationPersistence.Conformance`** - Regression guards for classification lifting.

See the [Lean API Reference](https://structural-explainability.github.io/se-theory-transformation-persistence/lean/) for the public declarations.

## Application Interpretation Boundary

The formal observer results are relative to a supplied Transformation
state model, Persistence classification, and selected effect dimensions.
They establish mathematical relationships under those assumptions.
They do not establish that the assumptions correctly describe an
intended real-world referent.

A concrete application must independently justify:

- which modeled operator represents an observed real-world operation;
- which Transformation dimension represents an observed field;
- whether the state-model laws, footprints, and required-change
  clauses adequately describe the observed transformations;
- whether the supplied persistence classification is appropriate
  for the intended referent kind.

Agreement on observed dimensions does not independently establish
referent identity.
Distinct referents may agree on all selected dimensions.
The Observer theory establishes conditional presentation soundness and
model-specific break-detection results, but does
not establish presentation completeness or scientific adequacy.

These application-level interpretation and grounding obligations
remain unresolved by this bridge theory.
No universal interpretation mapping or
substantive referent-identity criterion is assumed.

## Owns

This repository owns:

- the public import surface `SE/TransformationPersistence.lean`
- the repository-level aggregator `SE.lean`
- the `SE/TransformationPersistence/` module family
- reference artifacts under `reference/`
- generated artifacts under `data/transformation-persistence/`

## Design Constraints

Lean source files are authoritative for formal semantics and proofs.

Reference registries describe the registered public surface and
must correspond to that Lean surface.

Python and generated data may mirror, validate, export, or document the Lean surface.
They must not define theory semantics independently of Lean.

## Documentation Constraints

Documentation provides orientation, summaries, and navigation.

It must not introduce or duplicate formal semantics maintained in Lean.

Machine-readable artifacts mirror the Lean surface and reference registries
under `data/transformation-persistence/`.

## Import

`import SE.TransformationPersistence`

## Tooling

Python and other tooling may be used for documentation generation,
formatting, linting, repository automation, reference validation, and
generated artifact checks.

Tooling must not replace Lean definitions or proofs or
independently define theory semantics.
