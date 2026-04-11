---
marp: true
theme: basicslide
paginate: true
---

<style>
/* ==========================================================================
   AETHER-01 — Braun Design Manual Identity
   Palette: Warm Gray #F5F2EE + Soft Black #2C2C2C + Signal Orange #E86C2C
   Inspired by Dieter Rams / Braun 1960s product catalogs
   ========================================================================== */

/* --- Palette Override --- */
section {
  --color-primary: #E86C2C;
  --color-primary-light: #FAE9DC;
  --color-primary-hover: #C4551A;
  --color-primary-dark: #A03E0E;
  --color-primary-muted: #F2C4A0;
  --color-primary-soft: #F5B380;
  --color-primary-deep: #7A2E08;
  --color-surface-accent: #FAE9DC;

  --color-text: #2C2C2C;
  --color-text-secondary: #5A5752;
  --color-text-tertiary: #9A9590;
  --color-surface: #F5F2EE;
  --color-surface-secondary: #EDE9E4;
  --color-border: #D8D3CC;
  --color-border-strong: #B8B2AA;
}

/* --- Base Section: Warm Paper Background --- */
section {
  background-color: #F5F2EE;
  color: #2C2C2C;
  font-family: "Noto Sans JP", "Yu Gothic Medium", sans-serif;
  font-size: 20px;
  font-weight: 300;
  letter-spacing: 0.04em;
  line-height: 1.7;
  padding: 64px 80px;
  position: relative;
}

/* --- Page Number --- */
section::after {
  font-size: 14px;
  color: #9A9590;
  letter-spacing: 0.08em;
}

/* --- Content Headings --- */
section h2 {
  font-size: 36px;
  font-weight: 500;
  color: #2C2C2C;
  letter-spacing: 0.06em;
  margin-bottom: 6px;
  padding-bottom: 0;
  border: none;
  text-transform: none;
}

/* Orange accent line under h2 */
section h2::after {
  content: "";
  display: block;
  width: 40px;
  height: 3px;
  background-color: #E86C2C;
  margin-top: 10px;
  margin-bottom: 20px;
}

section h3 {
  font-size: 34px;
  font-weight: 400;
  color: #E86C2C;
  letter-spacing: 0.04em;
  text-transform: none;
  margin-top: 24px;
  margin-bottom: 10px;
}

section h4 {
  font-size: 34px;
  font-weight: 400;
  color: #5A5752;
  letter-spacing: 0.04em;
  margin-bottom: 6px;
}

section p {
  font-size: 22px;
  font-weight: 300;
  line-height: 1.75;
  color: #2C2C2C;
  letter-spacing: 0.04em;
  margin-bottom: 0;
}

section ul, section ol {
  padding-left: 0;
  list-style: none;
  margin-bottom: 0;
}

section li {
  font-size: 22px;
  font-weight: 300;
  line-height: 1.7;
  color: #2C2C2C;
  letter-spacing: 0.03em;
  padding-left: 20px;
  position: relative;
  margin-bottom: 12px;
}

section li::before {
  content: "";
  position: absolute;
  left: 0;
  top: 13px;
  width: 8px;
  height: 2px;
  background-color: #E86C2C;
}

section li::marker {
  content: none;
  color: transparent;
}

/* --- Ordered list custom styling --- */
section ol {
  counter-reset: braun-counter;
}

section ol li {
  counter-increment: braun-counter;
  padding-left: 36px;
}

section ol li::before {
  content: counter(braun-counter, decimal-leading-zero);
  position: absolute;
  left: 0;
  top: 0;
  width: 36px;
  font-size: 22px;
  font-weight: 500;
  color: #E86C2C;
  letter-spacing: 0.04em;
  background: none;
  height: auto;
}

/* --- Table styling --- */
section table {
  font-size: 22px;
  font-weight: 300;
  letter-spacing: 0.03em;
  border-collapse: collapse;
  width: 100%;
  margin-top: 8px;
  margin-bottom: 0;
  box-shadow: none;
  border-radius: 0;
}

section thead th {
  background-color: #2C2C2C;
  color: #F5F2EE;
  font-weight: 500;
  font-size: 22px;
  letter-spacing: 0.06em;
  padding: 10px 16px;
  text-align: left;
}

section tbody td {
  padding: 8px 16px;
  border-bottom: 1px solid #D8D3CC;
  color: #2C2C2C;
}

section tbody tr:nth-child(even) {
  background-color: #EDE9E4;
}

section tbody tr:last-child td {
  border-bottom: none;
}

/* First column emphasis in spec table */
section tbody td:first-child {
  font-weight: 500;
  color: #2C2C2C;
  letter-spacing: 0.04em;
}

section tbody td:nth-child(2) {
  font-weight: 500;
  color: #E86C2C;
}

/* ==========================================================================
   TITLE SLIDE — Signal Orange circle as protagonist
   ========================================================================== */

section.title {
  background-color: #F5F2EE;
  text-align: left;
  justify-content: center;
  align-items: flex-start;
  padding: 72px 80px;
  overflow: hidden;
  position: relative;
}

/* Large orange circle bleeding off right edge — Braun dial motif */
section.title::before {
  content: "";
  position: absolute;
  top: 50%;
  right: -160px;
  width: 480px;
  height: 480px;
  margin-top: -240px;
  background: radial-gradient(circle, #E86C2C 0%, #C4551A 60%, #A03E0E 100%);
  border-radius: 50%;
  z-index: 0;
}

section.title > * {
  position: relative;
  z-index: 1;
}

section.title .label {
  font-size: 22px;
  font-weight: 400;
  letter-spacing: 0.14em;
  color: #9A9590;
  text-transform: uppercase;
  margin-bottom: 28px;
}

section.title h1 {
  font-size: 44px;
  font-weight: 300;
  color: #2C2C2C;
  letter-spacing: 0.05em;
  line-height: 1.25;
  margin-bottom: 20px;
  border: none;
  max-width: 600px;
}

section.title h2 {
  font-size: 22px;
  font-weight: 500;
  color: #E86C2C;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  margin-bottom: 0;
}

section.title h2::after {
  display: none;
}

section.title p {
  font-size: 22px;
  font-weight: 300;
  color: #5A5752;
  letter-spacing: 0.03em;
  line-height: 1.7;
  max-width: 580px;
  margin-top: 16px;
}

/* ==========================================================================
   CONCEPT SLIDE — Minimal: text and whitespace only
   ========================================================================== */

section.concept {
  background-color: #F5F2EE;
  justify-content: center;
  align-items: flex-start;
  padding: 100px 120px;
}

section.concept h2 {
  font-size: 34px;
  font-weight: 300;
  letter-spacing: 0.08em;
  color: #9A9590;
  margin-bottom: 4px;
}

section.concept h2::after {
  width: 28px;
  height: 2px;
  margin-top: 8px;
  margin-bottom: 28px;
}

section.concept h3 {
  font-size: 42px;
  font-weight: 300;
  color: #2C2C2C;
  letter-spacing: 0.02em;
  line-height: 1.35;
  text-transform: none;
  margin-top: 0;
  margin-bottom: 28px;
}

section.concept p {
  font-size: 22px;
  font-weight: 300;
  line-height: 1.9;
  color: #5A5752;
  max-width: 720px;
  letter-spacing: 0.03em;
}

/* ==========================================================================
   SPEC SLIDE — Clean data, orange on header only
   ========================================================================== */

section.spec {
  background-color: #F5F2EE;
  padding: 48px 72px;
}

section.spec h2 {
  font-size: 36px;
  font-weight: 500;
  letter-spacing: 0.06em;
}

/* ==========================================================================
   TECH SLIDE — Structured, section-divided, no circles
   ========================================================================== */

section.tech {
  background-color: #F5F2EE;
  padding: 44px 72px;
}

section.tech h2 {
  font-size: 36px;
  font-weight: 500;
  letter-spacing: 0.06em;
  margin-bottom: 4px;
}

section.tech h2::after {
  margin-bottom: 12px;
}

section.tech h3 {
  font-size: 34px;
  font-weight: 400;
  color: #E86C2C;
  letter-spacing: 0.03em;
  text-transform: none;
  margin-top: 12px;
  margin-bottom: 4px;
  border-bottom: none;
}

section.tech ul {
  margin-bottom: 4px;
}

section.tech li {
  font-size: 22px;
  line-height: 1.5;
  margin-bottom: 2px;
  padding-left: 18px;
}

/* ==========================================================================
   USE CASES SLIDE — Numbered list, quiet
   ========================================================================== */

section.usecase {
  background-color: #F5F2EE;
  padding: 56px 80px;
}

section.usecase h2 {
  font-size: 36px;
  font-weight: 500;
  letter-spacing: 0.06em;
}

section.usecase ol {
  counter-reset: braun-counter;
  margin-top: 8px;
}

section.usecase ol li {
  font-size: 22px;
  font-weight: 300;
  line-height: 1.65;
  color: #2C2C2C;
  margin-bottom: 16px;
  padding-left: 52px;
  letter-spacing: 0.03em;
}

section.usecase ol li::before {
  font-size: 22px;
  font-weight: 500;
  color: #E86C2C;
  letter-spacing: 0.04em;
  top: 0;
  width: 40px;
}

section.usecase ol li strong {
  font-weight: 500;
  color: #2C2C2C;
}

/* ==========================================================================
   CLOSING SLIDE — Small orange circle returns, quiet echo
   ========================================================================== */

section.closing {
  background-color: #F5F2EE;
  justify-content: center;
  align-items: flex-start;
  padding: 80px 80px;
  overflow: hidden;
  position: relative;
}

/* Small circle — subdued echo of the title's protagonist, clipped at right edge */
section.closing::before {
  content: "";
  position: absolute;
  top: 50%;
  right: -52px;
  width: 160px;
  height: 160px;
  margin-top: -80px;
  background: radial-gradient(circle, #E86C2C 0%, #D05A20 80%, transparent 100%);
  border-radius: 50%;
  opacity: 0.65;
  z-index: 0;
}

section.closing > * {
  position: relative;
  z-index: 1;
}

section.closing blockquote {
  background-color: transparent;
  border: none;
  border-left: none;
  box-shadow: none;
  padding: 0;
  margin: 0;
  border-radius: 0;
  max-width: 820px;
}

section.closing blockquote p {
  font-size: 28px;
  font-weight: 300;
  color: #2C2C2C;
  line-height: 1.75;
  letter-spacing: 0.02em;
}

section.closing .attribution {
  font-size: 22px;
  font-weight: 400;
  color: #9A9590;
  letter-spacing: 0.08em;
  text-transform: none;
  margin-top: 32px;
}

section.closing::after {
  display: none;
}
</style>

<!-- _class: title -->

<div class="label">AETHER Dynamics — Press Release 2025</div>

# 汎用人型プラットフォーム<br>AETHER-01

## GENERAL-PURPOSE HUMANOID ROBOT

過酷な労働環境から家庭内での繊細なサポートまで、あらゆるタスクを自律的に遂行するために設計された次世代の人型ロボット。

---

<!-- _class: concept -->

## デザインコンセプト

### ストイックな機能美

無駄を削ぎ落とした美学を追求。配線やボルトを極力露出させず、滑らかな流線型の外装（マットホワイトのカーボンコンポジット）で覆うことで、人間との共存における視覚的圧迫感を排除しています。

---

<!-- _class: spec -->

## 主要諸元

| 項目 | 仕様 | 備考 |
|---|---|---|
| 全高 | 175 cm | 成人男性の平均身長に準拠 |
| 重量 | 58 kg | 軽量合金とカーボンのハイブリッド構造 |
| 最大積載荷重 | 25 kg (片手) / 60 kg (両手) | 高トルクアクチュエータ搭載 |
| 最高速度 | 8.5 km/h | 安定したジョギングが可能 |
| 稼働時間 | 12時間 | 高密度ソリッドステートバッテリー採用 |
| 自由度 (DoF) | 全身45箇所 | 指先のみで11箇所の自由度を確保 |

---

<!-- _class: tech -->

## 技術的特徴

### 視覚・認識システム — The "Zenith" Eye

- 複数の広角カメラとLiDARを統合した単一センサーパネル
- 360度空間認識（死角のないリアルタイム・マッピング）
- 動体予測（0.01秒単位で経路を選択）

### バイオミメティック・ハンド

- 感圧フィードバックにより生卵を割らずに保持、かつ重い工具を確実に把持
- 自己学習機能により未知の道具の最適な持ち方を視覚情報から推論

### AIブレイン — Neural-Core V4

- クラウド接続不要のエッジAI搭載
- 曖昧な自然言語指示を文脈から解釈
- 人間の動作を一度見るだけで学習・再現する模倣学習を実装

---

<!-- _class: usecase -->

## 主な用途

1. **製造・物流** — 工場内でのピッキング、組み立て、検品作業
2. **危険区域作業** — 放射線下や災害現場など、人間が立ち入れない場所での復旧作業
3. **介護・福祉** — 入浴介助や移動支援など、力と繊細さの両方が求められる現場
4. **一般家事** — 掃除、洗濯、料理といった日常的なタスクの完全自動化

---

<!-- _class: closing -->

> 「AETHER-01は、単なる機械ではありません。あなたの生活の質を向上させる、最も信頼できるパートナーです。」

<div class="attribution">AETHER Dynamics CEO — 開発声明より</div>
