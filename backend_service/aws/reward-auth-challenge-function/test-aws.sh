export FUNCTION_NAME=reward-auth-challenge-function
if [ $# -eq 0 ]
  then
    export MOBILE_NUMBER="9051675060"
    echo "No mobile supplied, setting default"
fi
if [ $# -eq 1 ]
  then
    export MOBILE_NUMBER=$1
fi

echo "Invoking lambda with - "$MOBILE_NUMBER
aws lambda invoke --function-name $FUNCTION_NAME out --payload '{ "mobileNumber": "'"$MOBILE_NUMBER"'" }' --log-type Tail --profile devtest --query 'LogResult' --output text |  base64 -D