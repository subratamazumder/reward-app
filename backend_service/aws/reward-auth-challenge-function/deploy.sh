export STACK_NAME=reward-auth-challenge-function-stack
if [ $# -eq 0 ]
  then
    echo "No parameter supplied"
    sam build && sam validate --profile devtest && sam package --output-template packaged.yaml --s3-bucket dev-test-sam-cli --profile devtest && sam deploy --template-file packaged.yaml --capabilities CAPABILITY_IAM --stack-name $STACK_NAME --profile devtest && aws cloudformation describe-stacks --stack-name $STACK_NAME --profile devtest
fi
if [ $# -eq 1 ]
  then
    export PARAMS=$1
    echo "parameter supplied-$PARAMS"
    sam build && sam validate --profile devtest && sam package --output-template packaged.yaml --s3-bucket dev-test-sam-cli --profile devtest && sam deploy --template-file packaged.yaml --capabilities CAPABILITY_IAM --stack-name $STACK_NAME --parameter-overrides $PARAMS --profile devtest && aws cloudformation describe-stacks --stack-name $STACK_NAME --profile devtest
fi

echo "Committing with message as- "$COMMIT_MESSAGE

