# Claude
if command -v claude >/dev/null 2>&1; then
  claude mcp add --scope user playwright -- npx @playwright/mcp@latest
  claude mcp add --scope user --transport http linear https://mcp.linear.app/mcp
  claude mcp add --scope user --transport http context7 https://mcp.context7.com/mcp --header "CONTEXT7_API_KEY: \${__KEY_CONTEXT7}"
  claude mcp add --scope user --transport http atlassian https://mcp.atlassian.com/v1/mcp
  claude mcp add --scope user --transport http slack https://mcp.slack.com/mcp
  claude mcp add --scope user --env NOTION_TOKEN=$__KEY_NOTION notion -- npx -y @notionhq/notion-mcp-server
fi

# codex
if command -v codex >/dev/null 2>&1; then
  codex mcp add playwright npx "@playwright/mcp@latest"
  codex mcp add linear --url https://mcp.linear.app/mcp
  codex mcp add context7 --url https://mcp.context7.com/mcp -c "http_headers = { \"CONTEXT7_API_KEY\" = \"\${__KEY_CONTEXT7}\" }"
  codex mcp add atlassian --url https://mcp.atlassian.com/v1/mcp
  codex mcp add slack --url https://mcp.slack.com/mcp
fi
