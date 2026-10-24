# SE Theory: Transformation Persistence

[![Docs Site](https://img.shields.io/badge/docs-site-blue?logo=github)](https://structural-explainability.github.io/se-theory-transformation-persistence/)
[![Repo](https://img.shields.io/badge/repo-GitHub-black?logo=github)](https://github.com/structural-explainability/se-theory-transformation-persistence)
[![Tooling](https://img.shields.io/badge/python-3.15%2B-blue?logo=python)](./pyproject.toml)
[![License](https://img.shields.io/badge/license-MIT-yellow.svg)](./LICENSE)

[![CI-Lean](https://github.com/structural-explainability/se-theory-transformation-persistence/actions/workflows/ci-lean.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-theory-transformation-persistence/actions/workflows/ci-lean.yml)
[![CI](https://github.com/structural-explainability/se-theory-transformation-persistence/actions/workflows/ci-python-zensical.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-theory-transformation-persistence/actions/workflows/ci-python-zensical.yml)
[![Docs](https://github.com/structural-explainability/se-theory-transformation-persistence/actions/workflows/deploy-zensical-lean.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-theory-transformation-persistence/actions/workflows/deploy-zensical-lean.yml)
[![Links](https://github.com/structural-explainability/se-theory-transformation-persistence/actions/workflows/links.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-theory-transformation-persistence/actions/workflows/links.yml)

> Lean 4 formalization connecting Transformation and Persistence
> theory for Structural Explainability (SE).

This repository connects the two foundational theories through
classification lifting and dimension-based observation.

It consumes the definitions and results owned by Transformation and
Persistence without redefining their semantics.

For the full documentation, see [`docs/en/index.md`](./docs/en/index.md).

## Authority

Lean source files are authoritative for formal definitions, predicates, axioms,
theorems, proof obligations, and reference rules.

Reference artifacts under `reference/` and generated artifacts under
`data/transformation-persistence/` mirror the Lean public surface.
They do not define theory semantics independently of Lean.

## Import

Downstream Lean projects should import the public surface:

```text
import SE.TransformationPersistence
```

The public import surface is curated in:

```text
SE/TransformationPersistence.lean
```

## Developer

Maintain:

- `lakefile.toml`
- `lean-toolchain`
- `reference/theory-reference.toml` - hand-maintained configuration
- `reference/*.toml` - reference source artifacts
- Lean source + RR comments - hand-maintained theory source

### Clone and Open Project in VS Code

Open a machine terminal where you want the project:

```powershell
git clone https://github.com/structural-explainability/se-theory-transformation-persistence

cd se-theory-transformation-persistence
code .
```

### Setup and Run

Use VS Code Menu:
View / Command Palette / `Developer: Reload Window` to refresh.

```powershell
.\sit.ps1
.\rel.ps1

# inspect shared theory-reference command surface
uvx se-theory-reference-kit@latest --help
uvx se-theory-reference-kit@latest validate --help
uvx se-theory-reference-kit@latest scaffold --help
uvx se-theory-reference-kit@latest export --help
uvx se-theory-reference-kit@latest catalog --help
uvx se-theory-reference-kit@latest inspect --help

# validate reference artifacts against the declared Lean public surface
uvx se-theory-reference-kit@latest validate
uvx se-theory-reference-kit@latest validate --strict

# scaffold reference artifacts from Lean public declarations
uvx se-theory-reference-kit@latest scaffold
uvx se-theory-reference-kit@latest scaffold --dry-run
uvx se-theory-reference-kit@latest scaffold --overwrite

# regenerate or check generated JSON artifacts from reference TOML
uvx se-theory-reference-kit@latest export
uvx se-theory-reference-kit@latest export --check

# build or verify the generated reference catalog
uvx se-theory-reference-kit@latest catalog
uvx se-theory-reference-kit@latest catalog --check

# inspect resolved repository configuration and reference declarations
uvx se-theory-reference-kit@latest inspect

# validate SE manifest file
uvx se-manifest-schema validate-manifest --path SE_MANIFEST.toml --strict

# save progress
git add -A
git commit -m "update"
git push -u origin main
```

## Authority Manifest

[.accountability/surfaces.toml](./.accountability/surfaces.toml)

## Changelog

[CHANGELOG.md](./CHANGELOG.md)

## Citation

[CITATION.cff](./CITATION.cff)

## Documentation

[Documentation](https://structural-explainability.github.io/se-theory-transformation-persistence/)

## License

[MIT](./LICENSE)

## Repository Manifest

[SE_MANIFEST.toml](./SE_MANIFEST.toml)
