#!/bin/sh

echo "- Updating all vim modules -"
echo "----------------------------"
cd "$( cd "$( dirname "$0" )" && pwd )"
git submodule foreach git pull origin master
echo "----------------------------"
echo "- Finished update ----------"
