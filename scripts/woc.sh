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
# too slow / not used
while read -r line; do
    i=$(echo "$line" |
        cut -d, -f1);
    n=$(echo "$line" |
        cut -d, -f2 |
        ~/lookup/getValues -f p2P |
        cut -d\; -f2 |
        ~/lookup/getValues -f P2c |
        wc -l);
    echo "$i,$n";
done <data/projects.csv > data/i2n.csv;

# second approach
awk '{print NR-1","$0}' <data/githublinks.csv |
rev |
cut -d, -f1,2 --complement | 
rev | 
awk -F, '{if ($2 != "") print}' |
sed 's| ||g;s|"||g' |
awk -F, '{for (i=2; i<=NF; i++) print $i","$1}' |
sed 's|^.*github\.com/||' |
awk -F, '{print $2";"$1}' |
awk -F/ '{print $1"_"$2}' |
sort |
uniq >data/projects.p;
# p2P
cut -d\; -f2 <data/projects.p | 
sort |
uniq |
~/lookup/getValues -f p2P \
>data/p2P.p;
# p2iP
LC_ALL=C LANG=C join -t\; -1 2 -2 1 \
    <(~/lookup/lsort 10G -t\; -k2,2 <data/projects.p) \
    <(~/lookup/lsort 10G -t\; -k1,1 <data/p2P.p) \
>data/p2iP.p;
# P2c
cut -d\; -f3 <data/p2iP.p |
sort |
uniq |
~/lookup/getValues -f P2c \
>data/P2c.p;
# P2n
cut -d\; -f1 <data/P2c.p |
~/lookup/lsort 50G |
uniq -c |
awk '{print $2";"$1}' \
>data/P2n.p;
# i2c
LC_ALL=C LANG=C join -t\; -1 2 -2 1 -o 1.1,2.2 \
    <(cut -d\; -f2-3 <datasets/p2iP.p | 
        ~/lookup/lsort 50G -t\; -k2,2 |
        uniq) \
    <(~/lookup/lsort 50G -t\; -k1,1 <datasets/P2c.p)  \
>datasets/i2c.p;
~/lookup/lsort 100G <datasets/i2c.p |
uniq |
~/lookup/lsort 100G -t\; -k1,1 \
>datasets/i2c.s;
# i2se
cut -d, -f2,5,6 <datasets/githublinksanddatesV2.csv |
~/lookup/lsort 20G -t, -k1,1 |
uniq |
sed 's|,|;|g' \
>datasets/i2se.s;
# i2sec
LC_ALL=C LANG=C join -t\; \
    datasets/i2se.s \
    datasets/i2c.s \
>datasets/i2sec.s;
~/lookup/lsort 100G -t\; -k4,4 <datasets/i2sec.s \
>datasets/i2sec.cs;    

