# GitHub Setup Guide: GitHub環境設定ガイド

## はじめに

このドキュメントは、pinkie-community の GitHub リポジトリで使用するラベル、マイルストーン、テンプレートの設定方法をまとめたものです。

## Issue ラベル設定

### カテゴリ別ラベル体系

#### 1. 種類別ラベル（Type）
- 🆕 **enhancement** `#a2eeef` - 新機能・改善提案
- 🐛 **bug** `#d73a49` - バグ報告・問題の発見
- 📝 **documentation** `#0075ca` - ドキュメント関連
- ❓ **question** `#d876e3` - 質問・相談
- 💡 **idea** `#ffef9e` - アイデア・提案（議論段階）
- 🔧 **maintenance** `#fbca04` - メンテナンス作業

#### 2. コミュニティ領域別ラベル（Area）
- 🏫 **area: 寺子屋** `#c5f015` - AI寺子屋関連
- 🎓 **area: 私塾** `#1d76db` - 私塾関連
- 📋 **area: テンプレート** `#ff9500` - 共有知財産（テンプレート等）
- 🌐 **area: コミュニティ** `#0e8a16` - コミュニティ運営全般
- 📖 **area: ドキュメント** `#5319e7` - blueprint等のドキュメント

#### 3. 優先度ラベル（Priority）
- 🔴 **priority: high** `#b60205` - 高優先度（即座に対応が必要）
- 🟡 **priority: medium** `#fbca04` - 中優先度（計画的に対応）
- 🟢 **priority: low** `#0e8a16` - 低優先度（時間がある時に対応）

#### 4. 状態ラベル（Status）
- 🚀 **ready to work** `#ededed` - 作業開始可能
- 🔄 **in progress** `#ff6b6b` - 作業中
- ⏳ **waiting for response** `#ffc107` - レスポンス待ち
- 🤝 **needs discussion** `#17a2b8` - 議論が必要
- ✋ **blocked** `#dc3545` - ブロックされている

#### 5. 初心者向けラベル（Good First Issue）
- 🌱 **good first issue** `#7057ff` - 初心者におすすめ
- 👋 **help wanted** `#128A0C` - コミュニティの助けが欲しい

## マイルストーン設定

### Phase別マイルストーン

#### Phase 1: 黎明期 (開始〜6ヶ月)
```
Title: Phase 1: 黎明期 - AI寺子屋の開校
Description: コミュニティの土台を築き、最初の仲間たちと出会う
Due Date: 2026年3月31日
```

**主要目標:**
- AI寺子屋の定期開催確立
- コミュニティ基盤整備
- 最初の共有知財産創出

#### Phase 2: 成長期 (6ヶ月〜1年半)
```
Title: Phase 2: 成長期 - 私塾の始動
Description: 学び、実践し、還元するサイクルの確立
Due Date: 2027年3月31日
```

**主要目標:**
- 私塾開講
- 共有知財産の拡充
- コミュニティ自律性の促進

#### Phase 3: 発展期 (1年半以降)
```
Title: Phase 3: 発展期 - 社会実装
Description: 地域のイノベーション拠点として確立
Due Date: 2028年3月31日
```

**主要目標:**
- 外部連携開始
- 社会実装の実現
- 持続可能エコシステム完成

### 短期マイルストーン例

#### 第2回AI寺子屋準備
```
Title: 第2回AI寺子屋開催準備
Description: 2025年9月開催予定の第2回AI寺子屋の準備
Due Date: 2025年9月30日
```

#### 最初の共有知財産
```
Title: contract-templates v1.0
Description: 最初の共有知財産となるテンプレート集の初版リリース
Due Date: 2026年3月31日
```

## ラベルとマイルストーンの使い方

### Issue作成時のガイドライン

1. **必須ラベル**: 種類別ラベル（Type）は必ず1つ付ける
2. **推奨ラベル**: 領域別ラベル（Area）で関連分野を明確にする
3. **優先度設定**: 緊急度に応じて優先度ラベルを付ける
4. **マイルストーン**: 関連するフェーズまたは具体的目標に紐づける

### ラベルの組み合わせ例

```
enhancement + area: 寺子屋 + priority: high + ready to work + Phase 1: 黎明期
→ AI寺子屋の改善提案で、高優先度かつ作業開始可能な状態

question + area: コミュニティ + good first issue
→ コミュニティに関する質問で、初心者でも回答しやすい内容
```

## 設定方法

### GitHubでのラベル設定手順
1. リポジトリの「Issues」タブを開く
2. 「Labels」をクリック
3. 「New label」で上記のラベルを順次作成
4. カラーコードも忘れずに設定

### マイルストーンの設定手順
1. リポジトリの「Issues」タブを開く
2. 「Milestones」をクリック
3. 「New milestone」で上記のマイルストーンを順次作成

## 更新履歴

- 2025年9月1日: 初版作成