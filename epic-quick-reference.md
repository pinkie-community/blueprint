# Epic Quick Reference: 迷った時の早見表

## 🎯 Epic とは？
**3-6ヶ月で地域に価値を提供する大きな物語**

## 📋 現在のEpic一覧 (Phase 1)

| Epic ID | Epic名 | ラベル | 期間 | 成果 |
|---------|--------|--------|------|------|
| **1.1** | AI寺子屋基盤整備 | `epic-1.1` | 2025/09-2026/02 | 月1回定期開催の実現 |
| **1.2** | コミュニティ基盤構築 | `epic-1.2` | 2025/09-2025/12 | GitHub+Discord協力体制 |
| **1.3** | 共有知財産創造 | `epic-1.3` | 2025/10-2026/03 | contract-templates v1.0 |

## ⚡ 作業時の判断フローチャート

```
新しいIssueを作成する
        ↓
既存のEpicに属する？
    ↓YES     ↓NO
Epic-X.X    新Epic必要？
ラベル付与      ↓YES    ↓NO
    ↓        新Epic    単発Issue
Epic Issueに   作成     として処理
チェックボックス
で追加
```

## 🏷️ ラベリングルール

### 必須ラベルの組み合わせ
```
Epic Issue: epic + epic-X.X + priority:high/medium + area:〜
一般Issue: epic-X.X + 通常ラベル
```

### ラベル例
- `epic epic-1.1 priority:high area:寺子屋` (Epic Issue)
- `epic-1.2 enhancement area:コミュニティ` (一般Issue)

## 📝 Epic Issue のテンプレート

```markdown
# [PhaseX] Epic名: 価値や成果

## 🎯 このEpicが目指すもの
(地域への価値を明確に)

## 📋 含まれる主要タスク
- [ ] #xxx: タスク1
- [ ] #xxx: タスク2

## 🏁 成功指標
- 指標1: 具体的な状態
- 指標2: 測定可能な数値

## 📅 スケジュール
開始: YYYY年MM月
完了予定: YYYY年MM月

## 🌟 地域への価値
このEpicが完成すると：
- 価値1
- 価値2
```

## 🔍 よくあるQ&A

### Q: 新しいEpicを作るべきか迷った時は？
**A**: 以下を全て満たす場合のみ新Epic作成
- 3-6ヶ月の独立した期間が必要
- 地域への明確な価値提供がある  
- 既存Epicでは包含できない規模

### Q: どのEpicに属するか分からない時は？
**A**: `epic-design.md` の各Epic説明を確認。それでも迷ったらDiscordで相談

### Q: Epic Issueの進捗更新はいつ？
**A**: 月1回の定期レビュー時。ただし大きな変更があった場合は随時更新

### Q: Epic完了の判定は？
**A**: 成功指標がすべて達成され、地域への価値提供が確認できた時

## 🚨 よくある間違い

### ❌ やってはいけないこと
- Epic IssueをタスクIssueのように使う
- 技術的な改善だけでEpicを作る
- Epic ラベルを付け忘れる
- 成功指標が曖昧なまま進める

### ✅ 正しいやり方
- Epic = 地域への価値提供の物語として捉える
- 個別タスクは Epic配下のIssueとして管理
- 必ず適切なラベル（epic-X.X）を付与
- 定期的に進捗と方向性を確認

## 📚 詳細情報の参照先

- **Epic設計の詳細**: [`epic-design.md`](./epic-design.md)
- **CLAUDE向け詳細ガイド**: [`CLAUDE.md`](./CLAUDE.md)
- **セットアップスクリプト**: [`scripts/setup-epics.sh`](./scripts/setup-epics.sh)

---
*このガイドは全てのAI（Claude、その他エージェント）が Epic を適切に扱うための早見表です*

*更新日: 2025年9月1日*