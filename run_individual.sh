#! /bin/bash
declare -A user_to_port=(
        ["mj"]="9003"
        ["potato"]="9004"
        ["nago"]="9005"
        ["yoshi"]="9006"
        ["girrafe"]="9007"
)

# 現在のユーザー名を取得
CURRENT_USER=$(whoami)

# ユーザーに対応するポート番号を取得
if [[ -n "${user_to_port[$CURRENT_USER]}" ]]; then
    PORT="${user_to_port[$CURRENT_USER]}"
    echo "Starting server for user $CURRENT_USER on port $PORT"
    uv run main.py --port $PORT
else
    echo "User $CURRENT_USER not found in user_to_port mapping"
    echo "Available users: ${!user_to_port[@]}"
fi
