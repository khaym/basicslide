# Changelog

All notable changes to **basicslide** are documented here.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and the project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.0] - 2026-04-26

### Added
- `design-guideline/judgment.md` — bold design philosophy, Gestalt perceptual principles (Figure-Ground, Proximity, Similarity, Good Continuation), strategic principles (Hierarchy, Contrast, Rhythm, Unity), and an anti-patterns catch-list.
- `design-guideline/patterns.md` — HTML layout patterns (Parallel, Comparison, Flow, Metric, Data, Structural, Bespoke shapes) and Marp CSS rendering constraints.
- `agents/slide-evaluator/design.md` — design rationale for the evaluator SubAgent (Purpose / Decisions / Data Flow / Constraints).
- `disciplined-variation` rule under the Unity principle — recurring visual devices must be fixed across instances or vary along one axis with intent.

### Changed
- `design-guideline` restructured into reader-role-aligned files (`SKILL.md` + `judgment.md` + `rules.md` + `patterns.md`) replacing the previous Nielsen-derived single-file reference.
- `slide-evaluator` now reads `design-guideline` at runtime as a shared evaluation foundation; tone-aware evaluation is now an explicit section to prevent over-flagging luxury whitespace and soft-tone contrast.
- `slide-gen-worker` Bespoke Visual Design Checklist item #8 replaced "70–90% viewport utilization" rule with **Vertical Balance** guidance — whitespace volume is a tone-driven design choice, not a fill target.
- Phase 1 design-thinking simplified: tone is captured as a concrete metaphor (e.g. "Weekend Broadsheet") rather than CSS-level specifications. Coherence check ("can you guess the tone from font/color/spacing alone?") added.
- Font-size pre-check is now a hard gate before evaluation — failed states no longer waste an evaluator cycle.

### Fixed
- Removed self-contradicting whitespace policy between worker checklist and design-guideline.
- Removed cross-skill heading-name references that would break on guideline restructuring.
- Lead Budget formula is documented once in `rules.md` (Single Source of Truth) instead of being duplicated in the worker.
- Added Marp CSS constraint: `flex: 1` on flex items can collapse to zero width inside the section flex context.

### Documentation
- `README` skill description now reflects the bold-philosophy + perceptual + strategic structure (previously labelled as Nielsen heuristics).

## [1.1.0] - 2026-04-15

Initial public release.

- `slide-gen` skill — interactive design thinking (tone, UNFORGETTABLE element, visual concept) + refinement loop.
- `slide-gen-worker` SubAgent — generates Marp markdown with bespoke per-deck CSS; reads design-guideline at runtime; never reads existing slides (anti-anchoring).
- `slide-evaluator` SubAgent — 4-axis scoring (Cohesion & Rhythm, Purpose Alignment, Craft, Narrative Flow) with minimum 3/5 to pass.
- `design-guideline` skill — visual rules and slide-design principles.
- Bundled `basicslide` Marp theme (DADS-derived design tokens, projection-tuned typography scale, structural skeletons only — no visual personality).
- Build helpers (`build-one.sh`, `check-font-size.sh`) and `marp.config.mjs` template; auto-installed on first run via the orchestrator's environment check.
- Sample outputs and design briefs (Braun Design Manual, Concrete Brutalism Poster).

[1.2.0]: https://github.com/khaym/basicslide/releases/tag/v1.2.0
[1.1.0]: https://github.com/khaym/basicslide/releases/tag/v1.1.0
