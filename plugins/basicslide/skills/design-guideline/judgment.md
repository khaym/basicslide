# Design Judgment for Slides

The lens for deciding whether a design works. Bold philosophy first, perceptual and strategic principles in the middle, concrete anti-patterns at the end.

## Table of Contents

- [Bold Design Principles](#bold-design-principles)
- [Presentation Context](#presentation-context)
- [Perceptual Foundations](#perceptual-foundations)
  - [1. Figure-Ground](#1-figure-ground)
  - [2. Proximity](#2-proximity)
  - [3. Similarity](#3-similarity)
  - [4. Good Continuation](#4-good-continuation)
- [Strategic Principles](#strategic-principles)
  - [5. Hierarchy](#5-hierarchy)
  - [6. Contrast / Emphasis](#6-contrast--emphasis)
  - [7. Rhythm](#7-rhythm)
  - [8. Unity](#8-unity)
- [The Principle Chain](#the-principle-chain)
- [Anti-Patterns](#anti-patterns)
- [Principles vs. Rules](#principles-vs-rules)

---

## Bold Design Principles

### Intentionality Over Intensity

Before designing, commit to:

1. **Tone**: Not "professional" (too vague) but something specific: "surgical precision", "warm invitation", "urgent rally cry", "quiet authority"
2. **UNFORGETTABLE Element**: The ONE thing someone remembers. A metric, a narrative arc, a typographic choice. If you can't name it, the deck has no identity
3. **Differentiation**: What makes this deck distinct from 100 others on the same topic?

### Evaluation

Presentations are scored by the slide-evaluator on 4 axes (1-5 each, minimum 3 to pass):

1. **Cohesion & Rhythm** — Do emphasis slides stand out? Do supporting slides recede?
2. **Purpose Alignment** — Is the UNFORGETTABLE element unmissable?
3. **Craft** — Typography, spacing, alignment, readability at projection size
4. **Narrative Flow** — Do headings in sequence tell a story?

The generator does NOT evaluate its own work.

---

## Presentation Context

Slides differ from web pages in ways that shift which principles matter most.

| Property | Web | Slide |
|---|---|---|
| Canvas | Infinite scroll, content-driven height | Fixed 720px viewport — every pixel is a decision |
| Viewing distance | Arm's length (40-60cm) | Projected (2-10m) or shared screen — small details vanish |
| Exposure time | Self-paced, seconds to minutes per section | ~3-10 seconds per slide — hierarchy must be instant |
| Context | Single page, mostly independent | Sequential — each slide is perceived relative to the previous one |

These properties mean **Hierarchy** and **Figure-Ground** carry more weight than on web, and **Rhythm** matters because the audience experiences slides as a temporal sequence.

How to read the principles below:

- Each principle is a **starting point for judgment**, not a prohibition
- When a principle is satisfied, the designer's expression is unconstrained — bold, minimal, dense, sparse are all valid
- When a principle is violated, the audience's perception breaks down regardless of how polished the execution is
- Principles interact: satisfying one often requires awareness of others

---

## Perceptual Foundations

These principles describe how the human visual system organizes what it sees. They are not design choices — they are cognitive facts. Designs that work *with* these tendencies feel natural; designs that work *against* them feel confusing.

### 1. Figure-Ground

> The visual system separates every scene into **figure** (the object of attention) and **ground** (the background that recedes).

**On slides**: Content (text, data, key visuals) is figure. Backgrounds, textures, decorative patterns, and ambient shapes are ground. The audience should never have to consciously decide which is which.

**Judgment**: Remove the ground layer mentally. Does the figure still read clearly? Now remove the figure. Does the ground demand attention on its own? If the ground competes with the figure, Figure-Ground separation has failed — regardless of how aesthetically pleasing the ground is.

**Common breakdowns**:
- A dot-grid or texture whose contrast approaches that of body text — the ground becomes a second figure
- A decorative shape that overlaps content at similar visual weight — figure/ground ambiguity
- A dark motif on a dark background where neither reads as definitively "in front"

**The fix is not to weaken the ground by rule** (e.g., "textures must be below X contrast"). The fix is to ensure the perceptual separation is unambiguous. A bold, high-contrast ground can work if the figure is bolder still.

### 2. Proximity

> Elements that are spatially close are perceived as belonging to the same group.

**On slides**: The distance between elements should reflect their semantic relationship. Related items cluster; unrelated items are separated by clearly larger gaps.

**Judgment**: Does the spatial grouping match the meaning? If an annotation sits adjacent to body text at the same spacing used between body paragraphs, the audience perceives it as another paragraph — not as a meta-comment from a different information layer.

**Common breakdowns**:
- Annotations/captions placed inline with body content — they join the body group
- Unrelated elements pushed together by centering or space-filling — false grouping
- "Fill the space" fixes that collapse the gap between content and decoration — proximity says they are related when they are not

**Proximity governs layout placement decisions.** When the question is "where should this element go?", the answer comes from "what is it semantically closest to?" Footer-area placement for meta-information, margin placement for annotations — these are not arbitrary conventions but Proximity applied to information layers.

### 3. Similarity

> Elements that share visual attributes (color, size, shape, weight) are perceived as belonging to the same category.

**On slides**: Same role → same appearance. Different role → visibly different appearance. The audience infers meaning from visual resemblance faster than from reading labels.

**Judgment**: Can you identify every element's role (heading, body, annotation, decoration, data) from appearance alone, without reading the text? If two elements look the same but serve different purposes, Similarity is creating a false equivalence.

**Common breakdowns**:
- Annotations styled identically to body text — role ambiguity
- Different heading levels using the same font size and weight — hierarchy collapse
- Decorative labels (e.g., "FIG.01") styled at the same prominence as content text — the audience cannot tell which to read

### 4. Good Continuation

> The eye follows smooth paths and continuous lines, grouping elements along those paths.

**On slides**: Alignment creates invisible lines that the eye follows. Consistent left-alignment across slides creates a reading rail. Intentional breaks in alignment signal a change in section or emphasis.

**Judgment**: Are elements aligned to a consistent grid or rail? Do breaks in alignment correspond to meaningful transitions?

---

## Strategic Principles

These principles are intentional choices designers make. Unlike Gestalt principles (which describe perception), these describe *strategy* — how to direct perception toward the presentation's purpose.

### 5. Hierarchy

> Information has levels of importance, and those levels must be visually encoded.

**On slides**: Every element occupies a level: primary content (headings, key messages) → supporting content (body, data) → meta-information (annotations, captions, page numbers) → ambient (decoration, texture). Each level must have distinctly lower visual weight than the one above it.

**Judgment**: Squint at the slide. The highest-hierarchy element should be the first thing you see. The lowest should be nearly invisible unless you look for it. If an annotation is as visually prominent as body text, or body text is as prominent as the heading, the hierarchy has collapsed.

**Hierarchy is the master principle for slides.** With only 3-10 seconds of attention per slide, the audience *must* grasp the hierarchy instantly. Typography size, weight, color saturation, spatial position, and contrast all encode hierarchy. They must agree — if the font says "I am secondary" but the color says "I am primary," the hierarchy is ambiguous.

**Hierarchy across slides**: In a deck, slides themselves have hierarchy. Title and closing slides are highest. Key message slides are high. Supporting/data slides are medium-low. This is the "intensity curve" — the deck-level hierarchy that creates dramatic structure.

### 6. Contrast / Emphasis

> Important elements stand out through difference from their surroundings.

**On slides**: The most important element on a slide should be the most visually distinct. The most important slide in a deck should be the most visually distinct. Contrast can be created through size, color, weight, whitespace, position, or any combination.

**Judgment**: What is the first thing the eye lands on? Is that the most important thing? If the eye lands on a decorative element or a secondary detail, contrast is misdirected.

**Contrast is Hierarchy's tool.** Hierarchy says *what* should be prominent; Contrast says *how* to make it prominent. A slide where everything has the same visual weight has no contrast — and therefore no hierarchy — and the audience must read everything to find the point.

**Contrast between slides**: In a sequence, contrast between adjacent slides creates rhythm. A loud slide followed by a quiet slide creates a breathing pattern. Five consecutive slides at the same volume creates monotony.

### 7. Rhythm

> Repetition and variation across a sequence create a sense of movement and pacing.

**On slides**: The deck is a temporal experience. The audience encounters slides one by one. Rhythm is the pattern of intensity changes across this sequence: tension → release → tension. Uniform intensity is monotonous. Random intensity is chaotic.

**Judgment**: Flip through the slides quickly (1 second each). Do you feel a pulse — moments of visual intensity alternating with quieter passages? Or does every slide feel the same?

**Rhythm emerges from Hierarchy and Contrast applied to the sequence.** It is not a separate layer to design — it is the natural consequence of assigning each slide its correct hierarchical role and then giving that role the appropriate contrast level.

### 8. Unity

> The whole is perceived as a single coherent entity.

**On slides**: Every slide in the deck should feel like it belongs to the same visual family. Color palette, typography choices, shape language, spacing rhythm, and treatment of recurring elements (headings, dividers, annotations) must be consistent.

**Judgment**: Pull any single slide out of context. Can someone identify which deck it belongs to? If the slide could plausibly belong to a different presentation, unity is weak.

**Unity constrains variety.** Variety (different layouts, different intensity) happens *within* the unity framework — like movements in a symphony sharing a key signature. If variety breaks unity, the deck feels assembled from parts rather than designed as a whole.

**Recurring elements need disciplined variation.** When a single visual device (motif, watermark, seal, accent band, edge stroke) appears on multiple slides, each of its properties — position, size, color, opacity — must either be **fixed** across all instances or **vary along one axis** with intent. Variation along multiple uncoordinated axes — a band that alternates top/bottom without rule, a watermark that drifts between corners without rhythm, color that jumps between hue families — reads as accident, not design.

When variation IS intentional (intensity tier, day-cycle drift, hierarchy), the steps must be perceptually even. Hand-picking each slide's value produces visible jumps. Pick start and end, divide along a perceptual curve (Kelvin steps, hue degrees, geometric size ratios), snap intermediates to that curve.

**Validation**: For each property that varies across instances, state in one sentence WHY it varies. If no sentence comes, the variation has no intent and Unity is breaking.

---

## The Principle Chain

**Figure-Ground → Hierarchy → Proximity + Similarity → Contrast → Rhythm → Unity**

When evaluating a slide or deck, walk this chain. If Figure-Ground is broken, nothing else matters. If Hierarchy is unclear, Contrast and Rhythm cannot function. If Proximity and Similarity disagree with Hierarchy, the audience receives contradictory signals.

| Perception (how the eye reads) | Strategy (how the designer directs) |
|---|---|
| Figure-Ground — ground must recede | Hierarchy — figure IS the hierarchy; each level has distinct weight |
| Proximity — semantic distance = spatial distance | Hierarchy — annotations far from body = different information layer |
| Similarity — same look = same role | Hierarchy — different role = different look |
| | Contrast / Emphasis — makes hierarchy visible |
| | Rhythm — hierarchy applied to the slide sequence over time |
| | Unity — constrains all of the above into a coherent whole |

---

## Anti-Patterns

Patterns AI generators converge to. Sanity check before submitting. AI-generated slides converge toward recognizable mediocrity in three categories:

- **Content slop** — generic titles, identical heading-and-3-bullets every slide, filler paragraphs that restate the title
- **Visual slop** — purple gradients, single-edge colored borders, `invert` alternating, decorative shapes with no spatial role
- **Structural slop** — every section the same length, no density variation, lead slides removable without loss

These violate Figure-Ground (decoration competes with content), collapse Hierarchy (every slide the same weight), or fake Unity (variety without intentional rhythm).

### Web Habits That Misfire on Slides

| Web habit | Slide approach |
|---|---|
| Content determines height | Split slides — never shrink fonts to fit |
| Fixed small padding | Generous padding proportional to viewport |
| Horizontal cards with ragged heights | See Layout Alignment in [rules.md](rules.md) |

### AI Slop Visuals

| Pattern | Fix |
|---|---|
| Single-edge colored border (`border-top` / `-bottom` / `-left` / `-right: Npx solid accent`) on cards, text, or slide backgrounds | Full-surface treatment, semantic accent (heading color or inline badge), or remove |
| Purple gradient backgrounds | Pick a hue that relates to the tone or content |
| `invert` on alternating slides | Reserve inversion for real shifts (key message, climax, section change) |
| Standalone vertical bar as lead decoration | Span the bar across content as one unit, or remove |
| Decorative shape with no spatial role | Shape must anchor, separate, or frame content. If unsure, remove |

**Edge accents repeated**: a single occurrence may be a deliberate statement; the same edge accent on 5+ slides reads as auto-generated. Confine to one or remove from all.

**Pseudo-edge counts too**: `background-image: linear-gradient(to right, accent 0px, accent Npx, transparent Npx)` renders the same as `border-left`. The rendered result is what matters.

### AI Slop Content

| Pattern | Fix |
|---|---|
| "Key Takeaways" / "Let's Dive In" titles | Title names the actual content |
| Identical heading + 3 bullets on every slide | Vary structure based on content type |
| Filler paragraphs that restate the title | Cut, or make it genuinely additive |

---

## Principles vs. Rules

This document avoids numeric thresholds and categorical prohibitions. Rules like "center content when it occupies less than 60% of the viewport" are **conclusions**, not principles. They work in some contexts and fail in others.

The principle behind that rule is **Balance**: content placement should feel intentional, not accidental. Centering is *one* way to achieve intentional placement. Anchoring to a top-left reading rail with generous ground space is another. Pinning annotations to the footer margin is yet another. All satisfy Balance; only the first satisfies the rule.

When a rule and a principle conflict, **the principle wins**. Rules are shortcuts for common cases. Principles are the reasoning that generates those shortcuts — and generates better solutions for uncommon cases.

**Accessibility thresholds** (minimum font sizes, contrast ratios) are the one exception. These are not design principles but **physical constraints** of the viewing environment (projection distance, screen resolution). They apply unconditionally and are documented in [rules.md](rules.md) (Accessibility Baseline).
