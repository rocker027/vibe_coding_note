#!/usr/bin/env bash

set -euo pipefail

echo "Installing Claude Code CLI..."
npm install -g @anthropic-ai/claude-code

echo "Installing OpenAI Codex CLI..."
npm install -g @openai/codex

echo "Installing Google Gemini CLI..."
npm install -g @google/gemini-cli

echo "Installing Atlassian CLI via Homebrew..."
brew install atlassian/tap/atlassian-cli

echo "CLI tools installation complete."
