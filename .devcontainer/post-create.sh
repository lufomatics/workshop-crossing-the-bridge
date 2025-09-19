#!/bin/bash

set -euxo pipefail

if ! gh extension list 2>/dev/null | grep -q 'githubnext/gh-aw'; then
  gh extension install githubnext/gh-aw
fi

if [[ -n "${GITHUB_REPOSITORY:-}" ]]; then
  if [[ -n "${GITHUB_TOKEN:-}" ]]; then
    gh api \
      --method POST \
      -H "Accept: application/vnd.github+json" \
      -H "X-GitHub-Api-Version: 2022-11-28" \
      /repos/${GITHUB_REPOSITORY}/dispatches \
      -f event_type='codespace-awakened' \
      -F client_payload[iscodespace]="${CODESPACES:-false}" \
      -F client_payload[codespace]="${CODESPACE_NAME:-unknown}" \
      -F client_payload[repository]="${GITHUB_REPOSITORY}" \
      -F client_payload[committer]="${GIT_COMMITTER_NAME:-unknown}" \
      -F client_payload[user]="${GITHUB_USER:-unknown}"
  else
    echo "GITHUB_TOKEN indisponível; ignorando envio do sinal codespace-awakened" >&2
  fi
else
  echo "Variável GITHUB_REPOSITORY não definida; nada a sinalizar." >&2
fi
echo "Sinal codespace-awakened enviado (se aplicável)."
