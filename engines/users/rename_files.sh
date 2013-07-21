#!/bin/bash

for file in $(find . -name "*engine_template*")
do
  mv $file `echo $file | sed s/engine_template/$1/`
done