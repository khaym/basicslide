# design-guideline Design Doc

## Purpose

Provide reusable design principles for presentation slides so that slide-gen (and future agents) can make design decisions based on established rules rather than ad-hoc judgment. This is the "what makes it good" knowledge, separated from the "how to generate" procedure.

## Design Decisions

| Decision | Rationale |
|---|---|
| Perceptual (Gestalt) + strategic principles as core doctrine | Slides are not interactive; web UX heuristics (Nielsen H1-H10) don't map cleanly to passive projected viewing. Perception principles (Figure-Ground, Proximity, Similarity, Continuation) describe how the eye reads any visual layout and apply directly. |
| Three reference files (judgment + rules + patterns) split by reader role | Agents load multiple files into context regardless, so inter-file references between co-loaded files have no token cost benefit — but file size disparity hurts cohesion. judgment.md owns "why a design works" (philosophy + principles + anti-patterns); rules.md owns "what values to use" (tokens + applied rules + accessibility); patterns.md owns "how to structure HTML and what Marp won't render" (layout patterns + CSS rendering constraints). Each file is single-genre and balanced in size. |
| SKILL.md as thin entry | A 1-paragraph overview plus pointers to the three reference files. Skills convention requires SKILL.md as the entry point with frontmatter; keeping it minimal avoids duplicating the philosophy already in judgment.md. |
| Anti-patterns in judgment.md, not rules.md | Anti-patterns are about identifying bad design, not applying a value or structure. They sit naturally with the principles that explain *why* the patterns are bad (Figure-Ground violation, Hierarchy collapse, fake Unity). |
| HTML patterns and Marp constraints together in patterns.md | Both are concrete implementation guidance — what HTML to use, what CSS won't render. They share the same reader moment (worker writing layout CSS) and the same evaluator audience (worker only — evaluator does not need them). Splitting them across files would force the worker to read both for any layout decision. |
| Evaluator skips patterns.md | Patterns are about HTML structure and CSS rendering — worker concerns. The evaluator scores the rendered result; how it was structured in source is not part of evaluation. |
| Slides are not interactive | Buttons, transitions, breakpoints, touch targets, and link states are excluded. Web UX heuristics don't map to passive projected viewing. |
| Motif Intensity as Elevation | Visual boldness maps to information hierarchy, the same way shadow-based elevation does in web. Bespoke shapes in the slide's `style` block are preferred over pre-built motif classes. |
| Whitespace is a design choice, not a defect | Generous whitespace is valid for luxury, statement, or contemplative tones. Only readability (font size, contrast) is enforced. Penalizing whitespace as "unused space" degrades these tones. |
| No count-based content limits | The 22px font minimum already prevents overcrowding. "Max 5 bullets" rules cause mechanical over-splitting when bullets are short and fit easily. |
| Vertical Balance rule centers sparse content | When total content height is less than ~60% of the viewport, vertically center the content group rather than top-aligning. Prevents top-heavy "inverted triangle" density. The rule governs *positioning* (where to place sparse content), not *volume* (forcing content to fill). |
| Anti-Patterns enumerated concretely | Principles alone do not prevent component-level single-edge borders and similar patterns; concrete examples are needed to catch them. judgment.md keeps the philosophical framing alongside the concrete catch-list. |

## Data Flow

```
SKILL.md (thin entry — points to the three reference files)
  ↓
judgment.md (Bold philosophy + perceptual + strategic principles + anti-patterns)
  ↓ applied as
rules.md (color, typography, spacing, elevation, layout, deck composition,
          editorial, accessibility)
  ↓ implemented via
patterns.md (HTML layout patterns + Marp CSS rendering constraints)
  ↓ token values sourced from
themes/basicslide.css (CSS token definitions)
```

Consumers:

- slide-gen-worker agent — reads all four (SKILL + judgment + rules + patterns)
- slide-evaluator agent — reads three (SKILL + judgment + rules); patterns.md is worker-only
- slide-gen orchestrator skill — references this skill via `design_guideline_dir`
- Human designers

## Constraints & Tradeoffs

| Constraint | Impact | Mitigation |
|---|---|---|
| Marp's fixed 1280x720 viewport | Cannot test responsive layouts | Not needed — projection is single-size. Theme tokens are calibrated for this viewport. |
| No interactivity in slides | Web UX heuristics (Nielsen) don't map to passive viewing | Replaced with perceptual + strategic principles that apply to any visual composition regardless of medium |
| rules.md duplicates some theme CSS values | Values may drift if theme changes | Theme CSS is the source of truth. rules.md is documentation, not enforcement. |
| Worker reads four files; evaluator reads three | More cold-start tokens than a 1-file skill | Each file is single-genre and self-contained at ~250 lines, so the trade buys cohesion + reviewability |
