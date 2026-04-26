# slide-evaluator Design Doc

## Purpose

Provide an honest, critical assessment of a generated Marp deck — separated from the worker that produced it — so the orchestrator can decide whether to ship, refine, or pivot. Self-evaluation by the worker produces self-congratulatory feedback; an isolated evaluator anchors the 4-axis rubric and design-guideline compliance check.

## Design Decisions

| Decision | Rationale |
|---|---|
| Custom SubAgent (not Built-in) | Invoked every slide-gen run with identical criteria. Custom SubAgent ensures consistent rubric application, restricts tools to read-only, and embeds the procedure as system prompt. |
| `tools: Read, Glob, Grep` (read-only) | Evaluator must never edit slides — fixes belong to the orchestrator's refinement loop. Read-only tooling enforces the boundary. |
| `model: sonnet` | 4-axis scoring against documented criteria is pattern-matching, not deep reasoning. Sonnet is sufficient and keeps invocation cost down for repeated cycles. |
| `maxTurns: 30` | Cover Phase 0 batch read of guideline files + N PNG screenshots in a parallel turn, plus scoring/output. Larger than worker's 17 because screenshot count varies per deck. |
| Reads design-guideline (judgment + rules), NOT patterns | Patterns describe HTML/CSS structure — a worker concern. Evaluator scores the rendered visual result, not the source structure. Reading patterns would conflate authoring with assessment. |
| `design_guideline_dir` passed as absolute path | Same reason as worker (2026-04-22): plugin sub-agents cannot resolve relative skill paths reliably. Orchestrator resolves and caches once, passes to both worker and evaluator. |
| Tone-Aware Evaluation as explicit section | Generic rules applied without tone context degrade designs (luxury whitespace flagged as "unused space", soft tones flagged as low-contrast). Explicit "Is this a problem, or is this the tone working as intended?" check prevents systematic over-flagging on non-default tones. |
| Visual concept passed in input | Without the designer's intent (whitespace plan, intensity curve, shape language), evaluator falls back to generic rubric — which mis-scores intentional choices as defects. Receiving the brief lets evaluator score execution against intent. |
| Font-size pre-check is a gate, not evaluator-internal | Pixel estimation from scaled PNG is unreliable. Font-size compliance is determined upstream by `scripts/check-font-size.sh` parsing the `<style>` block. Evaluator trusts the pre-check result; on script error it falls back to character legibility only, never to pixel guessing. |
| "Do not re-read, do not explore" rule | Prevents context bloat and turn waste. After the initial parallel read of guideline + screenshots, evaluator scores from what it has — uncertainty is reported, not chased. |
| 4-axis rubric (Cohesion, Purpose, Craft, Narrative) | Cohesion and Narrative force deck-level assessment (not slide-by-slide). Purpose anchors evaluation to the user's outcome. Craft preserves per-slide quality. Removing any axis collapses a real failure mode. |
| Top 3 issues, not exhaustive list | Long issue lists overwhelm the orchestrator and hide the load-bearing problems. Three forces prioritization. |
| "Subtract first" fix suggestions | Evaluator's natural instinct is "add an element to fix this." Adding usually hurts cohesion further. Explicit subtract-first principle keeps refinements aligned with the bold-but-clean goal. |

## Data Flow

```
Orchestrator passes:
  ├── PNG screenshot paths (dist/<name>.001.png ...)
  ├── design_guideline_dir (absolute path)
  ├── purpose, audience, tone, unforgettable, visual_concept, palette
  ├── slide role map
  └── font-size pre-check result (PASS or "skipped (script error)")
       ↓
Phase 0: Parallel batch read
  ├── {design_guideline_dir}/SKILL.md
  ├── {design_guideline_dir}/judgment.md
  ├── {design_guideline_dir}/rules.md
  └── all PNG screenshots
       ↓
Scoring:
  ├── Whole-deck impression
  ├── Emphasis match against role map
  ├── 4-axis scores (1–5 each)
  ├── Top 3 issues
  └── Guideline violations (if any)
       ↓
Output: Deck Overview + Scores table + Top 3 Issues + Violations + Recommendation
        (pass / fix and re-evaluate / pivot aesthetic direction)
```

## Constraints & Tradeoffs

| Constraint | Impact | Mitigation |
|---|---|---|
| Cannot estimate pixel sizes from scaled PNG | Font-size compliance unverifiable visually | Pre-check script parses `<style>` upstream; evaluator trusts the gate result |
| sonnet model may drift across versions | Scoring consistency over time | 4-axis rubric + design-guideline as common foundation anchor evaluation. Brief recording (`.local/briefs/`) lets us A/B-detect drift across releases |
| Evaluator has no slide-source access | Cannot diagnose CSS-level causes | Diagnosis is orchestrator's job. Evaluator describes the visual symptom and recommends a class of fix; orchestrator inspects source and applies the fix |
| Tone-aware evaluation requires brief fidelity | If orchestrator passes a vague tone, evaluator falls back to generic rubric | Phase 1 of slide-gen enforces concrete-metaphor tone — vague tones are caught before reaching evaluator |
| 4 axes may not capture all failure modes | Some issues fall outside the rubric (e.g., legal, factual accuracy) | Out of scope — content fidelity is the worker's responsibility, factual review is human audit (L4) |
