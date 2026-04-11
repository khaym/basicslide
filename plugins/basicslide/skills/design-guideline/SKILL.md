---
name: design-guideline
description: Provides design principles for presentation slides based on Nielsen's 10 Usability Heuristics and DADS visual rules, adapted for projected display context. Triggered by "design guideline", "デザインガイドライン", "design rules", "color tokens", "visual rules", "slide design principles".
---

# Design Guideline for Slides

Design principles for presentation slides, adapted from the Digital Agency Design System (DADS) and Nielsen's Usability Heuristics for projected display context (1280x720 viewport).

## Table of Contents

- [Design Decision Priority](#design-decision-priority)
- [Nielsen's 10 Heuristics for Slides](#nielsens-10-heuristics-for-slides)
- [Slide Space Design](#slide-space-design) — Overcrowding, Content Duplication, Element Relationships, Vertical Balance, Component Sizing, Horizontal Layout Alignment, Anti-Patterns
- [Accessibility Baseline](#accessibility-baseline)
- [Bold Design Principles](#bold-design-principles)
- [Reference Files](#reference-files)

---

## Design Decision Priority

1. **This document** — UX principles and space design adapted for presentation context
2. **Visual rules** ([visual-rules.md](visual-rules.md)) — Concrete values for color, typography, spacing, elevation
3. **`themes/basicslide.css`** — Source of truth for design token values

Never hard-code values that contradict the theme's CSS variables. Always work through the token system.

---

## Nielsen's 10 Heuristics for Slides

These heuristics are reinterpreted for presentation context — where the "user" is an audience member viewing projected content, not an interactive application user.

### H1: Visibility of System Status — Where am I in this presentation?

| Element | Rule |
|---|---|
| Page number | Always visible via `paginate: true` (except on title slides) |
| Section structure | Use `lead` slides selectively to mark key topic transitions (see Deck Composition in visual-rules.md) |
| Progress cues | Consistent heading hierarchy across slides signals continuity |
| Narrative arc | The sequence of slide titles should read as a coherent outline |

### H2: Match Between System and Real World — Speak the audience's language

| Principle | Rule |
|---|---|
| Domain language | Use terms the audience knows. Define jargon on first use |
| Natural reading order | Top-left to bottom-right. Heading → body → supporting detail |
| Familiar metaphors | Tables for comparison, lists for sequences, diagrams for relationships |

### H3: User Control and Freedom — Let the presenter navigate freely

| Principle | Rule |
|---|---|
| Self-contained slides | Each slide must be understandable without the previous slide's content |
| No forward dependencies | Don't write "as we'll see later" — the presenter may skip slides |
| Modular sections | Section dividers (`lead`) create natural break points for reordering |

### H4: Consistency and Standards — Same appearance means same meaning

| Principle | Rule |
|---|---|
| Visual consistency | Same `_class` for same role across the deck |
| Heading levels | h2 = slide title, h3 = subsection, h4 = label. Never skip levels |
| Component meaning | If `card` means "key takeaway" on slide 3, it must mean the same on slide 7 |
| Color meaning | One color per semantic role. Don't use the primary color for both emphasis and decoration |
| Grid/column balance | Multi-column layouts must have equal heights and aligned baselines. See [Horizontal Layout Alignment](#horizontal-layout-alignment) for detailed rules |

### H5: Error Prevention — Prevent misunderstanding before it happens

| Principle | Rule |
|---|---|
| Ambiguity | Every slide title must clearly state the slide's message |
| Data labels | Charts and tables must have labels. Never present unlabeled numbers |
| Units | Always specify units (%, px, hours, USD). Bare numbers invite misinterpretation |

### H6: Recognition Rather Than Recall — Make information visible, not memorized

| Principle | Rule |
|---|---|
| Self-explanatory slides | Don't rely on "as mentioned earlier" — repeat key context when needed |
| Visual anchors | Use color, icons, or badges to mark recurring concepts |
| Consistent structure | Predictable slide layouts reduce cognitive load |

### H7: Flexibility and Efficiency — Serve both skimmers and deep readers

| Principle | Rule |
|---|---|
| Progressive disclosure | Heading carries the message. Body adds evidence. Detail is optional |
| Scannable structure | Audience should get 80% of the message from headings + bold text alone |
| Layered information | Key message at top, supporting data below. Works at both 3-second and 30-second attention |

### H8: Aesthetic and Minimalist Design — Every element earns its place

| Principle | Rule |
|---|---|
| Information density | See [Overcrowding Detection](#overcrowding-detection) for rules on when to split slides |
| Color economy | Max 3 color roles per slide (primary, text, background). Additional colors need justification |
| Whitespace | Intentional gaps between elements create focus. See [Slide Space Design](#slide-space-design) for viewport-specific guidance |
| Decoration | Every visual element must serve an informational purpose. No decorative-only elements |

### H9: Clear Data, Clear Conclusions

| Principle | Rule |
|---|---|
| Data clarity | When presenting problems, also present the impact or scale |
| Actionable content | When presenting issues, include a path forward |
| Source attribution | Cite sources for claims. Unsourced statistics undermine credibility |

### H10: Support the Presenter

| Principle | Rule |
|---|---|
| Speaker notes | Use Marp's `<!-- speaker notes -->` for presenter guidance where helpful |
| Slide structure | A well-structured deck serves as its own documentation |

---

## Slide Space Design

Slides use a **fixed viewport (1280x720)**. Unlike web pages, there is no scroll — every pixel is a design decision. Web CSS habits cause systematic errors on slides.

### Web vs Slide

| Aspect | Web | Slide |
|---|---|---|
| Height | Content determines height. Page scrolls | Fixed 720px. What you see is everything |
| Empty space below content | Invisible — user scrolls past | Visible — every pixel is a conscious choice |
| Design direction | Content → padding → height emerges | **Available height → content placement → sizing** |
| Component sizing | Sized by content + padding | Sized relative to viewport |

### Overcrowding Detection

Slides have a fixed viewport — content must fit, and overcrowding destroys readability at projection distance.

| Problem | Signal | Fix direction |
|---|---|---|
| **Too dense** | Fonts shrink below minimum, no breathing room, content cut off at bottom | Split into 2 slides, or remove detail |
| **Content overflow** | Text or elements extend beyond the 720px viewport edge | Split the slide — never shrink fonts to fit |

**Rules** (H8: Aesthetic and Minimalist Design):
- If content forces body text below 22px, the slide has too much content. Split or remove detail.
- If content is cut off at the bottom edge of the viewport, the slide must be split.
- Do NOT split based on item count alone. Short bullet points or table rows can exceed typical counts if text remains readable at 22px+ and the slide does not feel cramped.

**Whitespace is a design choice, not a defect.** The amount of viewport a designer uses is determined by the presentation's tone and the slide's role — not by a target percentage. Statement slides, luxury/premium decks, and contemplative tones may use generous whitespace intentionally. Do not flag whitespace as "unused space" unless text is too small to read (which is a readability issue, not a space issue — see [Accessibility Baseline](#accessibility-baseline)).

### Content Duplication

When content is thin, structural slides (lead, number-wall, title, closing) tend to **duplicate information from adjacent slides**. This happens when a key fact is extracted into a statement slide for visual rhythm — but if the source content only has one or two facts, the statement slide ends up being a restatement of what's already on the next (or previous) slide.

| Signal | Example | Fix direction |
|---|---|---|
| Adjacent slides share the same key fact | Closing says "2027年予定 アルテミスIII" and the next number-wall shows "2027" with "アルテミスIII" | Merge into one slide, or ensure each slide adds **distinct** information the other doesn't have |
| Lead/divider restates the content slide that follows | Lead says "4つの技術実証" and the next slide lists the same 4 items with no additional context | Remove the lead, or give the lead a unique angle (e.g., a surprising framing, not a summary) |

**Rule**: Every slide must carry at least one piece of information that no other slide in the deck contains. If a slide's content is entirely a subset of an adjacent slide, it must be merged or cut. Visual variety (different layout, bigger font) does not justify content duplication — the audience sees the same words twice and the deck feels padded.

### Element Relationships

Space between elements expresses their relationship (see Spacing Principles in visual-rules.md).

| Relationship | Spacing | Example |
|---|---|---|
| Tightly related | Small gap (8-16px) | Label and its value, badge and heading |
| Same group | Medium gap (24-32px) | Heading to body, items within a card |
| Different groups | Large gap (40-64px) | Content block to decorative motif, section to section |

When improving space utilization, **never collapse the gaps between unrelated elements**. A motif and a content block are different groups — they need breathing room. Filling the viewport by cramming elements together degrades the design more than leaving space empty.

**Component external margins**: Custom components (`.metrics`, `.kpi-grid`, `.seg-grid`, `.strategy-list`, tables, etc.) must have **`margin-bottom: 32px` minimum** when followed by other content (paragraphs, lists, other components). The internal `gap` property handles spacing between items *within* the component; `margin-bottom` handles the gap *after* the component. Omitting `margin-bottom` causes the following content to collide with the component — this is the most common spacing error in generated slides.

### Vertical Balance (Content Gravity)

Content should sit at the **visual center or slightly above center** of the slide, not pinned to the top edge. When all content clusters in the top third with the bottom two-thirds empty, the slide feels top-heavy and unfinished — an "inverted triangle" density.

| Signal | Fix direction |
|---|---|
| Content occupies top 30-40%, bottom is empty | Set `justify-content: center` on the section, or distribute spacing so content gravitates toward vertical center |

**Rule**: When total content height is less than ~60% of the viewport, vertically center the content group rather than top-aligning it.

### Component Sizing

When placing components (cards, flow steps, metrics) on a slide:

1. **Start from available space** — after heading and margins, how much vertical space remains?
2. **Size cards to content, not to viewport height** — use `height: auto` so cards wrap their content. If the card interior is mostly empty, the card is too tall
3. **Ensure readability** — components must be large enough that text meets the minimum sizes in [Accessibility Baseline](#accessibility-baseline)
4. **Maintain element relationships** — respect the spacing tiers above. Growing a component must not consume the breathing room between it and adjacent elements
5. **Adjust content to fit** — if content forces fonts below minimum, the slide has too much content. Split or remove detail

Approaches: splitting across slides, reducing content, layout redesign (e.g., 2-column instead of 3-column), generous padding.

### Horizontal Layout Alignment

When placing items side by side (cards, metrics, grid columns), **equal height is mandatory**. Ragged heights in a horizontal row create visual noise and make comparison harder.

| Rule | Detail |
|---|---|
| **Equal row height** | All items in a horizontal row must share the same height. Use CSS `align-items: stretch` or explicit equal heights on the container |
| **Align internal baselines** | Corresponding elements (headings, values, descriptions) should start at the same vertical position across items. Pin variable-length content (e.g., descriptions) to the bottom of the card so that headings stay aligned at the top |
| **When to go vertical** | If items have significantly different content volume (e.g., one card has 1 line, another has 3), switch to a vertical/stacked layout (rows or table). Horizontal grid is best for **uniform** items (same structure, similar length). Vertical rows/table is best for **varied content** or when comparison across a shared axis matters |
| **No side-by-side for long descriptions** | When 2-3 items each carry a multi-line description and are not being compared against each other, stack them vertically. Side-by-side halves the available width per item, forcing line wraps that degrade readability. Horizontal layout is for **contrast/comparison** (A vs B); simple enumeration reads better as a vertical list |

### Anti-Patterns from Web Thinking

| Web habit | Slide problem | Slide approach |
|---|---|---|
| Content determines height | Font shrinks to fit too much content | Split into multiple slides |
| `border-top: 3px solid accent` | Generic AI accent — single-edge color | Full-surface treatment or no border |
| Fixed small padding | Cramped on slides | Generous padding proportional to viewport |
| Horizontal cards with ragged heights | Uneven row feels broken, comparison is harder | See [Horizontal Layout Alignment](#horizontal-layout-alignment) |

---

## Accessibility Baseline

Non-negotiable requirements for projected display readability. **These rules apply to text content only.**

- All **text** must meet **4.5:1 contrast ratio** against its background (WCAG AA)
- Minimum body text size: **22px** (`--font-size-base`)
- Minimum heading size: **34px** (`--font-size-xl` / h3)
- Never rely on color alone to convey information — use shape, position, or text labels alongside color
- Avoid red/green only distinctions (color blindness)
- Never apply italic to Japanese text (use color emphasis instead)

**Decorative/motif elements are NOT subject to contrast rules.** Semi-transparent shapes, subtle gradients, and background motifs may intentionally have low contrast to serve the design tone (e.g., a faint silk-like glow for luxury cosmetics). Visibility of motifs is a design choice, not an accessibility requirement.

---

## Bold Design Principles

The goal is presentations that are **memorable and intentional**, not merely correct.

### Intentionality Over Intensity

A bold direction executed with precision always beats a safe direction executed perfectly. Refined minimalism and dramatic maximalism are both valid — the key is **intentionality**.

Before designing, commit to:

1. **Tone**: Not "professional" (too vague) but something specific: "surgical precision", "warm invitation", "urgent rally cry", "quiet authority"
2. **UNFORGETTABLE Element**: The ONE thing someone remembers. A metric, a narrative arc, a typographic choice. If you can't name it, the deck has no identity
3. **Differentiation**: What makes this deck distinct from 100 others on the same topic?

### AI Slop — Patterns to Resist

AI-generated slides converge toward recognizable mediocrity:

- **Content**: "Key Takeaways" / "Let's Dive In" titles, identical heading + 3 bullets on every slide, filler paragraphs restating the title
- **Visual**: Purple gradients, decorative shapes without purpose, `invert` on alternating slides for fake variety, single-edge colored borders on cards, standalone vertical bar as lead decoration (renders as disconnected block in Marp's flex layout)
- **Structure**: Every section same length, no density variation, lead slides removable without loss

### Evaluation

Presentations are evaluated by the `slide-evaluator` Custom SubAgent on 4 axes (1-5 each, minimum 3 to pass):

1. **Cohesion & Rhythm** — Do emphasis slides stand out? Do supporting slides recede?
2. **Purpose Alignment** — Is the UNFORGETTABLE element unmissable?
3. **Craft** — Typography, spacing, alignment, readability at projection size
4. **Narrative Flow** — Do headings in sequence tell a story?

The generator does NOT evaluate its own work. See `slide-evaluator` agent for full scoring rubric.

---

## Reference Files

| File | Content |
|---|---|
| [visual-rules.md](visual-rules.md) | Color system, typography, spacing, elevation, accent shape tokens |
| [patterns.md](patterns.md) | HTML layout patterns (parallel, comparison, flow, metric, bespoke visual identity) |
| `themes/basicslide.css` | Design tokens (tokens layer only — no component styles) |
| `themes/basicslide-components.css` | Reference CSS for component/shape inspiration (not a Marp theme) |
