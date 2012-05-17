#!/bin/sh

echo "- Updating all vim modules -"
echo "----------------------------"
git submodule foreach git pull origin master
echo "----------------------------"
echo "- Finished update ----------"
