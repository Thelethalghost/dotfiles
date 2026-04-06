#!/usr/bin/env bash
# populate-aws-sso-profiles.sh

SSO_SESSION_NAME="my-sso"
SSO_REGION="ap-south-1"
DEFAULT_REGION="ap-south-1"
OUTPUT_FORMAT="json"

TOKEN=$(cat ~/.aws/sso/cache/*.json 2>/dev/null \
  | jq -r 'select(.accessToken != null) | .accessToken' \
  | head -1)

if [ -z "$TOKEN" ]; then
  echo "❌ No active SSO token found. Please run: aws sso login --sso-session $SSO_SESSION_NAME"
  exit 1
fi

echo "📋 Fetching accounts..."

ACCOUNTS=$(aws sso list-accounts \
  --access-token "$TOKEN" \
  --region "$SSO_REGION" \
  --output json \
  | jq -c '.accountList[]')

NEW_COUNT=0
SKIP_COUNT=0

while IFS= read -r account; do
  ACCOUNT_ID=$(echo "$account" | jq -r '.accountId')
  ACCOUNT_NAME=$(echo "$account" | jq -r '.accountName' \
    | tr '[:upper:]' '[:lower:]' \
    | sed 's/[^a-z0-9]/-/g')

  ROLES=$(aws sso list-account-roles \
    --access-token "$TOKEN" \
    --account-id "$ACCOUNT_ID" \
    --region "$SSO_REGION" \
    --output json \
    | jq -r '.roleList[].roleName')

  while IFS= read -r ROLE_NAME; do
    if [ "$ROLE_NAME" = "BillingReadOnlyAccess" ]; then
      echo "  🚫 Skipping restricted role: $ROLE_NAME (account: $ACCOUNT_ID)"
      SKIP_COUNT=$((SKIP_COUNT + 1))
      continue
    fi

    PROFILE_NAME="${ACCOUNT_NAME}-${ROLE_NAME}"
    PROFILE_NAME=$(echo "$PROFILE_NAME" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g')

    if grep -q "\[profile ${PROFILE_NAME}\]" ~/.aws/config 2>/dev/null; then
      echo "  ⏭️  Already exists, skipping: $PROFILE_NAME"
      SKIP_COUNT=$((SKIP_COUNT + 1))
      continue
    fi

    echo "  ✅ Adding new profile: $PROFILE_NAME ($ACCOUNT_ID / $ROLE_NAME)"

    cat >> ~/.aws/config <<EOF

[profile ${PROFILE_NAME}]
sso_session = ${SSO_SESSION_NAME}
sso_account_id = ${ACCOUNT_ID}
sso_role_name = ${ROLE_NAME}
region = ${DEFAULT_REGION}
output = ${OUTPUT_FORMAT}
EOF

    NEW_COUNT=$((NEW_COUNT + 1))
  done <<< "$ROLES"
done <<< "$ACCOUNTS"

echo ""
echo "════════════════════════════════"
echo "✅ Done!"
echo "   New profiles added : $NEW_COUNT"
echo "   Existing skipped   : $SKIP_COUNT"
echo "   Total profiles     : $(aws configure list-profiles | wc -l)"
echo "════════════════════════════════"
