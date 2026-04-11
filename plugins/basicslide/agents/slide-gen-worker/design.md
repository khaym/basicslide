## Purpose

Generate a single Marp presentation with bespoke visual identity from a design brief. Runs as a Custom SubAgent to ensure context isolation (no anchoring from existing slides) and consistent execution with restricted tools.

## Design Decisions

| Decision | Rationale |
|---|---|
| Custom SubAgent (not Built-in) | Repeatedly invoked by slide-gen orchestrator. Needs tool restriction (Read/Write/Edit/Bash/Glob/Grep only), model selection (sonnet), and embedded procedure. |
| model: sonnet | CSS generation is pattern-heavy, not reasoning-heavy. Sonnet provides sufficient quality at lower cost. |
| maxTurns: 17 | Covers Phase 0 reads (4), file write (1), iterative build-fix (up to 10), output (1), with margin. Environment check moved to orchestrator. |
| NEVER read existing slides | Prevents design anchoring — worker produced structurally similar output when it could see prior designs. Confirmed by v4→v5 anchoring test. |
| Phase 0 reads design-guideline | Worker needs shared design vocabulary (tokens, patterns, anti-patterns) to produce guideline-compliant CSS. Without it, evaluator and worker disagree on terminology. |
| Content Fidelity rule (2026-04) | Recruitment slide test: worker changed founding year, capital, omitted CEO name despite explicit data in the brief. Root cause: worker treated provided content as "inspiration" rather than source of truth. Fix: Allowed/NOT Allowed table making the boundary explicit — worker owns layout decisions, user owns factual content. |
| Allowed/NOT Allowed table format | Prescriptive (low freedom level) because content fidelity violations are high-impact and hard to detect without manual review. A table is unambiguous. |
| Build via `npm run build:one` | Project has marp.config.mjs with inputDir, which conflicts with single-file builds. `build:one` script wraps `marp --no-config --theme-set themes/ --html --images png --image-scale 1`. |

## Data Flow

```
Design brief (from orchestrator)
  → Phase 0: Read design-guideline (3 files) + basicslide.css
  → Phase 1: Generate Marp Markdown
     ├── Map content to slides (layout + component selection)
     ├── Write bespoke CSS (100-200+ lines) in frontmatter style block
     └── Preserve all factual content from brief (Content Fidelity)
  → Phase 2: Build PNGs (marp --images png)
  → Phase 3: Return file path, PNG paths, role map, design summary
```

## Constraints & Tradeoffs

| Constraint | Impact | Mitigation |
|---|---|---|
| No access to existing slides | Cannot learn from prior successes in this project | Design-guideline + CSS technique reference embedded in agent.md |
| sonnet model | May produce less creative designs than opus | Acceptable tradeoff — design creativity is guided by orchestrator's brief |
| Content Fidelity vs slide readability | Long prose must fit on slides | Allowed: shortening prose to bullet points, splitting across slides. NOT allowed: dropping or fabricating content |
| 17-turn limit | Complex builds with errors may exhaust turns | Phase 0 uses ~4 turns, leaving ~13 for generation and build-fix |
