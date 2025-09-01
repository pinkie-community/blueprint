#!/bin/bash

# Spec Labels Setup Script for pinkie-community
# 設定・仕様管理用ラベルの追加スクリプト

echo "🔧 pinkie-community Spec ラベル セットアップを開始します..."

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

echo_spec() {
    echo -e "${PURPLE}🔧 $1${NC}"
}

# リポジトリの確認
echo_info "現在のリポジトリを確認中..."
REPO=$(gh repo view --json nameWithOwner --jq '.nameWithOwner')
echo_success "リポジトリ: $REPO"

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

# メインのspecラベル
echo_info "メインのspecラベルを追加中..."
create_label "spec" "設定・仕様に関する全般的な作業" "6f42c1"
echo_success "メインspecラベルを追加しました"

# 設定種別ラベル（spec-type）
echo_info "設定種別ラベルを追加中..."

create_label "spec-labels" "GitHubラベルの新規作成・変更・削除" "8b5cf6"
create_label "spec-milestones" "GitHubマイルストーンの管理" "a855f7" 
create_label "spec-templates" "Issue/PR テンプレートの作成・更新" "c084fc"
create_label "spec-workflows" "GitHub Actions や自動化設定" "d8b4fe"
create_label "spec-processes" "作業フロー・プロセス設計" "e9d5ff"
create_label "spec-docs" "CLAUDE.md、AGENTS.md等の設定ドキュメント" "f3e8ff"

echo_success "設定種別ラベルを追加しました"

# 重要度ラベル（spec向け）
echo_info "spec向け重要度ラベルを追加中..."

create_label "spec-breaking" "既存の作業に影響する重大な変更" "dc2626"
create_label "spec-enhancement" "機能追加・改善" "f59e0b"
create_label "spec-maintenance" "保守・メンテナンス" "10b981"

echo_success "spec向け重要度ラベルを追加しました"

echo ""
echo_success "🎉 Spec ラベル セットアップが完了しました！"
echo_info "追加されたラベル数: 10"
echo ""
echo_info "追加されたラベル一覧:"
echo_spec "  メインラベル:"
echo "    - spec: 設定・仕様に関する全般的な作業"
echo_spec "  設定種別ラベル:"
echo "    - spec-labels: GitHubラベル管理"
echo "    - spec-milestones: マイルストーン管理"
echo "    - spec-templates: テンプレート管理"  
echo "    - spec-workflows: 自動化設定"
echo "    - spec-processes: プロセス設計"
echo "    - spec-docs: 設定ドキュメント"
echo_spec "  重要度ラベル:"
echo "    - spec-breaking: 重大な変更"
echo "    - spec-enhancement: 機能追加・改善"
echo "    - spec-maintenance: 保守・メンテナンス"
echo ""
echo_info "推奨される次のステップ:"
echo "  1. Issue/PR テンプレートに spec 用のセクション追加"
echo "  2. CLAUDE.md に spec 管理のルールを追加"
echo "  3. 現在の設定変更作業に適切なラベルを付与"