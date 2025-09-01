#!/bin/bash

# Epic Setup Script for pinkie-community
# GitHubでのEpic運用のための設定スクリプト

echo "🎯 pinkie-community Epic セットアップを開始します..."

# カラー定義
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

echo_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

echo_info() {
    echo -e "${BLUE}ℹ $1${NC}"
}

echo_epic() {
    echo -e "${PURPLE}🎯 $1${NC}"
}

# リポジトリの確認
echo_info "現在のリポジトリを確認中..."
REPO=$(gh repo view --json nameWithOwner --jq '.nameWithOwner')
echo_success "リポジトリ: $REPO"

# Epic用ラベルの追加
echo_info "Epic用ラベルを追加中..."

# メインのEpicラベル
gh api repos/$REPO/labels \
    --method POST \
    --field name="epic" \
    --field description="大きな物語・長期的なゴール" \
    --field color="8B5CF6" > /dev/null 2>&1 || \
gh api repos/$REPO/labels/epic \
    --method PATCH \
    --field name="epic" \
    --field description="大きな物語・長期的なゴール" \
    --field color="8B5CF6" > /dev/null 2>&1

# Phase 1 Epic ラベル
gh api repos/$REPO/labels \
    --method POST \
    --field name="epic-1.1" \
    --field description="Epic 1.1: AI寺子屋基盤整備" \
    --field color="C084FC" > /dev/null 2>&1 || true

gh api repos/$REPO/labels \
    --method POST \
    --field name="epic-1.2" \
    --field description="Epic 1.2: コミュニティ基盤構築" \
    --field color="DDD6FE" > /dev/null 2>&1 || true

gh api repos/$REPO/labels \
    --method POST \
    --field name="epic-1.3" \
    --field description="Epic 1.3: 最初の共有知財産創造" \
    --field color="EDE9FE" > /dev/null 2>&1 || true

echo_success "Epic用ラベルを追加しました"

# Epic Issues の作成
echo_info "Phase 1 のEpic Issueを作成中..."

# Epic 1.1: AI寺子屋基盤整備
echo_epic "Epic 1.1: AI寺子屋基盤整備を作成中..."
gh issue create \
    --title "[Phase1] AI寺子屋基盤整備: 誰もが安心して学べる場づくり" \
    --label "epic,epic-1.1,area: 寺子屋,priority: high" \
    --milestone "Phase 1: 黎明期 - AI寺子屋の開校" \
    --body "$(cat <<'EOF'
# 🎯 このEpicが目指すもの

継続的に開催できる AI寺子屋の仕組みを作り、地域の誰もが安心してAI・IT技術に触れられる場を確立します。

江戸時代の寺子屋のように、年齢や職業、技術レベルに関わらず、誰もが気軽に立ち寄って学び、仲間と出会える現代の「学びの広場」を目指します。

## 📋 含まれる主要タスク

- [ ] 第2回AI寺子屋の企画・準備
- [ ] カリキュラムテンプレートの作成
- [ ] 参加者フィードバック収集システム
- [ ] 寺子屋運営マニュアルの整備
- [ ] 継続参加を促す仕組みづくり
- [ ] メンター・サポーター制度の検討

## 🏁 成功指標

- **継続性**: 月1回の定期開催が実現している
- **魅力度**: 参加者が自ら次の人を誘いたくなる場になっている  
- **持続性**: 運営側の負荷が持続可能なレベルに収まっている
- **多様性**: 様々な年代・職業の人が参加している
- **成長性**: 参加者のスキル向上が実感できている

## 📅 スケジュール

- **開始**: 2025年9月
- **完了予定**: 2026年2月
- **中間チェック**: 2025年12月

## 🌟 地域への価値

このEpicが完成すると：
- 地域にAI・IT人材育成の拠点ができる
- 世代を超えた学習コミュニティが生まれる
- デジタルデバイドの解消に貢献する
- 地域経済の底上げにつながる基盤ができる

## 📝 関連ドキュメント

- [コミュニティ構造](../community-structure.md#１．ai寺子屋仮現代の読み書きそろばんを学ぶ場)
- [ロードマップ Phase 1](../roadmap.md#phase-1-黎明期---最初の船出と仲間集め-開始6ヶ月)
EOF
)" > /dev/null

echo_success "Epic 1.1 を作成しました"

# Epic 1.2: コミュニティ基盤構築
echo_epic "Epic 1.2: コミュニティ基盤構築を作成中..."
gh issue create \
    --title "[Phase1] コミュニティ基盤構築: GitHub + Discord で協力する仕組み" \
    --label "epic,epic-1.2,area: コミュニティ,priority: high" \
    --milestone "Phase 1: 黎明期 - AI寺子屋の開校" \
    --body "$(cat <<'EOF'
# 🎯 このEpicが目指すもの

GitHub + Discord での協力体制を確立し、プログラミング未経験者でも安心して貢献できるコミュニティ基盤を構築します。

OSS（オープンソース）の文化を取り入れながら、技術的ハードルを下げ、誰もが「共有知の財産」づくりに参加できる環境を整えます。

## 📋 含まれる主要タスク

- [ ] Issue/PR テンプレートの整備
- [ ] Discord チャンネル構造の設計・運用開始
- [ ] 初心者向けGitHub活用ガイドの作成
- [ ] コントリビューション フローの文書化
- [ ] Discord ↔ GitHub 連携フローの確立
- [ ] モデレーション・サポート体制の整備

## 🏁 成功指標

- **アクセシビリティ**: プログラミング未経験者でも Issue を立てられる
- **自然な流れ**: Discord でのカジュアルな相談から GitHub での具体的提案への橋渡しができている
- **活発性**: 週に2-3件の新しい Issue・PR が生まれている
- **サポート性**: 困った人が24時間以内に助けを得られる体制ができている

## 📅 スケジュール

- **開始**: 2025年9月
- **完了予定**: 2025年12月
- **中間チェック**: 2025年10月

## 🌟 地域への価値

このEpicが完成すると：
- 地域の「困りごと」が可視化され、解決策が生まれやすくなる
- 世代を超えたデジタル協働の文化が根付く
- 地域の知恵が散逸せず、蓄積・共有される仕組みができる

## 📝 関連ドキュメント

- [貢献ガイド](../contributing.md)
- [GitHub設定ガイド](../github-setup.md)
EOF
)" > /dev/null

echo_success "Epic 1.2 を作成しました"

# Epic 1.3: 最初の共有知財産創造
echo_epic "Epic 1.3: 最初の共有知財産創造を作成中..."
gh issue create \
    --title "[Phase1] 最初の共有知財産創造: contract-templates v1.0 の世界リリース" \
    --label "epic,epic-1.3,area: テンプレート,priority: medium" \
    --milestone "contract-templates v1.0" \
    --body "$(cat <<'EOF'
# 🎯 このEpicが目指すもの

contract-templates v1.0 をリリースし、地域の事業者が実際に使える「共有知の財産」第1弾を世に送り出します。

単なるテンプレート集ではなく、法的な安全性と実用性を両立し、誰もが安心して利用できる品質を目指します。

## 📋 含まれる主要タスク

- [ ] 地域のニーズ調査（どんな契約書が必要？）
- [ ] 基本的な契約書テンプレート作成（5種類以上）
- [ ] 法的レビューとチェック体制の構築
- [ ] 利用ガイドとサンプルケース作成
- [ ] テンプレートのテスト利用とフィードバック収集
- [ ] v1.0 正式リリースとプロモーション

## 🏁 成功指標

- **品質**: 法的に問題のないテンプレートが5種類以上完成している
- **実用性**: 実際に地域の事業者が使用している事例が1件以上ある
- **アクセシビリティ**: 専門知識がなくても使えるガイドが整備されている
- **持続性**: 継続的に改善・追加できる仕組みができている

## 📅 スケジュール

- **開始**: 2025年10月
- **完了予定**: 2026年3月
- **中間チェック**: 2025年12月、2026年1月

## 🌟 地域への価値

このEpicが完成すると：
- 中小企業・個人事業主の法務コストが削減される
- 契約書作成のハードルが下がり、事業開始が容易になる
- 地域全体のビジネス基盤が向上する
- 「共有知の財産」という概念が具体的な形になる

## 📝 関連ドキュメント

- [ロードマップ Phase 1](../roadmap.md#主な目標)
- [改善項目一覧](../improvements-backlog.md#4-最初の共有知の財産プロジェクトの定義)
EOF
)" > /dev/null

echo_success "Epic 1.3 を作成しました"

# GitHub Projects の作成を提案
echo ""
echo_success "🎉 Epic セットアップが完了しました！"
echo_info "作成されたEpic数: 3"
echo ""
echo_info "推奨される次のステップ:"
echo "  1. GitHub Projects で Epic 管理用のカンバンボードを作成"
echo "  2. Discord に Epic 専用チャンネルを設置"
echo "  3. 各 Epic に具体的な Issue を追加していく"
echo ""
echo_info "GitHub Projects 作成コマンド例:"
echo "  gh project create --title 'Phase 1 Epic Management' --body 'Phase 1の3つのEpicを管理するプロジェクトボード'"