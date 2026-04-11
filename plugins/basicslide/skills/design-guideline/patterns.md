# Slide Design Patterns

Reusable HTML layout patterns for common presentation needs. These patterns define **structure only** — the visual styling for each pattern must be provided in the presentation's `style` block.

Reference CSS for these patterns is available at `themes/basicslide-components.css` for inspiration.

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
<div class="grid-item">
<div class="icon">📊</div>
<h4>Item Title</h4>
<p>Brief description of this item</p>
</div>
<div class="grid-item">
<div class="icon">🚀</div>
<h4>Item Title</h4>
<p>Brief description of this item</p>
</div>
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
<div class="flow-step">
<div class="flow-num">2</div>
<h4>Step Title</h4>
<p>Brief description</p>
</div>
<div class="flow-step">
<div class="flow-num">3</div>
<h4>Step Title</h4>
<p>Brief description</p>
</div>
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
<div class="metric">
<div class="metric-value">3.2x</div>
<div class="metric-label">ROI Improvement</div>
</div>
<div class="metric">
<div class="metric-value">14d</div>
<div class="metric-label">Average Cycle Time</div>
</div>
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

Or for visual emphasis, use the metric pattern with an operator:

```html
<div class="metrics">
<div class="metric">
<div class="metric-value">LTV</div>
<div class="metric-label">Lifetime Value</div>
</div>
<div class="metric">
<div class="metric-value">÷</div>
<div class="metric-label"></div>
</div>
<div class="metric">
<div class="metric-value">CAC</div>
<div class="metric-label">Acquisition Cost</div>
</div>
</div>
```

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

### Design Approach

1. **Start from the message**: What emotion or concept should the shape embody?
2. **Choose a technique**: `::before` / `::after` pseudo-elements, `clip-path`, `linear-gradient`, `radial-gradient`, `border` tricks
3. **Apply with intensity curve**: Bold shapes on title/lead slides, subtle on content slides
4. **Validate**: Does the shape serve the message, or is it decoration? If decoration, remove it

### Shape Techniques Reference

| Technique | CSS Property | Best For |
|---|---|---|
| Solid geometric shapes | `border-style: solid; border-width` | Triangles, arrows |
| Organic blobs | `border-radius: 50%` on sized element | Circles, ellipses |
| Diagonal cuts | `linear-gradient(angle, color stop%, transparent stop%)` | Dynamic energy |
| Textured patterns | `radial-gradient` with `background-size` | Dot grids, technical feel |
| Flowing curves | `clip-path: ellipse()` or `clip-path: polygon()` | Waves, organic shapes |
| Color bands | `linear-gradient(to direction, transparent X%, color X%)` | Side/top accents |

### Intensity by Slide Role

| Slide Role | Shape Intensity | Example |
|---|---|---|
| Title (opening/closing) | Bold | Large corner triangle, full diagonal band, prominent circle |
| Lead (section divider) | Moderate | Medium shape, tinted background |
| Content (standard) | Subtle or none | Thin line, small dot pattern, or clean baseline |
| Data (tables, lists) | None | Data speaks — decoration recedes |

### When NOT to Use Shapes

A presentation with **no shapes** but excellent typography, color, and spacing is a valid and often superior design choice. Shapes should enhance the message — if they don't clearly serve a purpose, omit them.

### Reference Baselines (Historical)

Pre-built motif classes (`motif-geometric`, `motif-organic`, `motif-bold`) and accent shapes (`accent-triangle`, `accent-circle`, etc.) exist in `themes/basicslide-components.css` as comparison baselines. These should NOT be used in new presentations — they represent the template-based approach that bespoke design supersedes

---

## Patterns NOT supported in Marp

The following patterns from c-slide require graphical elements beyond HTML/CSS:

- **Cycle diagrams** (circular flow) — Use `flow` with text note "this cycle repeats"
- **Venn diagrams** (overlapping sets) — Use a table showing shared/unique attributes
- **Pyramid / Funnel** — Use a numbered list from broad to narrow, or embed an image
- **Tree diagrams** (org charts) — Use indented lists, or embed an image
- **Charts** (bar, pie, line) — Embed pre-rendered chart images

For these, prepare the graphic externally and embed with `![alt](path)`.
