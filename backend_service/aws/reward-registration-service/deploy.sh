export STACK_NAME=reward-registration-service-stack
sam build && sam validate --profile devtest && sam package --output-template packaged.yaml --s3-bucket dev-test-sam-cli --profile devtest && sam deploy --template-file packaged.yaml --capabilities CAPABILITY_IAM --stack-name $STACK_NAME --profile devtest && aws cloudformation describe-stacks --stack-name $STACK_NAME --profile devtest
