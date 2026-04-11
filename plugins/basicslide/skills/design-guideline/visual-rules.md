# Visual Rules

Concrete values and specifications for slide visual design. These rules implement the principles defined in SKILL.md.

Source of truth for token values: `themes/basicslide.css`

## Table of Contents

- [1. Color](#1-color)
- [2. Typography](#2-typography)
- [3. Spacing](#3-spacing)
- [4. Corner Shapes](#4-corner-shapes)
- [5. Elevation](#5-elevation)
- [6. Deck Composition](#6-deck-composition)

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

### Palette Override Rules

When defining a custom palette via `style` directive:

- All 8 override variables must come from the **same hue family**
- `--color-primary`: the anchor. Medium saturation. 4.5:1+ contrast on white
- `-dark` / `-deep`: darker shades. Used for title gradients and dark mode backgrounds
- `-light` / `-muted` / `-soft`: lighter tints. Used for backgrounds, secondary text on dark
- `-hover`: slightly darker than primary

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

### Base Unit

Standard base unit: **8px** (0.5rem at 20px root)

### Scale

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

---

## 4. Corner Shapes

### Border Radius Levels

| Token | Value | Usage |
|---|---|---|
| `--radius-none` | 0px | Sharp corners (not used in theme) |
| `--radius-sm` | 8px | Code blocks, blockquotes, table overflow |
| `--radius-md` | 12px | Cards, emphasis boxes, grid items, images |
| `--radius-lg` | 16px | Large containers (not commonly used) |
| `--radius-full` | 9999px | Badges (pill shape) |

### Rules

- Cards and content containers: `--radius-md` (12px)
- Inline elements (badges, code): `--radius-sm` (8px) or `--radius-full`
- Be consistent within a slide — don't mix radius values for same-level elements

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

In slides, elevation is expressed not just through shadows but through **visual boldness** — the intensity of color, whitespace, and typography:

| Intensity | Shadow | Background | Typography | Used by |
|---|---|---|---|---|
| Maximum | N/A | Full gradient | 70px bold, inverse color | `title` |
| High | None | White | 70px bold, primary color, centered | `lead` |
| Medium-High | None | White | Large quote with border-left | `quote` |
| Medium | shadow-3 for components | White | 42px heading + body | `content`, `cols` |
| Low | shadow-1 to shadow-2 | White | Data-focused (tables, lists) | `content` (data) |

### Accent Shape Tokens

These tokens are available for bespoke shape design in the `style` block:

| Token | Default | Role |
|---|---|---|
| `--accent-color` | `var(--color-primary)` | Shape fill (dots, borders) |
| `--accent-color-soft` | `var(--color-primary-muted)` | Shape fill (triangle, circle, wave, gradient, diagonal) |
| `--accent-opacity` | `0.35` | Shape opacity for localized shapes |

Override these alongside the color palette when designing presentation-specific shapes.

**Note**: Pre-built motif classes (`motif-geometric`, `motif-organic`, `motif-bold`) and accent shape classes (`accent-triangle`, `accent-circle`, etc.) exist in `themes/basicslide-components.css` as reference baselines only. New presentations should design shapes bespoke in the `style` block.

### Principles

- Higher elevation = more visual weight = more audience attention
- Use elevation differences to guide the audience's focus
- Shadow-heavy slides (many cards, all with shadow-3) flatten the hierarchy — use shadows sparingly
- On `invert` slides, shadows are less visible — rely on border and background contrast instead
- Shapes follow the same principle: title slides get bold shapes, content slides get subtle ones
- Shapes should **enhance spatial composition**, not merely decorate — a shape that doesn't guide the eye or create visual rhythm is visual noise
- A presentation with no shapes but excellent typography and spacing is a valid design choice

---

## 6. Deck Composition

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
