#!/bin/bash
echo "ApplicationStart: Restarting the server..."
BRANCH="$AWS_DEPLOYMENT_GROUP_NAME"

if [[ "$BRANCH" == "StagingDeployment" ]]; then
  sudo systemctl restart summarizer-ai-staging
elif [[ "$BRANCH" == "ProdDeployment" ]]; then
  sudo systemctl restart summarizer-ai-production
fi