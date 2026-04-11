---
marp: true
theme: basicslide
paginate: true
style: |
  /* ============================================================
     AGH Quarterly Report — Nordic Investment Report Theme
     Deep Teal #0D7377 on Cool Gray #F0F2F5, Navy #1C2836
     Scandinavian financial minimalism — data speaks
  ============================================================ */

  /* ── Palette Override ── */
  section {
    --color-primary:       #0D7377;
    --color-primary-light: #E4F0F0;
    --color-primary-hover: #0A5D60;
    --color-primary-dark:  #074547;
    --color-primary-muted: #B2D4D5;
    --color-primary-soft:  #7FB8BA;
    --color-primary-deep:  #063335;
    --color-surface-accent:#E4F0F0;

    --color-text:          #1C2836;
    --color-text-secondary:#3D4F63;
    --color-text-tertiary: #7A8C9E;
    --color-border:        #D5DCE4;
    --color-border-strong: #B0BCC8;
  }

  /* ── All Slides: Cool Gray Base ── */
  section {
    background-color: #F0F2F5;
    font-family: "Noto Sans JP", "Yu Gothic Medium", "游ゴシック Medium", YuGothic, "ヒラギノ角ゴ Pro W3", "メイリオ", sans-serif;
    font-weight: 300;
    letter-spacing: 0.05em;
    color: #1C2836;
    justify-content: center !important;
    padding-top: 60px;
    padding-bottom: 60px;
  }

  /* Teal top-line on all content slides */
  section.content-slide {
    background-color: #F0F2F5;
    justify-content: center;
    background-image: linear-gradient(to bottom, #0D7377 4px, #F0F2F5 4px) !important;
    background-size: 100% 100% !important;
    background-repeat: no-repeat !important;
    background-position: top left !important;
  }

  /* ── Headings ── */
  section h2 {
    font-size: 1.8rem;
    font-weight: 500;
    color: #1C2836;
    letter-spacing: 0.06em;
    border: none;
    border-bottom: 1.5px solid #0D7377;
    padding-bottom: 10px;
    margin-bottom: 20px;
  }

  section h3 {
    font-size: 1.1rem;
    font-weight: 500;
    color: #0D7377;
    letter-spacing: 0.07em;
    margin-bottom: 10px;
    margin-top: 18px;
  }

  section p {
    font-size: 1.1rem;
    font-weight: 300;
    color: #3D4F63;
    letter-spacing: 0.04em;
    line-height: 1.7;
    margin-bottom: 14px;
  }

  section ul {
    padding-left: 1.4rem;
    margin-bottom: 10px;
  }

  section li {
    font-size: 1.1rem;
    font-weight: 300;
    color: #1C2836;
    letter-spacing: 0.04em;
    line-height: 1.65;
    margin-bottom: 8px;
  }

  section li::marker {
    color: #0D7377;
  }

  /* ── TITLE SLIDE ── */
  section.title {
    background-color: #F0F2F5;
    background-image: linear-gradient(to bottom, #0D7377 5px, #F0F2F5 5px) !important;
    background-size: 100% 100% !important;
    background-repeat: no-repeat !important;
    background-position: top left !important;
    justify-content: center;
    align-items: flex-start;
    text-align: left;
    padding: 80px 100px;
  }

  section.title h1 {
    font-size: 2.4rem;
    font-weight: 500;
    color: #1C2836;
    letter-spacing: 0.06em;
    line-height: 1.4;
    border: none;
    border-bottom: 2px solid #0D7377;
    padding-bottom: 20px;
    margin-bottom: 24px;
  }

  section.title h2 {
    font-size: 1.1rem;
    font-weight: 300;
    color: #7A8C9E;
    letter-spacing: 0.10em;
    border: none;
    padding-top: 0;
    padding-bottom: 0;
    margin-bottom: 0;
    margin-top: 0;
  }

  section.title::after {
    display: none;
  }

  /* ── CLOSING SLIDE ── */
  section.closing {
    background-color: #F0F2F5;
    background-image: linear-gradient(to bottom, #0D7377 5px, #F0F2F5 5px) !important;
    background-size: 100% 100% !important;
    background-repeat: no-repeat !important;
    background-position: top left !important;
    justify-content: center;
    align-items: center;
    text-align: center;
    padding: 80px 100px;
  }

  section.closing h1 {
    font-size: 2.2rem;
    font-weight: 500;
    color: #1C2836;
    letter-spacing: 0.06em;
    line-height: 1.4;
    border: none;
    margin-bottom: 16px;
  }

  section.closing h2 {
    font-size: 1.1rem;
    font-weight: 300;
    color: #7A8C9E;
    letter-spacing: 0.10em;
    border: none;
    border-top: 1.5px solid #0D7377;
    padding-top: 18px;
    padding-bottom: 0;
    margin-bottom: 18px;
    margin-top: 0;
  }

  section.closing p {
    font-size: 1.1rem;
    font-weight: 300;
    color: #7A8C9E;
    letter-spacing: 0.05em;
  }

  section.closing::after {
    display: none;
  }

  /* ── KPI TABLE (Key Slides: Slide 2 & 6) ── */
  .kpi-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
    margin-bottom: 24px;
  }

  .kpi-table tr {
    border-bottom: 1px solid #D5DCE4;
  }

  .kpi-table tr:first-child {
    border-top: 2px solid #0D7377;
  }

  .kpi-table td {
    padding: 18px 0;
    font-size: 1.1rem;
    font-weight: 300;
    color: #3D4F63;
    letter-spacing: 0.04em;
    vertical-align: middle;
    border: none;
    background: transparent;
  }

  .kpi-table td:first-child {
    width: 55%;
    font-weight: 400;
    color: #1C2836;
    font-size: 1.0rem;
    letter-spacing: 0.05em;
  }

  .kpi-table td:last-child {
    font-size: 2.2rem;
    font-weight: 600;
    color: #0D7377;
    letter-spacing: 0.04em;
    text-align: right;
    line-height: 1.1;
  }

  .kpi-table tr:nth-child(even) td {
    background: transparent;
  }

  /* ── SHAREHOLDER RETURN TABLE (Slide 6) ── */
  .shareholder-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 10px;
    margin-bottom: 24px;
  }

  .shareholder-table tr {
    border-bottom: 1px solid #D5DCE4;
  }

  .shareholder-table tr:first-child {
    border-top: 2px solid #0D7377;
  }

  .shareholder-table td {
    padding: 14px 0;
    font-size: 1.0rem;
    font-weight: 300;
    color: #3D4F63;
    letter-spacing: 0.04em;
    vertical-align: middle;
    border: none;
    background: transparent;
  }

  .shareholder-table td:first-child {
    width: 50%;
    font-weight: 400;
    color: #1C2836;
    font-size: 1.0rem;
    letter-spacing: 0.05em;
  }

  .shareholder-table td:last-child {
    font-size: 2.2rem;
    font-weight: 600;
    color: #0D7377;
    letter-spacing: 0.04em;
    text-align: right;
    line-height: 1.1;
  }

  .shareholder-table tr:nth-child(even) td {
    background: transparent;
  }

  /* ── LEAD BLOCK (inline note under kpi value) ── */
  .kpi-note {
    font-size: 0.78rem;
    font-weight: 300;
    color: #7A8C9E;
    letter-spacing: 0.04em;
    display: block;
    margin-top: 2px;
    line-height: 1.3;
  }

  /* ── DATA ROWS (Strategy Slide) ── */
  .data-row {
    display: flex;
    justify-content: space-between;
    align-items: baseline;
    border-bottom: 1px solid #D5DCE4;
    padding: 12px 0;
  }

  .data-row:first-of-type {
    border-top: 2px solid #0D7377;
  }

  .data-row-label {
    font-size: 1.0rem;
    font-weight: 400;
    color: #1C2836;
    letter-spacing: 0.05em;
    flex: 1;
  }

  .data-row-value {
    font-size: 2.0rem;
    font-weight: 600;
    color: #0D7377;
    letter-spacing: 0.04em;
    text-align: right;
    line-height: 1.1;
  }

  /* ── PAGE NUMBER ── */
  section::after {
    font-size: 0.7rem;
    font-weight: 300;
    color: #7A8C9E;
    letter-spacing: 0.06em;
  }

  section.content-slide::after {
    color: #7A8C9E;
  }
---

<!-- _class: title -->

# 決算説明資料：アステラス・グローバル・ホールディングス (AGH)

## 2025年3月期 第3四半期 財務報告ハイライト

---

<!-- _class: content-slide -->

## 1. 業績推移と主要指標

強固な国内基盤と新興国市場での収益拡大により、グループ創設以来の最高益圏で推移しています。

<table class="kpi-table">
<tr>
<td>連結事業収益</td>
<td>4兆1,200億円</td>
</tr>
<tr>
<td>実質業務純益</td>
<td>1兆8,500億円</td>
</tr>
<tr>
<td>親会社株主純利益<span class="kpi-note">進捗率 82%</span></td>
<td>1兆1,200億円</td>
</tr>
<tr>
<td>総資産規模</td>
<td>310兆円</td>
</tr>
<tr>
<td>自己資本比率 (CET1)<span class="kpi-note">規制水準を十分にクリア</span></td>
<td>11.8%</td>
</tr>
</table>

---

<!-- _class: content-slide -->

## 2. 成長戦略：中長期経営ビジョン

「伝統的な銀行業」から「デジタル金融プラットフォーム」への変革を加速させています。

### 財務目標（収益性向上）

- **ROE（自己資本利益率）目標**: 現在の7.2%から、2026年度までに9.0%台への引き上げを目指す。
- **コスト削減**: デジタル化による店舗運営の効率化で、経費率を40%台前半まで抑制。

### 金利変動への感応度

市場金利の正常化に伴い、利ざやの拡大を確実に取り込む体制を構築。

- **金利感応度試算**: 国内短期金利が0.1%上昇した場合、年間で約450億円の資金利益増収を見込む。

---

<!-- _class: content-slide -->

## 3. 戦略的事業ドメイン

### ① 次世代金融アプリ「LUMINA（ルミナ）」

決済、投資、保険、ローンを一元管理する統合型個人アプリ。

- **ユーザー数**: 2024年12月末時点で520万アカウントを突破。
- **独自機能**: AIによる支出予測と自動貯蓄機能が若年層に支持され、新規口座開設者の7割がLUMINA経由。

---

<!-- _class: content-slide -->

## 3. 戦略的事業ドメイン

### ② 環太平洋マルチ・ハブ戦略

成長著しいアジア・太平洋地域における展開。

- **重点市場**: ベトナム、インドネシア、マレーシアの現地銀行へ出資し、リテール市場のシェアを拡大。
- **海外収益比率**: グループ全体の純利益に占める海外比率を45%まで引き上げる計画。

---

<!-- _class: content-slide -->

## 4. 株主還元・資本政策

利益成長に伴う「持続的かつ機動的な還元」を基本方針としています。

<table class="shareholder-table">
<tr>
<td>配当方針</td>
<td><span style="font-size: 1.1rem; font-weight: 500; color: #0D7377; letter-spacing: 0.04em;">累進配当制度</span></td>
</tr>
<tr>
<td>年間配当予想<span class="kpi-note">前期比 +25円</span></td>
<td>145円</td>
</tr>
<tr>
<td>株主還元総額<span class="kpi-note">配当と自己株買いを組み合わせて実施</span></td>
<td>純利益の50%</td>
</tr>
</table>

---

<!-- _class: content-slide -->

## 5. サステナビリティへの取り組み

- **グリーン・ファイナンス**: 2030年までに脱炭素関連事業へ累計15兆円の投融資を実行。
- **人的資本**: IT・デジタル専門人材の採用比率を全体の40%まで引き上げ。

---

<!-- _class: closing -->

# アステラス・グローバル・ホールディングス

## AGH | 2025年3月期 第3四半期

本資料に関するお問い合わせは、IR部門までお願いいたします。
