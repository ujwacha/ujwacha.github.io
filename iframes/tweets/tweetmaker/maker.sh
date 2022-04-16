#!/bin/bash

name="$(echo | dmenu -p "HTML name :" | tr ' ' '-').html"

echo | dmenu  > temphead ;

echo "type your tweet in the next vim buffer" ;


vim temptwt

opt="$(printf "no\nyes" | dmenu -p 'do you want to add a pic')"

if [ $opt == "yes" ]
   then
   img="$(ls ../img | dmenu -l 10 -p 'select the image')"
   linetoadd="<img src=\"img/$img\" width=\"60%\">"
fi


echo $linetoadd | cat ./resources/first ./temphead ./resources/second ./temptwt ./resources/third - ./resources/fourth > ../$name

rm temphead temptwt
