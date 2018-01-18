#!/bin/bash
echo "First arg : $1"
echo "Second arg: $2"
argvar1="$1"
argvar2="$2"
echo "argvar1 : hello/hello2/$argvar1"
echo "argvar2 : $argvar2"

echo "$argvar1"
echo $argvar2

count=100
if [ $count -eq 100 ]; then
  echo "Count is 100"
else
  echo "Count is not 100"
fi
cd ~/Dev
if [ $? -ne 0 ]; then
  echo "cd command error"
  exit 1
else
  echo "cd command ok"
  exit 0
fi

