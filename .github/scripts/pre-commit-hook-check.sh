#!/bin/bash

FILE=$(cat ./main/.pre-commit-config.yaml)
HOOK=$(cat << EOM
    hooks:
      - id: conventional-pre-commit
        stages: [commit-msg]
EOM)

if [[ $FILE == *"$HOOK"* ]]; then
    echo "🎉 .pre-commit-config.yaml file includes the conventional-pre-commit hook."
    exit 0
else:
    echo "❌ The repository .pre-commit-config.yaml file does not include the conventional-pre-commit hook."
    exit 1
fi