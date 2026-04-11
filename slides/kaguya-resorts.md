---
marp: true
theme: basicslide
paginate: true
---

<style>
/* =========================================================
   KAGUYA 隠世 — Sacred Stone Pavilion
   Palette: Charcoal (#1E1E1E) / Amber (#C8A87C) / Off-white (#E8E4DF)
   Concept: A single slit of amber light through stone walls
   ========================================================= */

/* ── Serif font for the entire deck ── */
@import url('https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@300;400;600&display=swap');

/* ── Color overrides ── */
section {
  --color-primary: #C8A87C;
  --color-primary-light: #2C2822;
  --color-primary-hover: #D4B98A;
  --color-primary-dark: #B89060;
  --color-primary-muted: rgba(200, 168, 124, 0.5);
  --color-primary-soft: #E0C9A6;
  --color-primary-deep: #141414;
  --color-surface-accent: rgba(200, 168, 124, 0.08);

  --color-text: #E8E4DF;
  --color-text-secondary: rgba(232, 228, 223, 0.65);
  --color-text-tertiary: rgba(200, 168, 124, 0.45);
  --color-surface: #232323;
  --color-border: rgba(200, 168, 124, 0.2);

  /* Base */
  background-color: #232323;
  color: #E8E4DF;
  font-family: "Noto Serif JP", "游明朝", "Yu Mincho", "YuMincho", serif;
  font-size: 20px;
  font-weight: 300;
  letter-spacing: 0.04em;

  /* THE LIGHT SLIT — via background-image (::before fails in Marp foreignObject) */
  background-image: linear-gradient(
    to bottom,
    transparent 0%,
    rgba(200, 168, 124, 0.45) 10%,
    rgba(200, 168, 124, 0.80) 35%,
    rgba(220, 190, 140, 0.95) 50%,
    rgba(200, 168, 124, 0.80) 65%,
    rgba(200, 168, 124, 0.45) 90%,
    transparent 100%
  ) !important;
  background-size: 3px 100% !important;
  background-position: right 48px top !important;
  background-repeat: no-repeat !important;
}

/* Page numbers — amber, minimum 14px */
section::after {
  color: rgba(200, 168, 124, 0.5);
  font-family: "Noto Serif JP", serif;
  font-size: 14px;
  font-weight: 300;
  letter-spacing: 0.12em;
}

/* =========================================================
   HEADINGS — minimum sizes enforced
   ========================================================= */
section h2 {
  font-family: "Noto Serif JP", serif;
  font-size: 1.7rem;   /* 34px minimum */
  font-weight: 300;
  color: #C8A87C;
  letter-spacing: 0.08em;
  border: none;
  padding-bottom: 0;
  margin-bottom: 1.4rem;
  line-height: 1.3;
}

section h3 {
  font-family: "Noto Serif JP", serif;
  font-size: 1.7rem;   /* 34px minimum */
  font-weight: 300;
  color: #E8E4DF;
  letter-spacing: 0.08em;
  line-height: 1.4;
  margin-bottom: 1.2rem;
}

section h4 {
  font-family: "Noto Serif JP", serif;
  font-size: 1.4rem;   /* 28px */
  font-weight: 400;
  color: #C8A87C;
  letter-spacing: 0.12em;
  margin-bottom: 0.5rem;
}

/* Section number labels — decorative, styled as small paragraph */
.sec-label {
  font-family: "Noto Serif JP", serif;
  font-size: 0.85rem;  /* intentionally small decorative label */
  color: rgba(200, 168, 124, 0.55);
  letter-spacing: 0.35em;
  margin-bottom: 0.5rem;
  font-weight: 300;
}

/* =========================================================
   BODY TEXT
   ========================================================= */
section p {
  font-size: 1.1rem;
  color: rgba(232, 228, 223, 0.8);
  line-height: 2.0;
  letter-spacing: 0.04em;
  margin-bottom: 1rem;
}

section strong {
  font-weight: 600;
  color: #C8A87C;
}

section em {
  font-style: normal;
  color: #C8A87C;
}

/* =========================================================
   LISTS
   ========================================================= */
section ul, section ol {
  padding-left: 1.2rem;
  margin-bottom: 1rem;
}

section li {
  font-size: 1.1rem;   /* 22px minimum */
  color: rgba(232, 228, 223, 0.8);
  line-height: 2.0;
  margin-bottom: 0.6rem;
  letter-spacing: 0.04em;
}

section li::marker {
  color: rgba(200, 168, 124, 0.5);
}

section ol li::marker {
  color: rgba(200, 168, 124, 0.5);
  font-weight: 300;
}

/* =========================================================
   BLOCKQUOTE — sacred chamber quote
   ========================================================= */
section blockquote {
  background: transparent;
  border-left: 1px solid rgba(200, 168, 124, 0.45);
  border-radius: 0;
  padding: 1.2rem 2rem;
  margin: 1.5rem 0;
  box-shadow: none;
  font-size: 1.25rem;
  font-weight: 300;
  color: rgba(232, 228, 223, 0.85);
  letter-spacing: 0.06em;
  line-height: 2.0;
}

section blockquote p {
  margin: 0;
  font-size: 1.25rem;
}

/* =========================================================
   TITLE SLIDE — The stone gate opens
   Slit: wider / brighter, placed left-center
   ========================================================= */
section.title {
  background-color: #1A1A1A;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: flex-start;
  text-align: left;
  padding: 80px 100px;

  /* Layered: atmospheric bottom darkness + brighter slit */
  background-image:
    linear-gradient(to top, #0E0E0E 0%, transparent 40%),
    linear-gradient(
      to bottom,
      transparent 0%,
      rgba(200, 168, 124, 0.15) 8%,
      rgba(200, 168, 124, 0.75) 35%,
      rgba(220, 185, 130, 0.95) 50%,
      rgba(200, 168, 124, 0.75) 65%,
      rgba(200, 168, 124, 0.15) 92%,
      transparent 100%
    ) !important;
  background-size: 100% 100%, 4px 100% !important;
  background-position: bottom, right 72px top !important;
  background-repeat: no-repeat, no-repeat !important;
}

section.title h1 {
  font-family: "Noto Serif JP", serif;
  font-size: 4.2rem;
  font-weight: 300;
  color: #E8E4DF;
  letter-spacing: 0.15em;
  line-height: 1.2;
  margin-bottom: 1rem;
  border: none;
  position: relative;
  z-index: 1;
}

section.title h3 {
  font-size: 1.7rem;   /* 34px minimum */
  font-weight: 300;
  color: rgba(200, 168, 124, 0.7);
  letter-spacing: 0.12em;
  margin-bottom: 2rem;
  position: relative;
  z-index: 1;
}

section.title p {
  font-size: 1.1rem;   /* 22px minimum */
  color: rgba(200, 168, 124, 0.45);
  letter-spacing: 0.22em;
  margin-bottom: 0;
  position: relative;
  z-index: 1;
}

section.title strong {
  color: rgba(200, 168, 124, 0.6);
  font-weight: 300;
}

/* =========================================================
   CLOSING SLIDE — Light widens slightly
   ========================================================= */
section.closing {
  background-color: #1A1A1A;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: flex-start;
  text-align: left;
  padding: 80px 100px;

  /* Layered: atmospheric bottom darkness + slit */
  background-image:
    linear-gradient(to top, #0E0E0E 0%, transparent 35%),
    linear-gradient(
      to bottom,
      transparent 0%,
      rgba(200, 168, 124, 0.12) 10%,
      rgba(200, 168, 124, 0.65) 38%,
      rgba(220, 185, 130, 0.85) 50%,
      rgba(200, 168, 124, 0.65) 62%,
      rgba(200, 168, 124, 0.12) 90%,
      transparent 100%
    ) !important;
  background-size: 100% 100%, 3px 100% !important;
  background-position: bottom, right 72px top !important;
  background-repeat: no-repeat, no-repeat !important;
}

section.closing h3 {
  font-size: 1.7rem;   /* 34px minimum */
  font-weight: 300;
  color: rgba(200, 168, 124, 0.65);
  letter-spacing: 0.1em;
  margin-bottom: 2rem;
  position: relative;
  z-index: 1;
}

section.closing blockquote {
  border-left: 1px solid rgba(200, 168, 124, 0.5);
  padding: 1.5rem 2.5rem;
  margin-bottom: 2.5rem;
  position: relative;
  z-index: 1;
}

section.closing p {
  position: relative;
  z-index: 1;
  font-size: 1.25rem;
  line-height: 2.0;
  color: rgba(232, 228, 223, 0.85);
}

section.closing strong {
  color: #E8E4DF;
  font-weight: 400;
}

/* =========================================================
   CONTACT SLIDE — Most restrained
   ========================================================= */
section.contact {
  background-color: #1E1E1E;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: flex-start;
  padding: 80px 100px;

  /* Subtlest slit — most restrained */
  background-image: linear-gradient(
    to bottom,
    transparent 0%,
    rgba(200, 168, 124, 0.15) 15%,
    rgba(200, 168, 124, 0.35) 50%,
    rgba(200, 168, 124, 0.15) 85%,
    transparent 100%
  ) !important;
  background-size: 2px 100% !important;
  background-position: right 48px top !important;
  background-repeat: no-repeat !important;
}

section.contact::after {
  display: none;
}

section.contact h3 {
  font-size: 1.7rem;   /* 34px minimum */
  font-weight: 300;
  color: rgba(200, 168, 124, 0.6);
  letter-spacing: 0.1em;
  margin-bottom: 2rem;
}

section.contact li {
  font-size: 1.1rem;   /* 22px minimum */
  font-family: "Noto Serif JP", serif;
  color: rgba(232, 228, 223, 0.65);
  line-height: 2.2;
  margin-bottom: 0;
  letter-spacing: 0.04em;
}

section.contact strong {
  font-family: "Noto Serif JP", serif;
  font-weight: 400;
  color: rgba(200, 168, 124, 0.7);
}

section.contact li::marker {
  color: transparent;
}

section.contact em {
  color: rgba(200, 168, 124, 0.55);
  font-style: normal;
  font-size: 1.1rem;   /* 22px minimum */
  letter-spacing: 0.06em;
  display: block;
  margin-top: 2rem;
}

/* =========================================================
   CONTENT SLIDES — Vertical centering for sparse content
   justify-content: center with !important to override base flex-start
   ========================================================= */
section.content-centered {
  padding: 130px 80px 48px 80px !important;

  /* Slit — explicit on content slides */
  background-color: #232323 !important;
  background-image: linear-gradient(
    to bottom,
    transparent 0%,
    rgba(200, 168, 124, 0.45) 10%,
    rgba(200, 168, 124, 0.80) 35%,
    rgba(220, 190, 140, 0.95) 50%,
    rgba(200, 168, 124, 0.80) 65%,
    rgba(200, 168, 124, 0.45) 90%,
    transparent 100%
  ) !important;
  background-size: 4px 100% !important;
  background-position: right 48px top !important;
  background-repeat: no-repeat !important;
  height: 720px !important;
}

/* Section number decorative label — styled as small body text, not a heading */
.sec-label {
  font-family: "Noto Serif JP", serif;
  font-size: 0.85rem;  /* decorative, not a content heading */
  color: rgba(200, 168, 124, 0.45);
  letter-spacing: 0.35em;
  margin-bottom: 0.5rem;
  font-weight: 300;
  display: block;
}

</style>

<!-- _class: title -->
<!-- _paginate: false -->

# KAGUYA 隠世

### 喧騒を離れ、静寂の深淵へ

**The Art of Serenity**

---

<!-- _class: content-centered -->

## 01

### 隠世（かくよ）という哲学

日常の喧騒から切り離された「別世界」を意味します。

- **地の利：** 手つかずの原生林に抱かれた断崖のロケーション
- **建築：** 境界線を排除したオープンエア構造
- **調和：** 自然界の音（風・水・鳥）を主役にした空間設計

---

<!-- _class: content-centered -->

## 02

### 静寂を纏うプライベート空間

全20棟のパビリオン。それぞれが独立した静寂を約束します。

- **素材：** 地元の杉、無垢の石材、手漉き和紙を使用
- **眺望：** 床から天井まで広がる一枚ガラス。景色がそのまま「生きた絵画」に
- **設え：** 源泉掛け流しのプライベート露天風呂 / デジタルデトックスを推奨するミニマリズムなインテリア

---

<!-- _class: content-centered -->

## 03

### 地の恵みを、あるがままに

「KAGUYA Kitchen」では、半径10km以内の食材のみを使用。

- **Farm to Table：** 毎朝収穫される有機野菜と近海で獲れた魚介
- **空間：** 月明かりの下で楽しむ、オープンエアのダイニング
- **体験：** シェフが目の前で調理する、一組限定の「森のプライベートディナー」

---

<!-- _class: content-centered -->

## 04

### 心身の浄化、再起動

古代の知恵と現代のセラピーを融合。

- **Meditation Hall：** 竹林の中での瞑想セッション
- **Spa Ritual：** 地元の薬草と湧き水を用いたトリートメント
- **Onsen：** 地磁気の高い場所に位置する、静謐な共同浴場

---

<!-- _class: content-centered -->

## 05

### 自然との対話

贅沢とは、何もしないこと。あるいは、自然の一部になること。

1. **朝の森の散策：** 専門ガイドによる生態系の解説
2. **星空観測：** 人工光が一切届かない場所での天体ショー
3. **地元の職人ワークショップ：** 伝統工芸を現代的に解釈する体験

---

<!-- _class: content-centered -->

## 06

### 守るべき美しさ

私たちは、この土地の守護者でありたいと考えています。

- **環境負荷ゼロ：** 100%再生可能エネルギーでの運営
- **共生：** 地域コミュニティへの雇用創出と文化保存活動
- **水循環：** 高度な濾過システムによる水の再利用

---

<!-- _class: closing -->
<!-- _paginate: false -->

### 最後に

> 「真の贅沢とは、自分自身を再発見する時間である」

**KAGUYA 隠世** で、
あなたの中に眠る静寂に出会う旅を。

---

<!-- _class: contact -->
<!-- _paginate: false -->

### Contact Information

- **Official Website:** [URL]
- **Instagram:** @kaguya_resort
- **Reservation:** 0120-XXX-XXX

*皆様のお越しを、静寂と共にお待ちしております。*
