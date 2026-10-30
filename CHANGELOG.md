# Changelog

<!-- markdownlint-disable MD024 -->

All notable changes to this project will be documented in this file.

The format is based on **[Keep a Changelog](https://keepachangelog.com/en/1.1.0/)**
and this project adheres to **[Semantic Versioning](https://semver.org/spec/v2.0.0.html)**.

---

## [Unreleased]

---

## [0.2.1] - 2026-10-30

### Updated

- Updated the Lean toolchain (see `lean-toolchain`).
- `rel.ps1`: added `lake clean`, `CITATION.cff` validation, and Markdown lint.
- `ci-lean.yml`: added `CITATION.cff` validation, SE manifest validation,
  Markdown lint, and cancellation of superseded runs on the same branch.
- `leanchecker` and the axiom audit are skipped in this repo because it
  depends on other SE theory packages. A source scan for `axiom`
  declarations and `native_decide` runs instead.

---

## [0.2.0] - 2026-10-26

### Updated

- moved out lint/
- minor documentation updates
- partial uvx pup-up of supporting files
- clarifications
- Updated license notice.
- Added headers to Lean files.
- updated available GitHub action versions
- updated lakefile dep versions

---

## [0.1.1] - 2026-10-24

### Updated

- Clarified the unresolved application-level interpretation bridge
  between observed operations, Transformation dimensions, and
  warranted referent identity.
- Updated to newer lake dependency versions
- Updated some GitHub action dependency versions
- Updated minor annotations
- Added new items to reference/

---

## [0.1.0] - 2026-10-16

### Added

- Initial Lean 4 formalization of the Transformation–Persistence bridge under `SE.TransformationPersistence`.
- `Lift` module for classification lifting along Transformation's family and kind taxonomy.
- `Observer` module connecting Transformation effect dimensions with Persistence presentations and observational soundness.
- `Conformance` module with regression guards for classification lifting.
- Dependencies on Transformation and Persistence.
- Public Lean import surface, reference registries, citation identifiers, and Lean tests.
- Repository manifest, CI workflows, and generated documentation infrastructure.

---

## Notes on versioning and releases

- We use **SemVer**:
  - **MAJOR** - breaking changes
  - **MINOR** - backward-compatible additions
  - **PATCH** - fixes, documentation, tooling
- Versions are driven by git tags.
- Tag `vX.Y.Z` to release.
- During `0.x` development, breaking formal-surface changes
  may occur in a **MINOR** release.

## Release Procedure (Required)

Follow these steps exactly when creating a new release.

### Optional: One-Time Zenodo Authorization

1. Sign in to Zenodo.
2. Open your profile menu in the upper-right.
3. Select GitHub.
4. Click Sync now.
5. Find structural-explainability/ this repo.
6. Turn on the repository toggle/slider.
7. Refresh the page and confirm it appears as enabled.
8. Zenodo will ingest future GitHub Releases from this repo.

### Task 1. Update release metadata (manual edits)

1.1. CITATION.cff: update version and date-released
1.2. lakefile.toml: update version
1.3. CHANGELOG.md: add section, move unreleased entries, update links
1.4. pyproject.toml: update version (near top of the file)
1.5. .github/workflows/deploy-zensical-lean.yml (optional temporary version in BB1)

### Task 2. Set up and Validate

```pwsh
# set up or update Python environment
# Run repository checks.
.\sit.ps1

# Update GitHub Actions and pin all action references to immutable SHAs.
uvx gha-tools autoupdate --pin=all --write .github/workflows

# Audit the resulting GitHub configuration for security findings.
# NO .github\workflows\deploy-zensical.yml
# YES  .github\workflows\deploy-zensical-lean.yml
uvx zizmor@latest .github/
# some suppressed is still okay

# Validate.
uvx cffconvert --validate
uvx se-manifest-schema validate-manifest --strict

# Format Markdown.
npx markdownlint-cli2 --fix

.\rel.ps1
.\sit.ps1
```

Review all generated and modified files before committing.

### Task 3. Commit and Push

```shell
git add -A
git commit -m "Prep X.Y.Z"
git push -u origin main
```

Verify that all required GitHub Actions complete successfully.

### Task 4. Tag and Push the Release

After the required GitHub Actions succeed:

```shell
git tag vX.Y.Z -m "X.Y.Z"
git push origin vX.Y.Z
```

Create GitHub Release after pushing tag, for example with a command like this:

```shell
gh release create v0.2.1 --verify-tag --title "0.2.1"  --generate-notes
```

## Only As Needed (delete a tag)

```shell
git tag -d vX.Z.Y
git push origin :refs/tags/vX.Z.Y
```

## Links

[Unreleased]: https://github.com/structural-explainability/se-theory-transformation-persistence/compare/v0.2.1...HEAD
[0.2.1]: https://github.com/structural-explainability/se-theory-transformation-persistence/releases/tag/v0.2.1
[0.2.0]: https://github.com/structural-explainability/se-theory-transformation-persistence/releases/tag/v0.2.0
[0.1.1]: https://github.com/structural-explainability/se-theory-transformation-persistence/releases/tag/v0.1.1
[0.1.0]: https://github.com/structural-explainability/se-theory-transformation-persistence/releases/tag/v0.1.0
