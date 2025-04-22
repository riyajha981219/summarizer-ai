#!/bin/bash
echo "ApplicationStart: Restarting the server..."
BRANCH="$AWS_DEPLOYMENT_GROUP_NAME"

if [[ "$BRANCH" == "StagingDeploymentGroup" ]]; then
  sudo systemctl restart summarizer-ai-staging
elif [[ "$BRANCH" == "ProdDeploymentGroup" ]]; then
  sudo systemctl restart summarizer-ai-production
fi