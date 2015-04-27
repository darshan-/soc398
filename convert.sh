#!/bin/bash

rr code/analyze.R | awk -e '{print $1 "," $2 "," $NF}' | code/convert.rb
