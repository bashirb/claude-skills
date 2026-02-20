#!/bin/bash
# PostToolUse hook: Log all tool usage for tracking and debugging
# This hook runs after any tool execution to maintain an audit log

timestamp=$(date '+%Y-%m-%d %H:%M:%S')

# Create logs directory if it doesn't exist
mkdir -p .claude/logs

# Log the tool usage
echo "[$timestamp] Claude made an edit " >> .claude/logs/tool-usage.log

# Always return success to avoid blocking tools
echo "{}"





# Call Anthropic API for a natural language summary
# if [ -n "$ANTHROPIC_API_KEY" ]; then
#   prompt="Summarize this code change in one concise sentence as a developer would describe it in a commit message. Be specific about what changed. No preamble, just the sentence.\n\n$change_context"

#   response=$(curl -s https://api.anthropic.com/v1/messages \
#     -H "x-api-key: $ANTHROPIC_API_KEY" \
#     -H "anthropic-version: 2023-06-01" \
#     -H "content-type: application/json" \
#     -d "{
#       \"model\": \"claude-haiku-4-5-20251001\",
#       \"max_tokens\": 100,
#       \"messages\": [{\"role\": \"user\", \"content\": $(echo "$prompt" | jq -Rs .)}]
#     }")

#   summary=$(echo "$response" | jq -r '.content[0].text // empty')
# else
#   summary="(set ANTHROPIC_API_KEY for natural language summaries)"
# fi

# echo "[$timestamp] $file — $summary" >> .claude/logs/tool.log

# echo "{}"
