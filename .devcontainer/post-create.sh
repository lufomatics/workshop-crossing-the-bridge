#!/usr/bin/env bash

set -euxo pipefail

if ! gh extension list 2>/dev/null | grep -q 'githubnext/gh-aw'; then
  gh extension install githubnext/gh-aw
fi

# Check if 1-codespace-awakening.yaml workflow has already been executed
workflow_info=$(gh workflow view 1-codespace-awakening.yaml 2>/dev/null || echo "")

if [[ -z "$workflow_info" ]]; then
  echo "Não foi possível encontrar o workflow 1-codespace-awakening.yaml" >&2
  exit 1
fi

# Extract total runs count
total_runs=$(echo "$workflow_info" | grep "Total runs" | awk '{print $3}')

if [[ "$total_runs" -gt 0 ]]; then
  echo "Workflow 1-codespace-awakening.yaml já foi executado ($total_runs execuções)"
  if [[ -n "${GITHUB_REPOSITORY:-}" ]]; then
    echo "Veja as issues do repositório: https://github.com/${GITHUB_REPOSITORY}/issues"
  fi
  exit 0
fi

# Workflow not executed yet, proceed with dispatch
if [[ -n "${GITHUB_REPOSITORY:-}" ]]; then
  if [[ -n "${GITHUB_TOKEN:-}" ]]; then
    echo "Enviando sinal codespace-awakened (workflow ainda não executado)..."
    
    # Retry logic - attempt up to 3 times
    max_attempts=3
    attempt=1
    success=false
    
    while [[ $attempt -le $max_attempts ]] && [[ "$success" == false ]]; do
      echo "Tentativa $attempt de $max_attempts..."
      
      if gh api \
        --method POST \
        -H "Accept: application/vnd.github+json" \
        -H "X-GitHub-Api-Version: 2022-11-28" \
        /repos/${GITHUB_REPOSITORY}/dispatches \
        -f event_type='codespace-awakened' \
        -F client_payload[iscodespace]="${CODESPACES:-false}" \
        -F client_payload[codespace]="${CODESPACE_NAME:-unknown}" \
        -F client_payload[repository]="${GITHUB_REPOSITORY}" \
        -F client_payload[committer]="${GIT_COMMITTER_NAME:-unknown}" \
        -F client_payload[user]="${GITHUB_USER:-unknown}" 2>/dev/null; then
        
        echo "Sinal codespace-awakened enviado com sucesso!"
        success=true
      else
        echo "Falha na tentativa $attempt" >&2
        if [[ $attempt -lt $max_attempts ]]; then
          sleep_time=$((attempt * 2))
          echo "Aguardando ${sleep_time}s antes da próxima tentativa..." >&2
          sleep $sleep_time
        fi
        ((attempt++))
      fi
    done
    
    if [[ "$success" == false ]]; then
      echo "Falha ao enviar sinal codespace-awakened após $max_attempts tentativas" >&2
      exit 1
    fi
  else
    echo "GITHUB_TOKEN indisponível; ignorando envio do sinal codespace-awakened" >&2
  fi
else
  echo "Variável GITHUB_REPOSITORY não definida; nada a sinalizar." >&2
fi
