#!/bin/sh

awk '{print $1}' input | sort > list1.tmp
awk '{print $2}' input | sort > list2.tmp
paste list1.tmp list2.tmp | awk '{print $2-$1}' | awk '{if ($1>0) { print $1 } else {print -$1} }' | awk '{s+=$1} END {print s}'
rm list1.tmp
rm list2.tmp


