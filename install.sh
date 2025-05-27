#!/usr/bin/env bash
# 
# Create Bash aliases to the helper scripts.

PROJECT_ROOT=$(dirname "$BASH_SOURCE")

alias til="$PROJECT_ROOT/scripts/til_post.sh"
alias til_screenshot="$PROJECT_ROOT/scripts/til_screenshot.sh"

# Install Node.js tools if not present
if ! command -v markdownlint &> /dev/null; then
  npm install -g markdownlint-cli
fi

if ! command -v prettier &> /dev/null; then
  npm install -g prettier
fi

# Install Vale if not present (macOS/Homebrew)
if ! command -v vale &> /dev/null; then
  brew install vale
fi

# Install pre-commit if not present
if ! command -v pre-commit &> /dev/null; then
  pip install pre-commit
fi
