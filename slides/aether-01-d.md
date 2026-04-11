---
marp: true
theme: basicslide
paginate: true
---

<style>
/* ============================================================
   AETHER-01 — Concrete Brutalism Poster
   béton brut × industrial red beam × stamped type
   ============================================================ */

/* --- Global: Concrete palette override --- */
section {
  --color-primary: #CC2200;
  --color-primary-light: #f5ede8;
  --color-primary-hover: #A81C00;
  --color-primary-dark: #880F00;
  --color-primary-muted: #e8a090;
  --color-primary-soft: #f0c0b0;
  --color-primary-deep: #700000;
  --color-surface-accent: #e8e0d8;

  --color-text: #1A1A1A;
  --color-text-secondary: #3A3A3A;
  --color-text-tertiary: #606060;
  --color-surface: #E8E4E0;
  --color-surface-secondary: #D8D2CC;
  --color-border: #B8B2AC;

  font-family: "Noto Sans JP", "Yu Gothic Medium", "游ゴシック Medium", YuGothic, sans-serif;
  font-size: 20px;
  color: #1A1A1A;
  background-color: #E8E4E0;
}

/* --- Page numbers: industrial mono --- */
section::after {
  font-size: 14px;
  color: #888;
  font-weight: 600;
  letter-spacing: 0.08em;
}

/* ============================================================
   SLIDE 1: TITLE — Full red beam (structural beam at top ~50px)
   ============================================================ */
section.aether-title {
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: flex-start;
  text-align: left;
  padding: 0 72px 60px 72px;
  background-color: #E8E4E0;
  /* Red structural beam at top — béton brut iron girder */
  background-image: linear-gradient(
    to bottom,
    #CC2200 0px,
    #CC2200 60px,
    #E8E4E0 60px,
    #E8E4E0 100%
  ) !important;
  background-size: 100% 100% !important;
  background-repeat: no-repeat !important;
  position: relative;
}

section.aether-title::after {
  display: none;
}

/* Title: label above the beam area — sits in beam zone */
section.aether-title .label {
  margin-top: 12px;
  font-size: 22px;
  font-weight: 700;
  letter-spacing: 0.12em;
  color: #F0EBE5;
  text-transform: uppercase;
  line-height: 1;
  margin-bottom: 0;
}

section.aether-title h1 {
  margin-top: 60px;
  font-size: 68px;
  font-weight: 900;
  letter-spacing: -0.03em;
  line-height: 1.05;
  color: #1A1A1A;
  border: none;
  margin-bottom: 28px;
  padding-top: 36px;
}

section.aether-title .sub {
  font-size: 22px;
  font-weight: 400;
  color: #3A3A3A;
  line-height: 1.65;
  max-width: 720px;
  margin-bottom: 0;
  letter-spacing: 0.01em;
}

/* ============================================================
   CONTENT SLIDES (default): thin red trace line at same vertical
   ============================================================ */
section.aether-content {
  background-color: #E8E4E0;
  /* Thin red trace: structural echo at top, same position */
  background-image: linear-gradient(
    to bottom,
    #CC2200 0px,
    #CC2200 4px,
    #E8E4E0 4px,
    #E8E4E0 100%
  ) !important;
  background-size: 100% 100% !important;
  background-repeat: no-repeat !important;
  padding: 60px 72px 48px 72px;
  justify-content: center;
}

section.aether-content h2 {
  font-size: 40px;
  font-weight: 900;
  letter-spacing: -0.03em;
  line-height: 1.1;
  color: #1A1A1A;
  border: none;
  margin-top: 8px;
  margin-bottom: 24px;
  padding-bottom: 0;
}

section.aether-content h3 {
  font-size: 34px;
  font-weight: 900;
  letter-spacing: -0.02em;
  text-transform: none;
  color: #CC2200;
  margin-bottom: 12px;
  margin-top: 16px;
}

section.aether-content h4 {
  font-size: 34px;
  font-weight: 700;
  letter-spacing: -0.01em;
  text-transform: none;
  color: #CC2200;
  margin-bottom: 8px;
}

section.aether-content p {
  font-size: 22px;
  line-height: 1.65;
  color: #1A1A1A;
  margin-bottom: 16px;
}

section.aether-content ul,
section.aether-content ol {
  padding-left: 28px;
  margin-bottom: 16px;
}

section.aether-content li {
  font-size: 22px;
  line-height: 1.65;
  color: #1A1A1A;
  margin-bottom: 10px;
}

section.aether-content li::marker {
  color: #CC2200;
  font-weight: 700;
}

/* ============================================================
   SPEC SLIDE: table treatment on concrete background
   ============================================================ */
section.aether-spec {
  background-color: #E8E4E0;
  background-image: linear-gradient(
    to bottom,
    #CC2200 0px,
    #CC2200 4px,
    #E8E4E0 4px,
    #E8E4E0 100%
  ) !important;
  background-size: 100% 100% !important;
  background-repeat: no-repeat !important;
  padding: 60px 72px 48px 72px;
}

section.aether-spec h2 {
  font-size: 40px;
  font-weight: 900;
  letter-spacing: -0.03em;
  color: #1A1A1A;
  border: none;
  margin-top: 8px;
  margin-bottom: 24px;
  padding-bottom: 0;
}

section.aether-spec table {
  font-size: 22px;
  margin: 0;
  border-radius: 0;
  box-shadow: none;
  border: none;
  width: 100%;
}

section.aether-spec thead th {
  background-color: #1A1A1A;
  color: #E8E4E0;
  font-weight: 700;
  font-size: 22px;
  letter-spacing: 0.06em;
  text-transform: uppercase;
  padding: 8px 14px;
}

section.aether-spec tbody td {
  padding: 7px 14px;
  border-bottom: 1px solid #B8B2AC;
  color: #1A1A1A;
  font-size: 22px;
  line-height: 1.35;
}

section.aether-spec tbody tr:nth-child(even) {
  background-color: #D8D2CC;
}

section.aether-spec tbody tr:nth-child(odd) {
  background-color: #E8E4E0;
}

/* First column bold — spec label */
section.aether-spec tbody td:first-child {
  font-weight: 700;
  color: #1A1A1A;
  letter-spacing: 0.01em;
}

/* Second column: value in red */
section.aether-spec tbody td:nth-child(2) {
  font-weight: 700;
  color: #CC2200;
}

/* ============================================================
   TECH SLIDE: two sections with left accent
   ============================================================ */
section.aether-tech {
  background-color: #E8E4E0;
  background-image: linear-gradient(
    to bottom,
    #CC2200 0px,
    #CC2200 4px,
    #E8E4E0 4px,
    #E8E4E0 100%
  ) !important;
  background-size: 100% 100% !important;
  background-repeat: no-repeat !important;
  padding: 60px 72px 32px 72px;
}

section.aether-tech h2 {
  font-size: 40px;
  font-weight: 900;
  letter-spacing: -0.03em;
  color: #1A1A1A;
  border: none;
  margin-top: 8px;
  margin-bottom: 20px;
  padding-bottom: 0;
}

section.aether-tech h3 {
  font-size: 34px;
  font-weight: 900;
  letter-spacing: -0.02em;
  text-transform: none;
  color: #CC2200;
  margin-bottom: 8px;
  margin-top: 0;
  line-height: 1.15;
}

/* Tech section block */
.tech-grid {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  gap: 24px;
  width: 100%;
  margin-top: 4px;
}

.tech-block {
  padding: 16px 20px;
  background-color: #1A1A1A;
  color: #E8E4E0;
}

.tech-block h3 {
  font-size: 34px;
  font-weight: 900;
  letter-spacing: -0.02em;
  text-transform: none;
  color: #CC2200;
  margin-bottom: 8px;
  margin-top: 0;
  line-height: 1.1;
}

.tech-block ul {
  padding-left: 16px;
  margin-bottom: 0;
}

.tech-block li {
  font-size: 22px;
  line-height: 1.45;
  color: #E8E4E0;
  margin-bottom: 4px;
}

.tech-block li::marker {
  color: #CC2200;
  font-weight: 700;
}

/* ============================================================
   CLOSING SLIDE: red beam returns — bookend structure
   ============================================================ */
section.aether-closing {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: flex-start;
  text-align: left;
  padding: 0 72px 60px 72px;
  background-color: #E8E4E0;
  /* Fat red beam at top — mirror of title */
  background-image: linear-gradient(
    to bottom,
    #CC2200 0px,
    #CC2200 60px,
    #E8E4E0 60px,
    #E8E4E0 100%
  ) !important;
  background-size: 100% 100% !important;
  background-repeat: no-repeat !important;
}

section.aether-closing::after {
  display: none;
}

section.aether-closing blockquote {
  border: none;
  background: none;
  box-shadow: none;
  padding: 0;
  margin: 0 0 32px 0;
  border-left: 8px solid #CC2200;
  padding-left: 28px;
}

section.aether-closing blockquote p {
  font-size: 28px;
  font-weight: 700;
  color: #1A1A1A;
  line-height: 1.55;
  margin: 0;
  letter-spacing: -0.01em;
}

section.aether-closing .source {
  font-size: 22px;
  font-weight: 700;
  letter-spacing: 0.06em;
  text-transform: uppercase;
  color: #CC2200;
  margin-bottom: 0;
  padding-left: 36px;
}

</style>

<!-- _class: aether-title -->

<p class="label">AETHER Dynamics — Press Release 2025</p>

# 汎用人型プラットフォーム<br>AETHER-01

<p class="sub">過酷な労働環境から家庭内での繊細なサポートまで、あらゆるタスクを自律的に遂行するために設計された次世代の人型ロボット。</p>

---

<!-- _class: aether-content -->

## デザインコンセプト

### ストイックな機能美

無駄を削ぎ落とした美学を追求。配線やボルトを極力露出させず、滑らかな流線型の外装（マットホワイトのカーボンコンポジット）で覆うことで、人間との共存における視覚的圧迫感を排除しています。

---

<!-- _class: aether-spec -->

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

<!-- _class: aether-tech -->

## 技術的特徴

<div class="tech-grid">
<div class="tech-block">

### Zenith Eye

- 広角カメラ＋LiDAR統合
- 360度空間認識
- 0.01秒単位の動体予測

</div>
<div class="tech-block">

### Bio Hand

- 感圧フィードバックで生卵も工具も把持
- 自己学習で未知の道具に対応

</div>
<div class="tech-block">

### Neural-Core V4

- クラウド不要のエッジAI
- 自然言語指示を文脈解釈
- 一度見るだけで模倣学習

</div>
</div>

---

<!-- _class: aether-content -->

## 主な用途

1. **製造・物流** — 工場内でのピッキング、組み立て、検品作業
2. **危険区域作業** — 放射線下や災害現場など、人間が立ち入れない場所での復旧作業
3. **介護・福祉** — 入浴介助や移動支援など、力と繊細さの両方が求められる現場
4. **一般家事** — 掃除、洗濯、料理といった日常的なタスクの完全自動化

---

<!-- _class: aether-closing -->

> 「AETHER-01は、単なる機械ではありません。あなたの生活の質を向上させる、最も信頼できるパートナーです。」

<p class="source">AETHER Dynamics CEO — 開発声明より</p>
