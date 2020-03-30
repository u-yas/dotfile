#!/bin/sh

cat code --list-extensions | while read line
do
  code --install-extension $line
done
