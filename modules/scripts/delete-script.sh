#!/usr/bin/env bash
set -x # debug mode

PROJECT_ID="$1"
POLICY_ID="$2"

# include functions to build gcloud command
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P )"
UTILS_ABS_PATH="${SCRIPT_DIR}/script-utils.sh"
# shellcheck disable=SC1090
source "$UTILS_ABS_PATH"

DESCRIBE_COMMAND="$(get_describe_command "$PROJECT_ID" "$POLICY_ID")"
eval "$DESCRIBE_COMMAND"
RETURN_CODE="$?"
echo "return code of describe command: $RETURN_CODE"

if [ "$RETURN_CODE" -eq 0 ]; then
    DELETE_COMMAND="$(get_delete_command "$PROJECT_ID" "$POLICY_ID")"
    eval "$DELETE_COMMAND"
    RETURN_CODE="$?"
    echo "return code of delete command: $RETURN_CODE"
fi
