---
name: slide-gen
description: Orchestrates Marp slide generation with bespoke visual design. Handles interactive design thinking, then delegates generation to slide-gen-worker SubAgent and evaluation to slide-evaluator SubAgent. Triggered by "create slides", "make a presentation", "slide generation", "スライド作成", "プレゼン作成", or "slide-gen".
---

# Slide Generation (Orchestrator)

Orchestrate the creation of a Marp presentation using the basicslide theme. Each deck gets a **bespoke visual identity** designed from scratch — not assembled from pre-built templates.

Generation and evaluation are delegated to SubAgents for context isolation. This skill handles interactive design thinking and manages the refinement loop.

## Table of Contents

- [Procedure](#procedure)
  - [Phase 1: Design Thinking](#phase-1-design-thinking)
  - [Pre-flight: Environment Check](#pre-flight-environment-check)
  - [Phase 2: Generate Slides](#phase-2-generate-slides-subagent)
  - [Pre-check: Font-size Compliance](#pre-check-font-size-compliance)
  - [Phase 3: Evaluate](#phase-3-evaluate-subagent)
  - [Phase 4: Refinement](#phase-4-refinement)
- [Parallel Variations](#parallel-variations)

## Procedure

### Phase 1: Design Thinking

Before delegating to SubAgents, commit to a **single cohesive visual concept** through interactive design.

**Design philosophy: Push to the extreme.** The real risk is not a design that's too bold — it's a design that's too bland. AI-generated slides converge toward safe, forgettable mediocrity. Counter this by interpreting the user's direction as aggressively as possible. Giant typography, dramatic color, radical whitespace (or radical density), unexpected spatial choices. The evaluator and user will refine excess; no one can inject boldness into boredom.

#### Step 1: Context

- **Purpose**: What is this presentation for? Who is the audience?
- **Constraints**: Language, length, technical level, formality
- **Content mode**: Ask the user — `verbatim` (text placed exactly as written, no rewording) or `default` (layout-driven rewording OK). Users may not know this option exists, so always confirm.

#### Step 2: Tone

Choose a **specific tone** that combines an abstract quality with a **concrete visual metaphor** — a proper-noun-level reference to a physical object, environment, or medium. The metaphor encodes color, density, light behavior, and spatial feel in a single phrase, giving the worker a holistic completion image without CSS specification.

| Abstract only (insufficient) | Abstract + concrete metaphor (good) |
|---|---|
| "high-voltage tactical" | "Void Research Terminal" — gravity anomaly monitor, matte black + violet warning lights |
| "celebratory energy" | "Midnight Billboard" — neon signage glowing against pure black, minimal, self-illuminating |
| "warm invitation" | "Sunday Morning Café Menu" — cream paper, hand-drawn serif, warm amber light |
| "surgical precision" | "Operating Room Display" — sterile white, single teal accent, monospaced readouts |

The concrete object carries visual attributes (color, density, light, spatial feel) implicitly — the worker and Step 4 will derive them. The abstract quality carries mood and emotional direction. Together they define a tone that is both specific enough to implement and expressive enough to guide design decisions.

**Style reference** (optional but powerful): Ask the user if there's a known presentation style or brand that fits the content. When given a reference, interpret it at its most extreme — take the brand's most distinctive visual trait and amplify it. If the reference is Apple, push minimalism until it hurts. If it's Supreme, make the logo placement so bold it's almost offensive. If it's a quiet luxury brand, make the whitespace feel like a statement of wealth. The reference is a direction to sprint in, not a template to copy.

#### Step 3: UNFORGETTABLE Element

Define the **ONE thing** someone will remember — a **visual effect derived from the tone's metaphor**. Describe WHAT it looks like and WHERE it appears, not HOW to implement it in CSS. The worker derives the implementation from the metaphor.

The UNFORGETTABLE must be **derived from the tone's metaphor**. Ask: "What visual form does this metaphor naturally produce?" The form follows the metaphor — a neon billboard produces a glowing edge, a 30th anniversary produces a ghost "30", a graph-paper notebook produces a dot grid. If your UNFORGETTABLE could be swapped into a completely different presentation without anyone noticing, it's not derived from the metaphor.

The range is wide: ghost watermarks, full-surface textures, large geometric shapes, ambient gradients, typographic treatments, edge accents, or something entirely new. Do not default to any single category.

**Three judgment checks before committing:**

1. **Semantic weight** — Does the element carry meaning, or is it just decoration? A ghost "30" for a 30th anniversary IS the occasion. A product number as a watermark is just a label repeated. The stronger the meaning, the bolder it can be.
2. **Placement** — Which slides benefit from this element? A meaningful watermark on the cover only can be more powerful than a weaker one on every slide. Data-heavy slides (spec tables, comparison charts) may need the UNFORGETTABLE to step back or disappear so content can breathe.
3. **Content compatibility** — Does it help or fight the content on each slide? Low-opacity textures and edge accents coexist with dense content. Large overlapping elements can hurt readability on data slides.

| Bad (abstract / not visual) |
|---|
| "The product emerges from darkness" |
| "A narrative arc with a surprising turn" |
| "The audience feels urgency" |

**Do NOT specify CSS techniques** (e.g., `clip-path: polygon()`, `::before`). The concrete tone metaphor from Step 2 gives the worker enough context to derive the implementation independently.

#### Step 4: Visual Concept (Holistic)

**Derive** the visual concept from the tone metaphor (Step 2) and UNFORGETTABLE element (Step 3). The concept should feel like a natural consequence of the metaphor, not an independent design exercise.

Design ONE unified visual language for this deck. Do NOT select from pre-built templates. Instead, ask:

1. **Color**: ONE hue family. What color does the metaphor's environment naturally have?
2. **Shape language**: Does this deck need a decorative shape? If yes, design ONE shape that embodies the message. If no, the clean baseline is your design.
3. **Typography**: Serif or sans? Tight or relaxed? What would text look like in the metaphor's environment?
4. **Whitespace**: Dense and urgent, or generous and contemplative? How much space exists in the metaphor?
5. **Intensity curve**: How does visual weight flow across slides?

**Coherence check**: Read your 5 decisions together. Could someone guess the tone from font weight, letter-spacing, and color palette alone (no text)? If not, the metaphor is too vague — go back to Step 2. Every element must serve the tone — remove purposeless decoration, but add more elements (badges, cards, accent lines) when they reinforce it.

Write the plan as a brief outline before proceeding to Phase 2.

### Pre-flight: Environment Check

Run once before the first SubAgent invocation. Skip items that already pass.

The skill directory (where this SKILL.md lives) contains bundled `themes/` and `scripts/` directories. Use the path of this skill file to locate them — read the skill base directory, then copy resources to the project.

#### Project Setup (first run only)

| # | Check | Pass condition | Fix |
|---|---|---|---|
| 1 | `themes/basicslide.css` exists in project root | File exists | Copy from this skill's `themes/` directory to project `themes/` |
| 2 | `scripts/build-one.sh` exists in project root | File exists | Copy from this skill's `scripts/` directory to project `scripts/` and `chmod +x` |
| 3 | `scripts/check-font-size.sh` exists in project root | File exists | Copy from this skill's `scripts/` directory to project `scripts/` and `chmod +x` |
| 4 | `marp.config.mjs` exists in project root | File exists | Generate with the content below |
| 5 | `package.json` has `@marp-team/marp-cli` | Listed in devDependencies | Run `npm init -y && npm install --save-dev @marp-team/marp-cli` |

**marp.config.mjs template** (generate if missing):

```js
const config = {
  inputDir: './slides',
  output: './dist',
  themeSet: ['./themes'],
  html: true,
};

export default config;
```

#### Runtime Dependencies

| # | Check command | Pass condition | Fix command |
|---|---|---|---|
| 6 | `npx marp --version` | Outputs version | `npm install` |
| 7 | `which chromium` | Returns a path | `sudo apt-get update -qq && sudo apt-get install -y -qq chromium` |
| 8 | `fc-list \| grep -i "noto.*cjk"` | Returns results | `sudo apt-get install -y -qq fonts-noto-cjk fonts-noto-cjk-extra` |

**On failure**: Report the issue and stop. Do not launch SubAgents until all checks pass.
**On refinement cycles**: Skip — environment was already verified.

### Phase 2: Generate Slides (SubAgent)

Launch the `slide-gen-worker` Custom SubAgent via the Agent tool.

**Pass ALL of the following in the prompt:**

1. **filename**: Output path (e.g., `slides/my-presentation.md`)
2. **purpose**: From Phase 1 Step 1
3. **audience**: From Phase 1 Step 1
4. **tone**: From Phase 1 Step 2
5. **unforgettable**: From Phase 1 Step 3
6. **visual_concept**: Full outline from Phase 1 Step 4
7. **content**: Complete slide content — all text, data, structure per slide
8. **content_mode**: `default` or `verbatim` (default if omitted). Verbatim mode places all text exactly as written — no rewording, no shortening

**Content fidelity**: Pass the user's content **verbatim** in the prompt. Do NOT summarize or rewrite it — the worker owns content fidelity (see worker's Content Fidelity section for the full rule).

**Do NOT pass:**
- Existing slide file paths or CSS from other presentations
- References to previous versions or designs

The worker will read design-guideline files, generate the Marp file, build it, and return screenshot paths.

### Pre-check: Font-size Compliance

Run `scripts/check-font-size.sh` on the generated slide file before launching the evaluator:

```bash
scripts/check-font-size.sh slides/<name>.md
```

This script extracts all CSS `font-size` declarations, converts rem/em to px, and checks against design-guideline thresholds. See the script header for threshold details.

- **On PASS**: Proceed to Phase 3. Include "Font-size pre-check: PASS" in the evaluator prompt.
- **On FAIL**: Include the full violation list in the evaluator prompt so the evaluator can report them without visual pixel estimation. Also consider fixing the violations before evaluation if they are clearly wrong (e.g., body text at 19px).
- **On error** (script not found, awk failure): Skip pre-check. Include "Font-size pre-check: skipped (script error)" in the evaluator prompt so it does not fall back to visual pixel estimation.

### Phase 3: Evaluate (SubAgent)

Launch the `slide-evaluator` Custom SubAgent via the Agent tool.

**Pass ALL of the following** (the evaluator needs the same design context as the worker to judge tone-appropriately):

1. Screenshot file paths from Phase 2 output
2. **Presentation purpose**: what the audience should decide, feel, or do
3. **Audience**: from Phase 1 Step 1
4. **Slide role map**: each slide number with its role (key message / supporting / opening / closing)
5. **UNFORGETTABLE element**: from Phase 1 Step 3
6. **Tone**: from Phase 1 Step 2
7. **Visual concept**: full outline from Phase 1 Step 4 (including whitespace intent, shape language, intensity curve)
8. Design intent: palette description from Phase 1
9. **Font-size pre-check results**: output from `scripts/check-font-size.sh` (PASS or violation list)

The evaluator reads design-guideline files and scores 4 axes (Cohesion & Rhythm, Purpose Alignment, Craft, Narrative Flow) at 1-5 each, returns top 3 issues, guideline violations, and recommends "pass", "fix and re-evaluate", or "pivot".

**Minimum passing: 3 on all axes.**

**On evaluator failure** (agent error, timeout): Fall back to manual review — read each screenshot yourself and evaluate against the 4-axis rubric. Note that evaluation was manual.

### Phase 4: Refinement

Based on Phase 3 evaluation:

| Recommendation | Action |
|---|---|
| **Pass** | Done. Declare completion |
| **Fix and re-evaluate** | Re-launch worker with evaluator feedback → re-evaluate. Max 3 cycles |
| **Pivot** | The visual concept isn't working. Return to Phase 1 Step 4, simplify or redesign |

**On max cycles exceeded**: Stop. Report the current scores, remaining issues, and the best version produced. Let the user decide.

**Refinement principle**: When in doubt, subtract.

**Direct CSS fixes**: When fixing CSS directly instead of re-launching the worker, refer to the **Marp SVG foreignObject constraints** table in `slide-gen-worker/agent.md` (`### CSS Techniques` section) for background-image requirements, explicit class requirements, and centering limitations.

---

## Parallel Variations

To generate multiple design variations for comparison:

1. In Phase 1, develop **2-3 distinct design briefs** with different tones, colors, and shape approaches
2. Launch **multiple `slide-gen-worker` SubAgents in parallel** with unique filenames (e.g., `<name>-a.md`, `<name>-b.md`)
3. After all workers complete, launch **multiple `slide-evaluator` SubAgents in parallel**
4. Present scores side-by-side to the user
5. User picks the winner for refinement

This is opt-in — only use when the user explicitly requests variations or comparison.
