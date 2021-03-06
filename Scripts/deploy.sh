#!/usr/bin/env bash

docker --version
sudo pip install --upgrade pip
pip install --user awscli
export PATH=$PATH:$HOME/.local/bin
eval $(aws ecr get-login --no-include-email --region $AWS_DEFAULT_REGION)
docker build -t $APP_NAME .
docker tag $APP_NAME:latest $AWS_ECR_ACCOUNT.dkr.ecr.us-west-2.amazonaws.com/$APP_NAME:latest
docker push $AWS_ECR_ACCOUNT.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$APP_NAME:latest
aws ecs update-service --cluster $AWS_ECS_CLUSTER --service $AWS_ECS_SERVICE --force-new-deployment
