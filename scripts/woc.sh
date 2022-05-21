#!/usr/bin/bash

# data cleansing
awk '{print NR-1","$0}' <data/githublinks.csv |
rev |
cut -d, -f1,2 --complement | 
rev | 
awk -F, '{if ($2 != "") print}' |
sed 's| ||g;s|"||g' |
awk -F, '{for (i=2; i<=NF; i++) print $i","$1}' |
sed 's|^.*github\.com/||' |
awk -F, '{print $2","$1}' |
awk -F/ '{print $1"_"$2}' >data/projects.csv;

