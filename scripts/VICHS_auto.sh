#!/bin/bash

# Sciezka to miejsce, w którym znajduje się skrypt
sciezka=$(dirname "$0")

cd $sciezka/..

if [ "$CI" = "true" ] ; then
    ost_plik=$(git log --since="1 week ago" --name-only --pretty=format: | sort | uniq)
else
    ost_plik=$(git diff -z --name-only | xargs -0)
fi


if [[ "$ost_plik" == *"polish_rss_filters"* ]]; then
    if [[ "$lista" != *" polish_rss_filters.txt"* ]] ;then
        lista+=" "polish_rss_filters.txt
    fi
fi

if [ "$lista" ] ; then
    $sciezka/VICHS.sh $lista
fi
