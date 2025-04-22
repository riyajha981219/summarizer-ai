#!/bin/bash
echo "AfterInstall: Moving code to the correct environment..."
BRANCH="$AWS_DEPLOYMENT_GROUP_NAME" # CodeDeploy provides the deployment group name as an environment variable

if [[ "$BRANCH" == "StagingDeploymentGroup" ]]; then
  sudo rm -rf /home/ubuntu/apps/summarizer-ai/staging/*
  sudo cp -r /home/ubuntu/apps/summarizer-ai/deploy-temp/* /home/ubuntu/apps/summarizer-ai/staging/
elif [[ "$BRANCH" == "ProdDeploymentGroup" ]]; then
  sudo rm -rf /home/ubuntu/apps/summarizer-ai/production/*
  sudo cp -r /home/ubuntu/apps/summarizer-ai/deploy-temp/* /home/ubuntu/apps/summarizer-ai/production/
fi

# Clean up the temporary directory
sudo rm -rf /home/ubuntu/apps/summarizer-ai/deploy-temp