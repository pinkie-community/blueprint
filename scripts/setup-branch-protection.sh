#!/bin/bash

# Branch Protection Setup Script for pinkie-community
# main ブランチの保護設定スクリプト

echo "🛡️ pinkie-community ブランチ保護設定を開始します..."

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

# 現在の保護設定を確認
echo_info "現在のブランチ保護設定を確認中..."
CURRENT_PROTECTION=$(gh api repos/$REPO/branches/main/protection 2>/dev/null || echo "not_protected")

if [ "$CURRENT_PROTECTION" != "not_protected" ]; then
    echo_warning "main ブランチには既に保護設定があります"
    echo_info "現在の設定を上書きしますか？ (y/N)"
    read -r CONFIRM
    if [[ ! $CONFIRM =~ ^[Yy]$ ]]; then
        echo_info "設定を中止しました"
        exit 0
    fi
fi

# ブランチ保護設定の適用
echo_info "main ブランチに保護設定を適用中..."

# 基本的な保護設定
gh api repos/$REPO/branches/main/protection \
    --method PUT \
    --field required_status_checks='{"strict":false,"contexts":[]}' \
    --field enforce_admins=false \
    --field required_pull_request_reviews='{"dismiss_stale_reviews":true,"require_code_owner_reviews":false,"required_approving_review_count":1,"require_last_push_approval":false}' \
    --field restrictions='null' \
    --field allow_force_pushes=false \
    --field allow_deletions=false \
    --field block_creations=false \
    --field required_conversation_resolution=true \
    --field lock_branch=false \
    --field allow_fork_syncing=true > /dev/null

if [ $? -eq 0 ]; then
    echo_success "ブランチ保護設定を適用しました"
else
    echo_error "ブランチ保護設定の適用に失敗しました"
    exit 1
fi

echo ""
echo_success "🎉 ブランチ保護設定が完了しました！"
echo ""
echo_info "適用された設定:"
echo "  ✅ Pull Request 必須（直接プッシュ禁止）"
echo "  ✅ レビュー必須（1名以上の承認）"
echo "  ✅ 古いレビューの無効化（新しい変更があった場合）"
echo "  ✅ 会話の解決必須（コメントへの対応必須）"
echo "  ✅ フォースプッシュ禁止"
echo "  ✅ ブランチ削除禁止"
echo ""
echo_warning "注意事項:"
echo "  - 今後 main ブランチへの直接コミットはできません"
echo "  - 全ての変更は Pull Request 経由で行ってください"
echo "  - 1名以上のレビューが必要になります"
echo ""
echo_info "設定確認コマンド:"
echo "  gh api repos/$REPO/branches/main/protection"