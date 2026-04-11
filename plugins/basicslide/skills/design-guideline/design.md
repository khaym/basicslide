## Purpose

Provide reusable design principles for presentation slides so that slide-gen (and future agents) can make design decisions based on established rules rather than ad-hoc judgment. This is the "what makes it good" knowledge, separated from the "how to generate" procedure.

## Design Decisions

| Decision | Rationale |
|---|---|
| Adapted from wbsgantt design-guideline, not copied | Web-app heuristics (buttons, transitions, touch targets, breakpoints) don't apply to slides. Projection context requires reinterpretation. |
| Nielsen H1-H10 reinterpreted for audience/presenter | The "user" of a presentation is the audience (passive viewer) and the presenter (navigator). Heuristics are adapted to this dual role. |
| Dropped: Buttons, Transitions, Breakpoints, Touch targets, Link states | Slides are not interactive. These sections add context cost without value. |
| Kept: Color economy, Typography, Spacing, Elevation | These apply directly to visual composition regardless of medium. |
| Added: Motif Intensity as Elevation | Mercari deck analysis insight — visual boldness maps to information hierarchy, same as shadow-based elevation in web. Pre-built motifs (motif-geometric etc.) moved to reference-only (2026-04); bespoke shapes in style block now preferred. |
| Split into SKILL.md + visual-rules.md | Principles (why) and values (what) serve different needs. SKILL.md for design decisions, visual-rules.md for token reference. |
| Single Source of Truth pattern | This skill is the authority on design principles. slide-gen handles procedure. No duplication between them. |
| Information Density focuses on overcrowding, not underfilling | A/B testing showed the evaluator penalizing generous whitespace as "unused space", causing fix cycles to degrade luxury/zen designs. Removed 70-90% viewport target. Whitespace is a design choice; only readability (font size, contrast) is enforced. |
| Removed count-based content limits (max 5 bullets, etc.) | Testing showed the worker mechanically splitting slides at 5 bullet points even when bullets were short and fit easily at 22px+. This created sparse slides with excessive whitespace. The 22px font minimum (Accessibility Baseline) already prevents overcrowding; count-based rules are redundant and cause over-splitting in text-heavy business content. |

## Data Flow

```
SKILL.md (principles: Nielsen H1-H10, accessibility)
  ↓ references
visual-rules.md (concrete values: color, typography, spacing, elevation)
  ↓ values sourced from
themes/basicslide.css (CSS token definitions)
```

Consumers: slide-gen skill, future review agents, human designers.

## Constraints & Tradeoffs

| Constraint | Impact | Mitigation |
|---|---|---|
| Marp's fixed 1280x720 viewport | Cannot test responsive layouts | Not needed — projection is single-size. Theme tokens are calibrated for this viewport. |
| No interactivity in slides | Many Nielsen heuristics assume interactive feedback | Heuristics reinterpreted for passive viewing context (H1=navigation awareness, H3=presenter control) |
| visual-rules.md duplicates some theme CSS values | Values may drift if theme changes | Theme CSS is the source of truth. visual-rules.md is documentation, not enforcement. |
