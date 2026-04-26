# Visual Rules

Concrete values and applied rules that implement the principles in [judgment.md](judgment.md). For HTML layout structures and Marp CSS rendering constraints, see [patterns.md](patterns.md).

Source of truth for token values: `themes/basicslide.css`.

## Table of Contents

- [1. Color](#1-color)
- [2. Typography](#2-typography)
- [3. Spacing](#3-spacing)
- [4. Corner Shapes](#4-corner-shapes)
- [5. Elevation](#5-elevation)
- [6. Layout Alignment](#6-layout-alignment)
- [7. Slide Space Design](#7-slide-space-design)
- [8. Deck Composition](#8-deck-composition)
- [9. Editorial Rules](#9-editorial-rules)
- [10. Accessibility Baseline](#10-accessibility-baseline)

---

## 1. Color

### Color System

- **Primary**: Brand identity for the presentation. Headings, borders, accents, markers
- **Secondary**: Derived from primary via lightness adjustment (same hue family)
- **Background**: White (`--color-surface`) as default base

### Semantic Colors

| Token | Role |
|---|---|
| `--color-primary` | Headings, borders, list markers, emphasis |
| `--color-text` | Body text (gray-900) |
| `--color-text-secondary` | Supporting text (gray-600) |
| `--color-text-tertiary` | Page numbers, footnotes (gray-420) |
| `--color-surface-accent` | Emphasis box background |
| `--color-success` / `--color-error` / `--color-warning` | Status indicators (use sparingly) |

### Contrast Ratios

| Element | Minimum Ratio | Against |
|---|---|---|
| Body text | **4.5:1** | Slide background |
| Headings (34px+) | **3:1** | Slide background |
| Title slide text | **4.5:1** | Gradient background |
| Badge text | **4.5:1** | Badge background |

### Color Economy

> **"If everything is emphasized, nothing is."**

- Max **3 color roles** per slide: primary (accent), text (content), background (surface)
- Status colors (success, error, warning) count as additional roles — use only when data requires them
- On `invert` slides, the same economy applies — the palette shifts, the rule doesn't
- Reserve primary color for structural elements (headings, borders). Don't color body text with primary

### Palette Override

When defining a custom palette via `style` directive, all 8 override variables must come from the **same hue family**:

| Variable | Role | Constraint |
|---|---|---|
| `--color-primary` | Anchor color | Medium saturation; 4.5:1+ contrast on white |
| `--color-primary-dark` / `-deep` | Darker shades | Title gradients, dark mode backgrounds |
| `--color-primary-light` / `-muted` / `-soft` | Lighter tints | Backgrounds, secondary text on dark |
| `--color-primary-hover` | Interaction state | Slightly darker than primary |

---

## 2. Typography

### Font Family

| Type | Stack |
|---|---|
| Sans-serif (primary) | `"Noto Sans JP"`, `"Yu Gothic Medium"`, `"游ゴシック Medium"`, YuGothic, `"ヒラギノ角ゴ Pro W3"`, `"メイリオ"`, sans-serif |
| Monospace | `"Noto Sans Mono"`, ui-monospace, monospace |

Set `font-feature-settings: "palt"` for proportional alternate spacing (Japanese punctuation).

### Font Sizes (Projection-Adapted)

Standard web sizes are too small for projected display. The theme uses larger values:

| Token | Size | Usage |
|---|---|---|
| `--font-size-4xl` | 70px | Title slide heading |
| `--font-size-3xl` | 56px | h1 (large impact) |
| `--font-size-2xl` | 42px | h2 (slide title) |
| `--font-size-xl` | 34px | h3 (subsection) |
| `--font-size-lg` | 28px | h4, large body |
| `--font-size-base` | 22px | Body text |
| `--font-size-sm` | 16px | Captions, table cells |
| `--font-size-xs` | 14px | Footnotes, page numbers |

### Font Weights

| Token | Value | Usage |
|---|---|---|
| `--font-weight-normal` | 400 | Body text |
| `--font-weight-semibold` | 600 | Labels, h3, h4 |
| `--font-weight-bold` | 700 | Headings (h1, h2), strong emphasis |

### Line Heights

| Token | Value | Usage |
|---|---|---|
| `--line-height-none` | 1.0 | Single-line elements (badges) |
| `--line-height-dense` | 1.2 | Data-dense displays |
| `--line-height-heading` | 1.3 | All headings |
| `--line-height-body` | 1.6 | Body text |
| `--line-height-relaxed` | 1.8 | Generous reading (quote slides) |

### Japanese Typography Rules

Japanese and English have fundamentally different typographic characteristics. Rules that work in English often degrade Japanese slides. These rules apply when the presentation language is Japanese.

#### Font Family

| Rule | Rationale |
|---|---|
| Use **one font family** for all text in a deck | Japanese font mixing (明朝+ゴシック) creates stronger visual noise than English serif+sans mixing. The character density and stroke complexity of Japanese make font switches more jarring |
| If mixing fonts, limit to **heading vs body** only | Heading = serif (Noto Serif CJK JP), body = sans (Noto Sans JP) is acceptable. Never mix fonts within the same hierarchy level (e.g., h2 serif on one slide, h2 sans on another) |
| Never mix fonts within a single text block | A paragraph that switches between serif and sans mid-sentence is always wrong |

#### Letter-spacing

| Rule | Rationale |
|---|---|
| Heading letter-spacing: **0 to 0.04em** max | Japanese characters have built-in spacing (square grid). Wide letter-spacing (0.1em+) that looks elegant in English makes Japanese text feel scattered and disconnected |
| Body letter-spacing: **0.02em** (theme default) | Small amounts aid readability. Larger values degrade it |
| Never use letter-spacing to fill horizontal space | If a heading looks too short, increase font-size or add a subtitle — don't stretch characters apart |

#### Line Breaking

Japanese text wraps at any character boundary, unlike English which wraps at word boundaries. This causes problems unique to Japanese:

| Problem | Fix |
|---|---|
| Heading wraps to second line at awkward position | Keep headings short enough to fit on one line. If wrapping is unavoidable, use `<br>` to control the break point |
| Body text breaks mid-compound-word | Set `word-break: auto` (not `break-all`). Consider `overflow-wrap: break-word` as fallback |
| Short orphan at end of paragraph ("す。" alone on last line) | Widen the text container (`max-width`) or slightly reduce font-size to pull the orphan back |
| Particle or punctuation at line start | This is a browser rendering issue. `font-feature-settings: "palt"` helps. Avoid very narrow text containers |

**Slide-specific guidance**: On a 1280px viewport, body text should use **80-90% of slide width** (after padding). Too narrow → frequent wrapping → more awkward breaks. Too wide → lines are too long for readability.

#### Emphasis

| Method | Usage |
|---|---|
| **Bold** (`**text**`) | OK but use sparingly. Japanese bold adds visual weight faster than English bold due to stroke density |
| **Color emphasis** (`*text*` → primary color) | Preferred for inline emphasis. The theme renders `em` as color, not italic |
| **Italic** | Never use for Japanese. Italic Japanese is not a real typographic tradition and looks distorted |
| **Underline** | Avoid. Harder to read in Japanese due to descender-less character design |

#### Sizing

| Element | Minimum | Rationale |
|---|---|---|
| Body text | 22px (`--font-size-base`) | Projected display readability |
| Captions, table cells | 16px (`--font-size-sm`) | Absolute minimum for legibility |
| Headings | 34px (`--font-size-xl`) | Must be clearly distinguishable from body |

---

## 3. Spacing

### Base Unit and Scale

Standard base unit: **8px** (0.5rem at 20px root).

| Token | Value | Usage |
|---|---|---|
| `--spacing-1` | 4px | Tight gaps (badge padding) |
| `--spacing-2` | 8px | List item spacing, minimal gaps |
| `--spacing-3` | 12px | Inner component padding |
| `--spacing-4` | 16px | Paragraph spacing, standard padding |
| `--spacing-6` | 24px | Component margins, card padding |
| `--spacing-8` | 32px | Section gaps, heading margins |
| `--spacing-10` | 40px | Large gaps |
| `--spacing-12` | 48px | Slide vertical padding |
| `--spacing-16` | 64px | Slide horizontal padding, title slide padding |

### Principles

- **Consistency**: Same spacing for same relationship type across all slides
- **Relationship expression**: Small gap = related, large gap = different groups
- **Slide padding**: 48px top/bottom, 64px left/right — do not override. This ensures content never crowds the edges
- **Content grouping**: Use spacing tiers to show hierarchy — heading-to-body (24px) is tighter than body-to-next-section (32px)

### Element Relationships (applied Proximity)

Space between elements expresses their semantic relationship — a direct application of the [Proximity](judgment.md#2-proximity) principle.

| Relationship | Spacing | Example |
|---|---|---|
| Tightly related | Small gap (8-16px) | Label and its value, badge and heading |
| Same group | Medium gap (24-32px) | Heading to body, items within a card |
| Different groups | Large gap (40-64px) | Content block to decorative motif, section to section |

When improving space utilization, **never collapse the gaps between unrelated elements**. A motif and a content block are different groups — they need breathing room. Filling the viewport by cramming elements together degrades the design more than leaving space empty.

**Component external margins**: Custom components (`.metrics`, `.kpi-grid`, `.seg-grid`, `.strategy-list`, tables, etc.) must have **`margin-bottom: 32px` minimum** when followed by other content (paragraphs, lists, other components). The internal `gap` property handles spacing between items *within* the component; `margin-bottom` handles the gap *after* the component. Omitting `margin-bottom` causes the following content to collide with the component — the most common spacing error in generated slides.

---

## 4. Corner Shapes

| Token | Value | Usage |
|---|---|---|
| `--radius-none` | 0px | Sharp corners (not used in theme) |
| `--radius-sm` | 8px | Code blocks, blockquotes, table overflow |
| `--radius-md` | 12px | Cards, emphasis boxes, grid items, images |
| `--radius-lg` | 16px | Large containers (not commonly used) |
| `--radius-full` | 9999px | Badges (pill shape) |

Cards and content containers use `--radius-md` (12px). Inline elements (badges, code) use `--radius-sm` or `--radius-full`. Be consistent within a slide — don't mix radius values for same-level elements.

---

## 5. Elevation

### Shadow Levels

| Token | Description | Usage |
|---|---|---|
| `--shadow-0` | None | Flat on surface (default text) |
| `--shadow-1` | Subtle | Table container |
| `--shadow-2` | Light | Grid items, blockquotes |
| `--shadow-3` | Medium | Cards, code blocks, images |
| `--shadow-4` | Strong | (Reserved for high emphasis) |
| `--shadow-5` | Maximum | (Reserved for overlays) |

### Motif Intensity as Elevation

In slides, elevation is expressed not just through shadows but through **visual boldness** — the intensity of color, whitespace, and typography. The intensity level should map to the slide's role:

| Intensity | Shadow | Background | Typography | Slide role |
|---|---|---|---|---|
| Maximum | N/A | Full gradient | 70px bold, inverse color | `title` (cover/closing) |
| High | None | White | 70px bold, primary color, centered | `lead` (section divider, key message) |
| Medium-High | None | White | Large quote with border-left | `quote` (testimonial) |
| Medium | shadow-3 for components | White | 42px heading + body | `content`, `cols` (standard) |
| Low | shadow-1 to shadow-2 | White | Data-focused (tables, lists) | `content` (data-heavy) |

### Accent Shape Tokens

`--accent-color`, `--accent-color-soft`, `--accent-opacity` are defined in `themes/basicslide.css` for bespoke shape design in the `style` block. Override alongside the color palette when designing presentation-specific shapes. Pre-built motif/accent classes in `themes/basicslide-components.css` are reference baselines — design bespoke shapes instead.

### Principles

- Higher elevation = more visual weight = more audience attention
- Use elevation differences to guide the audience's focus
- Shadow-heavy slides (many cards, all with shadow-3) flatten the hierarchy — use shadows sparingly
- On `invert` slides, shadows are less visible — rely on border and background contrast instead
- Shapes follow the same principle: title slides get bold shapes, content slides get subtle ones
- Shapes should **enhance spatial composition**, not merely decorate — a shape that doesn't guide the eye or create visual rhythm is visual noise
- A presentation with no shapes but excellent typography and spacing is a valid design choice

---

## 6. Layout Alignment

When placing items side by side (cards, metrics, grid columns), **equal height is mandatory** — applied [Similarity](judgment.md#3-similarity) and [Good Continuation](judgment.md#4-good-continuation). Ragged heights create visual noise and make comparison harder.

| Rule | Detail |
|---|---|
| **Equal row height** | All items in a horizontal row must share the same height. Use CSS `align-items: stretch` or explicit equal heights on the container |
| **Align internal baselines** | Corresponding elements (headings, values, descriptions) should start at the same vertical position across items. Pin variable-length content (e.g., descriptions) to the bottom of the card so that headings stay aligned at the top |
| **When to go vertical** | If items have significantly different content volume (e.g., one card has 1 line, another has 3), switch to a vertical/stacked layout. Horizontal grid is best for **uniform** items (same structure, similar length); vertical rows/table is best for **varied content** or when comparison across a shared axis matters |
| **No side-by-side for long descriptions** | When 2-3 items each carry a multi-line description and are not being compared against each other, stack them vertically. Side-by-side halves the available width per item, forcing line wraps that degrade readability. Horizontal layout is for **contrast/comparison** (A vs B); simple enumeration reads better as a vertical list |

---

## 7. Slide Space Design

Slides use a **fixed viewport (1280x720)**. Unlike web pages, there is no scroll — every pixel is a design decision. Web CSS habits cause systematic errors on slides.

### Web vs Slide

| Aspect | Web | Slide |
|---|---|---|
| Height | Content determines height. Page scrolls | Fixed 720px. What you see is everything |
| Empty space below content | Invisible — user scrolls past | Visible — every pixel is a conscious choice |
| Design direction | Content → padding → height emerges | **Available height → content placement → sizing** |
| Component sizing | Sized by content + padding | Sized relative to viewport |

### Overcrowding Detection

| Problem | Signal | Fix direction |
|---|---|---|
| **Too dense** | Fonts shrink below minimum, no breathing room, content cut off at bottom | Split into 2 slides, or remove detail |
| **Content overflow** | Text or elements extend beyond the 720px viewport edge | Split the slide — never shrink fonts to fit |

**Rules**:

- If content forces body text below 22px, the slide has too much content. Split or remove detail
- If content is cut off at the bottom edge of the viewport, the slide must be split
- Do NOT split based on item count alone. Short bullet points or table rows can exceed typical counts if text remains readable at 22px+ and the slide does not feel cramped

**Whitespace is a design choice, not a defect.** The amount of viewport a designer uses is determined by the presentation's tone and the slide's role — not by a target percentage. Statement slides, luxury/premium decks, and contemplative tones may use generous whitespace intentionally. Do not flag whitespace as "unused space" unless text is too small to read (which is a readability issue, not a space issue — see [10. Accessibility Baseline](#10-accessibility-baseline)).

### Vertical Balance (Content Gravity)

Content should sit at the **visual center or slightly above center** of the slide, not pinned to the top edge. When all content clusters in the top third with the bottom two-thirds empty, the slide feels top-heavy and unfinished — an "inverted triangle" density.

| Signal | Fix direction |
|---|---|
| Content occupies top 30-40%, bottom is empty | Pull content toward vertical center via `padding-top` (100–130px). `justify-content: center` does not work in Marp — see [Marp CSS Rendering Constraints in patterns.md](patterns.md#marp-css-rendering-constraints) |

**Rule**: When total content height is less than ~60% of the viewport, vertically center the content group rather than top-aligning it.

### Component Sizing

When placing components (cards, flow steps, metrics) on a slide:

1. **Start from available space** — after heading and margins, how much vertical space remains?
2. **Size cards to content, not to viewport height** — use `height: auto` so cards wrap their content. If the card interior is mostly empty, the card is too tall
3. **Ensure readability** — components must be large enough that text meets the minimum sizes in [10. Accessibility Baseline](#10-accessibility-baseline)
4. **Maintain element relationships** — respect the spacing tiers in [3. Spacing](#3-spacing). Growing a component must not consume the breathing room between it and adjacent elements
5. **Adjust content to fit** — if content forces fonts below minimum, the slide has too much content. Split or remove detail

Approaches: splitting across slides, reducing content, layout redesign (e.g., 2-column instead of 3-column), generous padding.

---

## 8. Deck Composition

### Lead Slides as Emphasis, Not Structure

Lead slides (`_class: lead`) are **emphasis markers** — they declare "this section is important." They are NOT structural separators between every topic.

| Pattern | Effect |
|---|---|
| Lead before every section | All sections feel equal → flat deck, no rhythm |
| Lead before 1-2 key sections only | Those sections feel special → audience knows what matters |
| No lead slides | Fast tempo, content-driven — valid for data-heavy presentations |

**Lead budget**: In a deck of N content slides, use at most **N/3 lead slides** (rounded down). A 9-content-slide deck gets at most 3 leads. Fewer is often better.

### Tempo Patterns

Consecutive content slides create **tempo** — the feeling of information flowing. Lead slides create **pause** — a breath before something important. Alternate between these to create rhythm.

| Sequence | Rhythm feel |
|---|---|
| cover → content → content → content → closing | Fast, direct — no pauses. Good for short, factual decks |
| cover → **lead** → content → content → **lead** → key message → content → closing | Two pauses, second one before the climax. Audience builds expectation |
| cover → **lead** → content → **lead** → content → **lead** → content → **lead** → content → closing | Staccato — every section feels the same weight. Flat and tiring |

### Structural Emphasis > Visual Emphasis

Whether a slide gets a lead before it is a **stronger emphasis signal** than making the slide's font bigger or background darker. Both matter, but structure comes first.

To decide which sections get leads, ask: "If the audience remembers only 2-3 things, which sections are they?" Those get lead slides. Everything else flows as consecutive content. Visual intensity then follows — a key message slide with a lead before it AND elevated visual treatment is the deck's climax.

### Layout Consistency

Slides sharing a role must share their layout anchors — header position, padding, content start position, footer position. Audiences read consistency as intent and **partial inconsistency as a mistake**.

| Role | Marp `_class` | Anchor that must match across instances |
|---|---|---|
| Standard content | (default) | Heading position, body start position, footer position |
| Cover / Closing | `title` | Brand element placement, title gravity, accent position |
| Section divider / Key message | `lead` | Vertical centering rule, title weight |

**When to break consistency intentionally**: Break it *fully*, not partially. If a slide has a different role (e.g., a key-message slide among content slides), give it a clearly different background, typography, vertical balance — the audience should read it as "deliberate shift," not as "the same kind of slide that happens to be slightly off."

A *partial* deviation (same look, but heading shifted by 60px or footer color slightly different) reads as a layout bug.

**Common drift sources**:

- Per-slide CSS classes that each define their own padding / flex behavior independently
- `display: flex; justify-content: center` applied to one slide of a series — vertically shifts that slide's content while neighbors remain top-aligned
- Adding an eyebrow or section number on some slides but not others — the heading position moves on the slides that have one

---

## 9. Editorial Rules

Rules about *what content goes on a slide* — the editorial counterpart to visual composition. These apply specifically to the slide medium and do not follow from perceptual principles.

### Self-Contained Slides

Each slide must be understandable without the previous slide's content.

- Don't write "as we'll see later" or "as mentioned earlier" — the presenter may skip or reorder slides
- Repeat key context when needed rather than assuming recall
- Every slide title must clearly state the slide's message

**Why slide-specific**: Unlike linear document reading, slides can be navigated non-sequentially (presenter skips, audience asks mid-deck). Self-containment is the medium's contract.

### Content Duplication

Every slide must carry at least one piece of information that no other slide in the deck contains.

| Signal | Example | Fix direction |
|---|---|---|
| Adjacent slides share the same key fact | Closing says "2027年予定 アルテミスIII" and the next number-wall shows "2027" with "アルテミスIII" | Merge into one slide, or give each slide **distinct** information the other doesn't have |
| Lead/divider restates the content slide that follows | Lead says "4つの技術実証" and the next slide lists the same 4 items with no additional context | Remove the lead, or give the lead a unique angle (e.g., a surprising framing, not a summary) |

**Rule**: If a slide's content is entirely a subset of an adjacent slide, it must be merged or cut. Visual variety (different layout, bigger font) does not justify content duplication — the audience sees the same words twice and the deck feels padded.

### Data Integrity

- Every chart or table has labels. Never present unlabeled numbers
- Always specify units (%, px, hours, USD). Bare numbers invite misinterpretation
- Cite sources for claims. Unsourced statistics undermine credibility

---

## 10. Accessibility Baseline

Physical constraints of projected viewing. **These rules apply to text content only and are non-negotiable** — they are environmental requirements, not design choices. The contrast ratios and minimum sizes referenced in [1. Color](#1-color) and [2. Typography](#2-typography) derive from this baseline.

- All **text** must meet **4.5:1 contrast ratio** against its background (WCAG AA)
- Minimum body text size: **22px** (`--font-size-base`)
- Minimum heading size: **34px** (`--font-size-xl` / h3)
- Never rely on color alone to convey information — use shape, position, or text labels alongside color
- Avoid red/green only distinctions (color blindness)
- Never apply italic to Japanese text (use color emphasis instead)

**Decorative/motif elements are NOT subject to contrast rules.** Semi-transparent shapes, subtle gradients, and background motifs may intentionally have low contrast to serve the design tone (e.g., a faint silk-like glow for luxury cosmetics). Visibility of motifs is a design choice, not an accessibility requirement.
