# HTML Layout Patterns and Marp Constraints

Reusable HTML layout patterns and the Marp CSS rendering constraints that shape implementation. These patterns implement the principles in [judgment.md](judgment.md) using the tokens and applied rules in [rules.md](rules.md).

Patterns define **structure only** — visual styling for each pattern must be provided in the presentation's `style` block. Reference CSS for these patterns is available at `themes/basicslide-components.css` for inspiration.

## Table of Contents

- [Selection Flow](#selection-flow)
- [Parallel — Listing items side by side](#parallel--listing-items-side-by-side)
- [Comparison — Showing differences between options](#comparison--showing-differences-between-options)
- [Flow — Showing process and sequence](#flow--showing-process-and-sequence)
- [Metric — Highlighting key numbers](#metric--highlighting-key-numbers)
- [Data — Presenting structured information](#data--presenting-structured-information)
- [Structural — Fixed page types](#structural--fixed-page-types)
- [Bespoke Visual Identity — Shapes designed per presentation](#bespoke-visual-identity--shapes-designed-per-presentation)
- [Patterns that require external graphics](#patterns-that-require-external-graphics)
- [Marp CSS Rendering Constraints](#marp-css-rendering-constraints)

---

## Selection Flow

Choose a pattern based on **what you want to communicate**:

```
What are you communicating?
├── Listing parallel items     → Parallel patterns
├── Comparing options          → Comparison patterns
├── Showing a process/steps    → Flow patterns
├── Highlighting key numbers   → Metric patterns
├── Presenting data            → Data patterns
└── Fixed page types           → Structural patterns
```

---

## Parallel — Listing items side by side

Use when presenting 2-4 items at the same level of importance.

### Horizontal Grid (2-4 items with description)

```html
<div class="grid">
<div class="grid-item">
<div class="icon">🔍</div>
<h4>Item Title</h4>
<p>Brief description of this item</p>
</div>
<!-- repeat .grid-item × 2-4 -->
</div>
```

**When to use**: Features, benefits, team roles, options — anything where items are parallel and equally weighted.
**Variant**: Omit `<div class="icon">` for text-only grid items.

### Vertical List (text-heavy items)

Use standard Markdown lists with bold lead-ins:

```markdown
- **Item one** — Description with more detail that wouldn't fit in a grid
- **Item two** — Another detailed description
- **Item three** — And another one
```

**When to use**: When each item has enough text that a horizontal grid would feel cramped.

---

## Comparison — Showing differences between options

### Two-Column Compare

```markdown
<!-- _class: cols -->

## Heading

<div class="left">

### Option A
- Point 1
- Point 2
- Point 3

</div>

<div class="right">

### Option B
- Point 1
- Point 2
- Point 3

</div>
```

**When to use**: Before/After, Pros/Cons, Current/Proposed, Us/Competitor.

### Table Compare (many criteria)

```markdown
| Criteria | Option A | Option B | Option C |
|---|---|---|---|
| Speed | Fast | Medium | Slow |
| Cost | High | Medium | Low |
| Quality | High | High | Medium |
```

**When to use**: When comparing 3+ options across multiple criteria. Tables are more scannable than multiple columns for structured data.

---

## Flow — Showing process and sequence

### Horizontal Steps (2-5 steps)

```html
<div class="flow">
<div class="flow-step">
<div class="flow-num">1</div>
<h4>Step Title</h4>
<p>Brief description</p>
</div>
<!-- repeat .flow-step × 2-5, increment .flow-num -->
</div>
```

**When to use**: Onboarding steps, development process, decision flow, timeline.
**Limit**: Max 5 steps. Beyond that, use a vertical list or split across slides.

### Vertical Steps (text-heavy or 5+ steps)

Use numbered Markdown list:

```markdown
1. **Step name** — Description of what happens
2. **Step name** — Description of what happens
3. **Step name** — Description of what happens
```

**When to use**: When each step needs detailed explanation, or when there are more than 5 steps.

---

## Metric — Highlighting key numbers

### Big Numbers (2-4 KPIs)

```html
<div class="metrics">
<div class="metric">
<div class="metric-value">42%</div>
<div class="metric-label">Conversion Rate</div>
</div>
<!-- repeat .metric × 2-4 -->
</div>
```

**When to use**: KPI highlights, impact numbers, before/after metrics, market size.
**Rules**: Keep labels short (2-3 words). Include units in the value. Max 4 metrics per slide.

---

## Data — Presenting structured information

### Standard Table

```markdown
| Column A | Column B | Column C |
|---|---|---|
| Data 1 | Data 2 | Data 3 |
| Data 4 | Data 5 | Data 6 |
```

**When to use**: Pricing, specifications, schedules, detailed comparisons.

### Formula / Equation

Use text with mathematical symbols:

```markdown
**Unit Economics** = *LTV* ÷ *CAC*
```

Or for visual emphasis, use the metric pattern with operator metrics (an `.metric` whose `.metric-value` is `÷` / `×` / `=` and `.metric-label` is empty) interleaved between operand metrics.

**When to use**: Defining KPIs, showing relationships between business metrics.

---

## Structural — Fixed page types

These map directly to `_class` directives:

| Page Type | `_class` | Usage |
|---|---|---|
| Cover / Closing | `title` | First and last slides |
| Section Divider | `lead` | New topic introduction |
| Key Message | `lead` | Single impactful statement |
| Quote / Testimonial | `quote` | Citations, testimonials |
| Image Focus | `image` | Background image with text overlay |
| Standard Content | _(default)_ | Heading + body text |

### Table of Contents

```markdown
## Agenda

1. Current situation
2. Proposed approach
3. Expected outcomes
4. Next steps
```

**When to use**: At the start of a presentation with 4+ sections.

### Q&A

```markdown
<!-- _class: quote -->

> Your questions?

Contact: name@example.com
```

---

## Bespoke Visual Identity — Shapes designed per presentation

Each presentation designs its own visual identity in the `style` block. Shapes and decorative elements are created bespoke using CSS techniques — not selected from pre-built templates.

**Design approach**:

1. **Start from the message**: What emotion or concept should the shape embody?
2. **Choose a technique**: `::before` / `::after` pseudo-elements, `clip-path`, `linear-gradient`, `radial-gradient`, `border` tricks
3. **Apply with intensity curve**: Bold shapes on title/lead slides, subtle on content slides (see [rules.md §5 Motif Intensity as Elevation](rules.md#5-elevation))
4. **Validate**: Does the shape serve the message, or is it decoration? If decoration, remove it

**Shape technique reference**:

| Technique | CSS Property | Best For |
|---|---|---|
| Solid geometric shapes | `border-style: solid; border-width` | Triangles, arrows |
| Organic blobs | `border-radius: 50%` on sized element | Circles, ellipses |
| Diagonal cuts | `linear-gradient(angle, color stop%, transparent stop%)` | Dynamic energy |
| Textured patterns | `radial-gradient` with `background-size` | Dot grids, technical feel |
| Flowing curves | `clip-path: ellipse()` or `clip-path: polygon()` | Waves, organic shapes |
| Color bands | `linear-gradient(to direction, transparent X%, color X%)` | Side/top accents |

**When NOT to use shapes**: A presentation with **no shapes** but excellent typography, color, and spacing is a valid and often superior design choice. Shapes should enhance the message — if they don't clearly serve a purpose, omit them.

---

## Patterns that require external graphics

The following patterns require graphical elements beyond HTML/CSS. Prepare the graphic externally and embed with `![alt](path)`:

- **Cycle diagrams** (circular flow) — alternative: Use `flow` with text note "this cycle repeats"
- **Venn diagrams** (overlapping sets) — alternative: Use a table showing shared/unique attributes
- **Pyramid / Funnel** — alternative: Use a numbered list from broad to narrow
- **Tree diagrams** (org charts) — alternative: Use indented lists
- **Charts** (bar, pie, line) — embed pre-rendered chart images

---

## Marp CSS Rendering Constraints

Marp renders slides inside an SVG `foreignObject`, which breaks several common CSS techniques. These constraints are verified across multiple builds — use the Solution column instead of the unsupported pattern.

| Constraint | Impact | Solution |
|---|---|---|
| `::before` / `::after` bars are unreliable | Decorative edge lines (vertical or horizontal) disappear unpredictably | Use `background-image: linear-gradient(...)` with `!important` instead |
| Base `section` background-image does not apply to slides without explicit `_class` | Accent lines, textures, signal bands vanish on unclassed slides | Assign a `_class` to EVERY slide and define `background-image` on each class selector |
| `justify-content: center` / CSS Grid centering does not work | Content stays top-aligned regardless of flex/grid settings | Use `padding-top` (100–130px) for vertical positioning |
| `inset: 0` does not work | Positioning shorthand is ignored | Use explicit `top: 0; left: 0; width: 100%; height: 100%;` |
| Decorative lines thinner than 6px are invisible at 1280×720 | Thin accent lines vanish in PNG output and evaluator cannot detect them | Use **6px minimum width** for any decorative line element |
| Adding `!important` to `background-color` triggers Marp's advanced background processing | Marp applies `background: transparent !important` to the content layer, wiping all `background-image` | **Never** add `!important` to `background-color`. Only add `!important` to `background-image` and its sub-properties |
| `flex: 1` on flex items can collapse to zero width | Item disappears or shrinks unexpectedly inside Marp's section flex context | Set explicit `width` (or `min-width`) instead of relying on `flex: 1` |
