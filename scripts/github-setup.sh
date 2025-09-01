#!/bin/bash

# GitHub Setup Script for pinkie-community
# GitHub ラベルとマイルストーンの設定スクリプト

echo "🚀 pinkie-community GitHub セットアップを開始します..."

# カラー定義
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

echo_info() {
    echo -e "${BLUE}ℹ $1${NC}"
}

echo_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

echo_error() {
    echo -e "${RED}✗ $1${NC}"
}

# リポジトリの確認
echo_info "現在のリポジトリを確認中..."
REPO=$(gh repo view --json nameWithOwner --jq '.nameWithOwner')
echo_success "リポジトリ: $REPO"

# 1. ラベルの設定
echo_info "GitHub ラベルを設定中..."

# ラベル作成関数
create_label() {
    local name="$1"
    local description="$2"
    local color="$3"
    
    gh api repos/$REPO/labels \
        --method POST \
        --field name="$name" \
        --field description="$description" \
        --field color="$color" > /dev/null 2>&1 || \
    gh api repos/$REPO/labels/"$(echo "$name" | sed 's/ /%20/g')" \
        --method PATCH \
        --field name="$name" \
        --field description="$description" \
        --field color="$color" > /dev/null 2>&1
}

# 種類別ラベル（Type）
create_label "enhancement" "新機能・改善提案" "a2eeef"
create_label "bug" "バグ報告・問題の発見" "d73a49"
create_label "documentation" "ドキュメント関連" "0075ca"
create_label "question" "質問・相談" "d876e3"
create_label "idea" "アイデア・提案（議論段階）" "ffef9e"
create_label "maintenance" "メンテナンス作業" "fbca04"

echo_success "種類別ラベル（Type）を設定しました"

# コミュニティ領域別ラベル（Area）
create_label "area: 寺子屋" "AI寺子屋関連" "c5f015"
create_label "area: 私塾" "私塾関連" "1d76db"
create_label "area: テンプレート" "共有知財産（テンプレート等）" "ff9500"
create_label "area: コミュニティ" "コミュニティ運営全般" "0e8a16"
create_label "area: ドキュメント" "blueprint等のドキュメント" "5319e7"

echo_success "領域別ラベル（Area）を設定しました"

# 優先度ラベル（Priority）
create_label "priority: high" "高優先度（即座に対応が必要）" "b60205"
create_label "priority: medium" "中優先度（計画的に対応）" "fbca04"
create_label "priority: low" "低優先度（時間がある時に対応）" "0e8a16"

echo_success "優先度ラベル（Priority）を設定しました"

# 状態ラベル（Status）
create_label "ready to work" "作業開始可能" "ededed"
create_label "in progress" "作業中" "ff6b6b"
create_label "waiting for response" "レスポンス待ち" "ffc107"
create_label "needs discussion" "議論が必要" "17a2b8"
create_label "blocked" "ブロックされている" "dc3545"

echo_success "状態ラベル（Status）を設定しました"

# 初心者向けラベル（Good First Issue）
create_label "good first issue" "初心者におすすめ" "7057ff"
create_label "help wanted" "コミュニティの助けが欲しい" "128A0C"

echo_success "初心者向けラベル（Good First Issue）を設定しました"

# 2. マイルストーンの設定
echo_info "GitHub マイルストーンを設定中..."

# Phase別マイルストーン
gh api repos/$REPO/milestones \
  --method POST \
  --field title='Phase 1: 黎明期 - AI寺子屋の開校' \
  --field description='コミュニティの土台を築き、最初の仲間たちと出会う。AI寺子屋の定期開催確立、コミュニティ基盤整備、最初の共有知財産創出を目指します。' \
  --field due_on='2026-03-31T23:59:59Z' \
  --field state='open' > /dev/null

gh api repos/$REPO/milestones \
  --method POST \
  --field title='Phase 2: 成長期 - 私塾の始動' \
  --field description='学び、実践し、還元するサイクルの確立。私塾開講、共有知財産の拡充、コミュニティ自律性の促進を目指します。' \
  --field due_on='2027-03-31T23:59:59Z' \
  --field state='open' > /dev/null

gh api repos/$REPO/milestones \
  --method POST \
  --field title='Phase 3: 発展期 - 社会実装' \
  --field description='地域のイノベーション拠点として確立。外部連携開始、社会実装の実現、持続可能エコシステム完成を目指します。' \
  --field due_on='2028-03-31T23:59:59Z' \
  --field state='open' > /dev/null

echo_success "Phase別マイルストーンを設定しました"

# 短期マイルストーン
gh api repos/$REPO/milestones \
  --method POST \
  --field title='第2回AI寺子屋開催準備' \
  --field description='2025年9月開催予定の第2回AI寺子屋の準備' \
  --field due_on='2025-09-30T23:59:59Z' \
  --field state='open' > /dev/null

gh api repos/$REPO/milestones \
  --method POST \
  --field title='contract-templates v1.0' \
  --field description='最初の共有知財産となるテンプレート集の初版リリース' \
  --field due_on='2026-03-31T23:59:59Z' \
  --field state='open' > /dev/null

echo_success "短期マイルストーンを設定しました"

echo ""
echo_success "🎉 GitHub セットアップが完了しました！"
echo_info "設定されたラベル数: $(gh api repos/$REPO/labels | jq length)"
echo_info "設定されたマイルストーン数: $(gh api repos/$REPO/milestones | jq length)"
echo ""
echo_warning "次のステップ:"
echo "  1. spec用ラベルの追加: ./scripts/setup-spec-labels.sh"
echo "  2. Epic の作成: ./scripts/setup-epics.sh"
echo "  3. Issue テンプレートの作成"
echo "  4. Pull Request テンプレートの作成"