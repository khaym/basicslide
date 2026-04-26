<h1 align="center">basicslide</h1>

<p align="center">
  <em>Marp プレゼンテーションを生成する Claude Code プラグイン。<br>テンプレートの組み合わせではなく、毎回ゼロからビジュアルデザインを行います。</em>
</p>

<p align="center">
  <a href="LICENSE">
    <img src="https://img.shields.io/badge/license-MIT-blue" alt="License">
  </a>
  <img src="https://img.shields.io/badge/platform-Claude%20Code-7C3AED" alt="Platform">
  <img src="https://img.shields.io/badge/engine-Marp-00B4D8" alt="Engine">
</p>

<p align="center">
  <a href="#仕組み">仕組み</a> &bull;
  <a href="#クイックスタート">クイックスタート</a> &bull;
  <a href="#出力サンプル">出力サンプル</a> &bull;
  <a href="#プラグイン構成">プラグイン構成</a> &bull;
  <a href="#ライセンス">ライセンス</a>
</p>

<p align="center">
  <a href="README.md">English</a>
</p>

---

プレゼンテーションごとに、インタラクティブなデザイン思考を通じて**ゼロからビジュアルアイデンティティ**を設計します。目的と対象者を伝えるだけで、トーン選定・カラーパレット・タイポグラフィ・レイアウト・多軸品質評価までプラグインが担当し、デザインが基準を満たすまで自動で改善を繰り返します。

## 出力サンプル

**Braun Design Manual** — 温かみのある紙質、シグナルオレンジの円、軽やかなタイポグラフィ

<p align="center">
  <img src="assets/aether-01-c-en.png" alt="Braun Design Manual style" width="720">
</p>

**Concrete Brutalism Poster** — 打ちっぱなしコンクリート、赤い構造梁、スタンプ書体

<p align="center">
  <img src="assets/aether-01-d-en.png" alt="Concrete Brutalism style" width="720">
</p>

どちらも同じ入力コンテンツから、異なるデザイン方向で生成されたものです。使用したパラメータの詳細はブリーフを参照してください:

- [Braun Design Manual ブリーフ](slides/aether-01-c-brief.md)
- [Concrete Brutalism ブリーフ](slides/aether-01-d-brief.md)

## 仕組み

```
ユーザー: 「ロボット製品の発表スライドを作って」
         │
         ▼
┌─────────────────────┐
│  slide-gen (skill)  │  ← インタラクティブなデザイン思考
│  Phase 1: トーン、   │     トーン × メタファー × UNFORGETTABLE
│  カラー、タイポグラフィ │
└────────┬────────────┘
         │ デザインブリーフ
         ▼
┌─────────────────────┐
│  slide-gen-worker   │  ← Marp ファイル + スクリーンショットを生成
│  (SubAgent)         │     実行時に design-guideline を参照
└────────┬────────────┘
         │ スクリーンショット
         ▼
┌─────────────────────┐
│  slide-evaluator    │  ← 4軸スコアリング（Cohesion, Purpose,
│  (SubAgent)         │     Craft, Narrative）+ 修正提案
└────────┬────────────┘
         │ 全軸 3/5 以上？
         ▼
    合格 → 完了
    不合格 → フィードバック付きで再生成（最大3サイクル）
```

### デザイン哲学

> 本当のリスクは大胆すぎるデザインではない — 無難すぎるデザインだ。

プラグインはあなたの方向性を最も極端に解釈し、そこから洗練します。巨大なタイポグラフィ、劇的な配色、大胆な余白。過剰な部分はエバリュエーターとあなたが削ぎ落とします。退屈なデザインに後から大胆さを注入することは誰にもできません。

## クイックスタート

### 1. プラグインのインストール

```
/plugin marketplace add https://github.com/khaym/basicslide.git
/plugin install basicslide@basicslide
```

### 2. スライドの生成

```
/slide-gen
```

コンテンツを Markdown で用意してください — ファイルでも会話内に直接書いても構いません。プラグインが対象者やトーンを確認した上で、プレゼンテーション全体を生成します。

**コンテンツモード:**

| モード | 動作 | 適した用途 |
|--------|------|-----------|
| `default` | スライドレイアウトに合わせてテキストを調整・再構成 | マーケティング、製品発表、クリエイティブ |
| `verbatim` | テキストをそのまま配置 — 言い換え・短縮なし | 財務報告、コンプライアンス文書、引用資料 |

プラグインの動作:
- コンテンツモードを確認
- 初回実行時にプロジェクトを自動セットアップ（テーマ、スクリプト、Marp CLI）
- オーダーメイドのビジュアルデザインで Marp プレゼンテーションを生成
- 品質基準を満たすまで評価・改善を実施

### 3. プレビューとエクスポート

```bash
# ブラウザでライブプレビュー
npx @marp-team/marp-cli --preview slides/my-presentation.md

# PNG にエクスポート
npm run build:one -- slides/my-presentation.md
```

その他のエクスポート形式（PDF、PPTX、HTML）については [Marp CLI](https://github.com/marp-team/marp-cli) を参照してください。

## プラグイン構成

```
plugins/basicslide/
├── skills/
│   ├── slide-gen/          # オーケストレーター: デザイン思考 + 改善ループ
│   │   ├── themes/         # バンドルされた Marp テーマ（プロジェクトに自動コピー）
│   │   └── scripts/        # ビルド + フォントサイズチェック用スクリプト
│   └── design-guideline/   # デザイン原則、ビジュアルルール、パターン
└── agents/
    ├── slide-gen-worker/   # Marp ファイル生成（model: sonnet）
    └── slide-evaluator/    # 4軸品質スコアリング（model: sonnet）
```

### スキル

| スキル | トリガー | 説明 |
|--------|---------|------|
| `slide-gen` | "create slides", "スライドを作って" | フルオーケストレーション: デザイン思考 → 生成 → 評価 → 改善 |
| `design-guideline` | "design guideline", "デザインルール" | デザイン原則リファレンス — Bold デザイン哲学 + 知覚原則（Gestalt）+ 戦略原則、加えてビジュアルルールと Marp レイアウトパターン |

### 評価軸

| 軸 | 評価内容 |
|----|---------|
| **Cohesion & Rhythm** | パレットの一貫性、スライド間のインテンシティカーブ |
| **Purpose Alignment** | デザインがプレゼンテーションの目的に合っているか |
| **Craft** | タイポグラフィ、余白、コントラスト、アクセシビリティ |
| **Narrative Flow** | スライドの流れが一貫したストーリーを語っているか |

合格基準: **全軸 3/5 以上**

## 動作要件

- [Claude Code](https://claude.ai/code) CLI または IDE 拡張機能
- Node.js（Marp CLI 用）
- Chromium（PNG/PDF エクスポート用）

初回実行時に Marp CLI の自動インストールと Chromium / CJK フォントの存在確認を行います。

## ライセンス

[MIT](LICENSE)
