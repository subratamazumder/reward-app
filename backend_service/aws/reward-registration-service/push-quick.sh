  
if [ $# -eq 0 ]
  then
    echo "No commit message supplied, setting default"
    export COMMIT_MESSAGE="minor update"
fi
if [ $# -eq 1 ]
  then
    export COMMIT_MESSAGE=$1
fi

echo "Committing with message as- "$COMMIT_MESSAGE
git pull
git add .
git commit -m "$COMMIT_MESSAGE" .
git push
