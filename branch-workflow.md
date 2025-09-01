# ブランチ運用ワークフロー: GitHub を使った協力の仕組み

## はじめに：なぜルールが必要なのか

pinkie-community では、技術レベルに関わらず誰もが安心して貢献できる環境を目指しています。

明確なブランチ運用ルールがあることで、初心者の方でも「何をどうすれば良いか」が分かりやすくなり、経験者の方はスムーズに作業を進められます。

## 基本的な考え方

### 🌱 ブランチの役割
- **main ブランチ**: 常に安定した状態を保つ「本流」
- **フィーチャーブランチ**: 新機能や修正を開発する「作業場」

### 🔄 基本の流れ
```
1. Issue で課題・提案を議論
2. フィーチャーブランチを作成
3. 作業を行いコミット
4. Pull Request で提案
5. レビュー・議論
6. main ブランチにマージ
```

## フィーチャーブランチの命名規則

### 📋 命名パターン
```
[カテゴリ]/[簡潔な説明]
```

### 🏷️ カテゴリ一覧
- **feat/** - 新機能追加（新しいドキュメント、機能追加など）
- **fix/** - バグ修正、誤字修正など
- **docs/** - ドキュメント更新・改善
- **spec/** - 設定・仕様変更（ラベル、ワークフロー等）
- **epic/** - Epic 関連作業

### ✅ 良い例
```
feat/add-terakoya-curriculum-template
fix/code-of-conduct-contact-info
docs/update-contributing-guide
spec/branch-workflow-rules
epic/phase2-structure-design
```

### ❌ 避けるべき例
```
test                    # カテゴリがない
feat/fix-bug           # カテゴリが矛盾
my-awesome-feature     # 内容が不明確
```

## ブランチ作成からマージまでの詳細フロー

### Phase 1: Issue の作成・議論
```bash
# 1. Issue を GitHub で作成（または既存 Issue を確認）
# 2. 適切なラベルを付与
# 3. 必要に応じてコミュニティで議論
```

### Phase 2: ブランチ作成・開発
```bash
# 1. リポジトリの最新状態を取得
git checkout main
git pull origin main

# 2. フィーチャーブランチを作成
git checkout -b feat/your-feature-name

# 3. 作業を実行
# ファイルの編集、追加等

# 4. 変更をコミット
git add .
git commit -m "feat: 機能の追加や変更の詳細な説明"

# 5. リモートにプッシュ
git push -u origin feat/your-feature-name
```

### Phase 3: Pull Request・レビュー
```bash
# 1. GitHub で Pull Request を作成
gh pr create --title "[feat] 機能名: 変更内容の要約" \
  --body "## 概要
変更内容の詳細

## チェックリスト
- [ ] 適切なラベルを付与
- [ ] 関連 Issue をリンク
- [ ] ドキュメント更新が必要な場合は実施済み"

# 2. レビューを待つ
# 3. フィードバックがあれば対応
# 4. 承認されたらマージ
```

### Phase 4: クリーンアップ
```bash
# マージ後、ローカルブランチを削除
git checkout main
git pull origin main
git branch -d feat/your-feature-name
```

## コミットメッセージの書き方

### 📝 基本形式
```
[カテゴリ]: 変更内容の要約

詳細な説明（必要な場合）
```

### 🏷️ カテゴリ例
- **feat**: 新機能追加
- **fix**: バグ修正
- **docs**: ドキュメント更新
- **spec**: 設定・仕様変更
- **refactor**: リファクタリング

### ✅ 良いコミットメッセージ例
```
feat: AI寺子屋カリキュラムテンプレートを追加

初心者向けのカリキュラム作成をサポートするテンプレートを作成。
以下の要素を含む：
- 学習目標設定
- 時間配分
- 実習内容
```

## Pull Request のガイドライン

### 📋 PR タイトルの形式
```
[カテゴリ] 機能名: 変更内容の要約
```

### 🏷️ 必須ラベル
- **種類**: enhancement, bug, documentation など
- **領域**: area: 寺子屋, area: コミュニティ など
- **優先度**: priority: high/medium/low
- **Epic**: epic-X.X（該当する場合）
- **Spec**: spec, spec-*（設定変更の場合）

### ✅ PR テンプレート
```markdown
## 概要
この PR で何を変更するか、なぜ変更するかを説明

## 変更内容
- [ ] 変更点1
- [ ] 変更点2

## 関連 Issue
Closes #XX

## チェックリスト
- [ ] 適切なラベルを付与
- [ ] ドキュメント更新（必要な場合）
- [ ] 既存機能への影響確認
```

## レビュープロセス

### 🎯 レビューの観点
1. **コミュニティ価値観との適合性**
   - our-compass.md の価値観に沿っているか
   - 初心者にとって分かりやすいか

2. **実用性・品質**
   - 地域のコミュニティで実際に使えるか
   - 文章が分かりやすいか

3. **整合性**
   - 既存のドキュメントと矛盾しないか
   - 命名規則やスタイルが統一されているか

### ⏱️ レビュー期間
- **通常の変更**: 2-3営業日
- **spec-breaking**: 1週間程度（議論時間を考慮）
- **緊急修正**: 24時間以内

### 👥 レビュアー
- **1名以上の承認**: 一般的な変更
- **2名以上の承認**: spec-breaking な変更
- **コミュニティ議論**: 大きな方向性に関わる変更

## マージ戦略

### 🎯 基本方針: Squash and Merge
- 複数のコミットを1つにまとめてマージ
- main ブランチの履歴をクリーンに保持
- Epic 単位での進捗が追跡しやすい

### 📋 マージ時の注意点
1. **マージコミットメッセージの確認**
   - PR の内容を適切に要約しているか
   - 関連 Issue 番号が含まれているか

2. **ブランチの削除**
   - マージ後は自動的にフィーチャーブランチを削除

## ブランチ保護設定（推奨）

### 🛡️ main ブランチの保護
- **直接プッシュ禁止**: 必ず Pull Request 経由
- **レビュー必須**: 1名以上の承認が必要
- **ステータスチェック**: （将来的に CI/CD 導入時）

## 特別なケース

### 🚨 緊急修正（Hotfix）
```bash
# 緊急修正用ブランチ
git checkout -b fix/urgent-issue-description
# 修正作業
git commit -m "fix: 緊急修正の詳細"
# 即座に PR 作成、レビュー依頼
```

### 🏗️ Epic 関連作業
- Epic Issue との関連を明確にする
- epic-X.X ラベルを必ず付与
- Epic の進捗状況を定期的に更新

### ⚙️ spec 関連作業
- spec-* ラベルを適切に付与
- spec-breaking の場合は事前に Issue で議論
- 関連ドキュメント（CLAUDE.md, AGENTS.md）の同期更新

## トラブルシューティング

### ❓ よくある質問

**Q: どのブランチから作業を始めれば良い？**
A: 必ず main ブランチから最新の状態でフィーチャーブランチを作成

**Q: PR を作成後に変更が必要になった場合は？**
A: 同じフィーチャーブランチに追加コミットを push すれば PR に自動反映

**Q: マージが競合した場合は？**
A: main ブランチの最新を取り込んで競合を解決
```bash
git checkout main
git pull origin main
git checkout your-feature-branch
git merge main
# 競合解決
git commit
git push
```

**Q: 間違えて main ブランチに直接コミットしてしまった場合は？**
A: 慌てずに Discord で相談。一緒に解決方法を考えます。

## 参考資料

- [貢献ガイド](./contributing.md) - 基本的な貢献方法
- [CLAUDE.md](./CLAUDE.md) - AI エージェント向けガイド
- [Epic 設計](./epic-design.md) - Epic 関連作業の詳細
- [設定管理](./spec-management.md) - spec 関連作業の詳細

## 更新履歴
- 2025年9月1日: 初版作成

---
*このガイドは、技術レベルに関わらず誰もが安心して貢献できる環境を目指して作成されています*