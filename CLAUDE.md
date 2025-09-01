# CLAUDE.md: Claude Code 用設定ガイド

## プロジェクト概要

**プロジェクト名**: pinkie-community blueprint
**目的**: 地域のAI寺子屋・私塾コミュニティの設計図とガイドライン集
**言語**: 日本語メイン

## ディレクトリ構造

```
/home/kenta/pinkie-community/blueprint/
├── README.md                    # メインエントランス
├── our-compass.md               # コミュニティの理念・価値観
├── roadmap.md                   # 3段階の発展計画
├── community-structure.md       # 寺子屋・私塾の二段階構造
├── code-of-conduct.md           # 行動規範
├── contributing.md              # 貢献ガイド
├── github-setup.md              # GitHubラベル・マイルストーン設計
├── improvements-backlog.md      # 改善項目一覧
├── scripts/
│   └── github-setup.sh         # GitHub自動設定スクリプト
├── CLAUDE.md                    # このファイル（Claude用ガイド）
└── AGENTS.md                    # エージェント用ガイド
```

## 重要な設定・コマンド

### Git設定
- **ブランチ**: main
- **リモート**: pinkie-community/blueprint
- **コミット時**: 必ず日本語で意図を明確に記述

### 推奨コマンド（存在しない場合は手動実行）
- **セットアップ**: `./scripts/github-setup.sh` （ラベル・マイルストーン設定）
- **ステータス確認**: `git status && gh issue list`
- **テスト**: 現在なし（ドキュメント中心プロジェクトのため）

## プロジェクトの特徴

### 1. コミュニティ中心の思想
- **現場（リアル）× 情報（バーチャル）** の融合
- **共有・共創・自律・実践** の4つの価値観
- **AI寺子屋（初心者）→ 私塾（上級者）** の学習段階

### 2. 開発スタイル
- **OSS文化重視**: Issue → Pull Request のフロー
- **初心者歓迎**: プログラミング不要な貢献を推奨
- **段階的実装**: Phase 1（黎明期）→ Phase 2（成長期）→ Phase 3（発展期）

### 3. GitHub活用
- **ラベル体系**: 種類別・領域別・優先度・状態・初心者向けの5カテゴリ
- **マイルストーン**: Phase別 + 短期目標
- **Issue template**: (今後実装予定)

## 作業時の注意点

### ✅ 推奨する行動
- **コミュニティの価値観を尊重**: 共有知の財産として価値のあるものを作る
- **初心者目線を保持**: 専門用語を避け、分かりやすい表現を心がける
- **段階的な改善**: improvements-backlog.md を参考に優先度を考慮
- **実用性重視**: 地域の誰もが明日から使えるものを目指す

### ❌ 避けるべき行動
- **技術中心の思考**: 技術ありきではなく、課題解決ありきで考える
- **完璧主義**: まずは最小限の価値を提供し、徐々に改善
- **独立した作業**: コミュニティの他の要素との連携を常に意識

## Epic 運用の基本ルール

### Epic の理解
- **Epic = 大きな物語**: 3-6ヶ月で完結する中期的なゴール
- **価値重視**: 技術的な作業ではなく「地域への価値提供」が軸
- **Issue の束ね方**: 単発タスクではなく、意味のある文脈でまとめる

### 現在のEpic構造 (Phase 1)
```
Epic 1.1: AI寺子屋基盤整備 (ラベル: epic-1.1)
Epic 1.2: コミュニティ基盤構築 (ラベル: epic-1.2)  
Epic 1.3: 最初の共有知財産創造 (ラベル: epic-1.3)
```

### Epic関連の作業時の判断フロー
1. **新しいIssueを立てる時**:
   - どのEpicに属するか確認 (`epic-design.md` 参照)
   - 該当するepic-X.X ラベルを必ず付与
   - Epic Issue にチェックボックスで追加

2. **既存Issueを編集する時**:
   - Epic全体への影響を考慮
   - 必要に応じてEpic Issueの進捗を更新

3. **新しいEpicが必要か判断する時**:
   - 3-6ヶ月の中期目標として独立しているか
   - 地域への明確な価値提供があるか
   - 既存のEpicでは包含できない規模か

### Epic Issue の特別な扱い
- **タイトル形式**: `[Phase番号] Epic名: 価値や成果`
- **必須ラベル**: `epic` + `epic-X.X` + 優先度 + 領域
- **必須要素**: 🎯目指すもの、📋主要タスク、🏁成功指標、📅スケジュール、🌟地域への価値
- **更新頻度**: 月1回の定期レビューで進捗を更新

## 設定・仕様管理の基本ルール

### spec ラベルの理解
- **spec = 設定・仕様**: GitHub設定、ラベル体系、プロセス設計等の基盤作業
- **重要性**: コミュニティの文化や働き方を決める重要な意思決定
- **慎重性**: 既存作業への影響を必ず考慮する

### spec ラベル体系
```
メインラベル: spec
設定種別: spec-labels, spec-milestones, spec-templates, 
         spec-workflows, spec-processes, spec-docs
重要度: spec-breaking, spec-enhancement, spec-maintenance
```

### spec 作業時の必須プロセス
1. **事前確認**:
   - 整合性チェック（既存設定との矛盾がないか）
   - 影響範囲調査（どの作業・人に影響するか）
   - spec-management.md のプロセス確認

2. **実装時**:
   - 適切な spec-* ラベルの付与
   - spec-breaking の場合は必ず Issue で事前議論
   - 関連スクリプト（scripts/内）の同時更新

3. **事後対応**:
   - 関連ドキュメント（CLAUDE.md, AGENTS.md等）の同期更新
   - 動作確認とテスト実施

## よくある作業パターン

### spec関連の作業
1. **設定・仕様の変更**:
   - spec-management.md でプロセスを確認
   - 適切な spec-* ラベルを付与
   - spec-breaking の場合は必ず Issue で事前議論
   - 関連ドキュメントとスクリプトの同時更新

2. **新しいラベル・マイルストーンの追加**:
   - github-setup.md で既存設計を確認
   - scripts/github-setup.sh または setup-spec-labels.sh を更新
   - テスト実行後にドキュメント更新

### Epic関連の作業
1. **Epic配下のIssue作成**:
   - epic-design.md で該当Epicを確認
   - 適切な epic-X.X ラベルを付与
   - Epic Issue のタスクリストに追加
   - 地域への価値との関連を明確にする

2. **Epic進捗の確認**:
   - Epic Issue のタスクリストをチェック
   - 成功指標の達成度を評価
   - ボトルネックがあれば Issue化して解決

### ドキュメント更新
1. 該当するmarkdownファイルを特定
2. our-compass.md の価値観に沿っているか確認
3. 初心者にも理解しやすい表現かチェック
4. contributing.md のプロセスに従って修正
5. **関連するEpicがあれば進捗を更新**

### 新機能・改善の提案
1. improvements-backlog.md で既存の計画を確認
2. **どのEpicに属するか、新しいEpicが必要か判断**
3. 適切なラベル（area:〜, priority:〜, epic-X.X）を想定してIssue化
4. roadmapのどのPhaseに該当するか判断

### GitHub設定変更
1. github-setup.md で現在の設計を確認
2. scripts/github-setup.sh や scripts/setup-epics.sh を必要に応じて更新
3. 変更をテストしてからコミット

## リポジトリの現在の状態

### 完成済み
- 基本的なコミュニティ設計ドキュメント一式
- GitHubラベル・マイルストーン設定
- 改善項目の棚卸し

### Phase 1 で対応予定
- 連絡先情報の追加 (code-of-conduct.md:47)
- Discord連携方法の明確化 
- AI寺子屋の具体的カリキュラム例
- Issue/PR テンプレートの作成

### Phase 2 以降で検討
- 成功事例・ケーススタディ
- メンター制度設計
- 私塾カリキュラム詳細

## 更新履歴
- 2025年9月1日: 初版作成