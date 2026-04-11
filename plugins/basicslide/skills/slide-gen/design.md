## Purpose

Generate presentation slides that have a bespoke visual identity — not assembled from templates, but designed holistically for each presentation's content and tone. The skill encodes an orchestrator pattern with generator-evaluator separation using SubAgents, ensuring design isolation and consistent evaluation.

## Design Decisions

| Decision | Rationale |
|---|---|
| Bespoke CSS per presentation (not template selection) | Pre-built motifs create a quality ceiling — "assembled from parts" feeling. Each deck needs 100-200+ lines of bespoke CSS in the style block to feel like its own theme. Learned from failed motif-selection approach (2026-04). |
| Generator-evaluator separation (SubAgents) | Self-evaluation produces self-congratulatory feedback. A separate Custom SubAgent (`slide-evaluator`) provides honest critique. Based on Anthropic's "Harness Design" methodology. |
| Orchestrator + SubAgent separation | Generator running in main conversation context was anchored by previously-read slide designs, producing structurally similar output. SubAgent isolation ensures fresh design context. Confirmed by v4→v5 anchoring test (2026-04). |
| slide-gen-worker as SubAgent | Receives only a design brief (content + direction). Does NOT read existing slides or `basicslide-components.css` to prevent anchoring. Reads `basicslide.css` (tokens) and design-guideline (principles) at runtime. |
| Evaluator reads design-guideline | Without shared design vocabulary, evaluator missed intensity curve violations, contrast failures, and slide space misuse. Both generator and evaluator now read design-guideline as common foundation (2026-04). |
| Custom SubAgent for evaluator (not Built-in) | Evaluator is invoked every slide-gen run with identical criteria. Custom SubAgent ensures consistent 4-axis scoring, uses sonnet for cost efficiency, and restricts tools to read-only. |
| Phase 1 stays in orchestrator SKILL | Design Thinking requires interactive user input (tone, UNFORGETTABLE element, visual concept). SubAgents cannot interact with users. |
| Environment check in orchestrator (not worker) | Chromium and CJK fonts are not pre-installed in Docker/Codespace environments. Check-then-fix pattern avoids mid-flow failures. Runs once in orchestrator before first SubAgent invocation, saving ~3 worker turns per generation cycle. |
| UNFORGETTABLE element in Phase 1 | Forces the generator to commit to a design identity before writing. Without this, decks converge to generic structure. Adapted from Anthropic's frontend-design skill. |
| "Remove > Add" refinement principle | The evaluator's default instinct is to suggest additions ("add red for contrast"). This made v1 worse by breaking cohesion. Explicit "subtract first" principle prevents this. |
| Tokens/reference CSS split (2026-04) | Old architecture: basicslide.css had strong visual defaults, AI gravitated to just changing color variables. New: basicslide.css provides only tokens + structural skeletons; basicslide-components.css is reference-only (not loaded by Marp). Forces style block to provide ALL visual CSS. |
| Color palette: single hue family | Multiple hues break cohesion (learned from teal+red failure). Contrast comes from typography and whitespace, not color variety. |
| Parallel variation support | Orchestrator can launch multiple workers with different briefs for side-by-side comparison. Opt-in only. |
| Content Fidelity rule in worker (2026-04) | Testing revealed the worker changed specific dates, financial figures, and omitted names despite explicit instructions. Root cause: worker treated content as "inspiration" and regenerated from its own knowledge. Fix: added Content Fidelity section to worker agent.md as Allowed/NOT Allowed table. Orchestrator references this rule but doesn't duplicate it (Single Source of Truth). |
| Intensity hierarchy > space utilization (2026-04) | The 70-90% slide space rule caused a feedback loop: evaluator flagged "unused space" → worker oversized supporting elements → supporting slides outshout the key message slide → evaluator flags intensity inversion → no convergence. Fixed by making space utilization context-dependent (text-heavy vs visual/promotional) and establishing "intensity hierarchy always wins" as a priority rule across evaluator, worker, and guideline. Discovered via promotional slide 3-pattern test. |
| Style reference as component system trigger (2026-04) | Testing showed well-known style references (e.g. consulting firm or analyst report styles) triggered rich component systems (KEY INSIGHT boxes, ANALYST NOTE callouts, verdict scorecards) that tone alone didn't produce. The pattern without style reference was competent but generic. Style references encode not just colors/fonts but entire visual vocabularies. Added as optional step in Phase 1 Step 2 — without hardcoding specific brand names to avoid anchoring. |
| Phase 1 simplicity > Phase 1 detail (2026-04) | Three rounds of promotional slide tests showed: Round 1 (simple brief, no CSS-level specs) produced the best results — all 3 patterns had consistent quality with strong design coherence. Round 2 (no motif guidance) was worst. Round 3 (detailed CSS-level motif specs) improved over Round 2 but was worse than Round 1 — motifs were present but typography/spacing didn't reinforce the concept. Root cause: detailed motif specs caused the orchestrator to focus on individual element specification rather than holistic coherence. Fix: reverted to Round 1's simple structure, added only a coherence check ("can you guess the tone from font/color/spacing alone?"). The key driver of quality is tone specificity + coherence, not specification granularity. |
| Concrete tone metaphor > CSS specification (2026-04) | Voidfront A/B/C test (3 variants × 3 fix cycles): A=abstract tone + CSS-specified UNFORGETTABLE (13/20 final), B=abstract tone + visual-only UNFORGETTABLE (10/20, regressed in Fix 2), C=concrete tone metaphor + bottom-positioned UNFORGETTABLE without CSS spec (14/20, stable). Concrete metaphor ("Void Research Terminal") encoded color/density/light/space in one phrase — worker derived CSS implementation independently. CSS specification was unnecessary when tone was concrete; it only stabilized abstract tones. Bottom/right position constraint prevented content interference that plagued diagonal placements in A/B. |

## Data Flow

```
User input (topic, audience, tone)
  → Phase 1: Design thinking (tone, UNFORGETTABLE element, visual concept)
     [Interactive — runs in orchestrator SKILL]
  → Pre-flight: Environment check (chromium, fonts, npm) — once only
  → Phase 2: Launch slide-gen-worker SubAgent
     ├── Reads design-guideline (3 files) + basicslide.css (tokens)
     ├── Generate Marp Markdown with 100-200+ lines bespoke CSS
     ├── Build PNG images (marp --images png)
     └── Returns: file path, PNG paths, role map, design summary
  → Phase 3: Launch slide-evaluator SubAgent
     ├── Reads design-guideline (2 files)
     ├── Reads all PNG screenshots
     ├── Scores 4 axes + guideline compliance
     └── Returns: scores, issues, guideline violations, recommendation
  → Phase 4: Refinement loop (orchestrator manages)
     ├── pass → complete
     ├── fix → re-launch worker with feedback (max 3 cycles)
     └── pivot → Phase 1 Step 4 (redesign visual concept)
  → Output: Reviewed .md file + PNG images in dist/

  [Optional: Parallel mode]
  → Phase 1: Create 2-3 distinct design briefs
  → Phase 2: Launch multiple workers in parallel
  → Phase 3: Launch multiple evaluators in parallel
  → Present scores side-by-side → user picks winner
```

## Constraints & Tradeoffs

| Constraint | Impact | Mitigation |
|---|---|---|
| Marp CSS-only (no JavaScript) | Cannot express animations, interactions, or dynamic content | CSS `::before`, gradients, clip-path provide substantial visual range |
| Marp Chromium CSS compatibility | `inset: 0` and some modern CSS not supported | Document known incompatibilities in worker agent reference section |
| Style block size vs readability | 150+ lines of CSS in frontmatter can be hard to maintain | Organized by slide type with comments; base theme provides only tokens and structural skeletons |
| Single hue family limits palette range | Cannot use complementary color schemes | Intentional — cohesion > range. Contrast via typography/whitespace |
| Worker agent 17-turn limit | Complex decks with build errors may need more turns | Reduced from 20 after moving environment check to orchestrator (saves ~3 turns per invocation). Monitor in practice |
| Design foundation reading costs 3-4 turns | Startup overhead per SubAgent invocation | Unavoidable — embedding creates maintenance burden and content duplication |
| Evaluator consistency | Custom SubAgent may drift across versions | 4-axis rubric + design-guideline checks anchor evaluation |
| CJK font availability | Varies by environment; only Noto Sans/Serif CJK JP guaranteed | Theme font stack includes fallbacks; environment check installs fonts |
