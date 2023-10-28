#!/bin/bash

rm -rf public_html/*
echo "<html><body>" > public_html/index.html
echo "Choose number:<br/>" > public_html/index.html
k=0
for i in $(seq 1 100); do
    file="$i.html"
    echo "<a href=\"$file\">number $i</a>" >> "public_html/index.html"
    touch "public_html/$file"
    k=$((k+1))
    if [ $k -eq 10 ]; then
	echo "<br/>" >> "public_html/index.html"
	k=0
    fi
done

randNum=$(( RANDOM % 100 + 1 ))
echo "win number $randNum"

for i in $(seq 1 100); do
    if [ $i -lt $randNum ]; then
        echo "$i is smaller than X<br/>" > "public_html/$i.html"
	echo "Choose number:<br/>" >> "public_html/$i.html"
    elif [ $i -gt $randNum ]; then
        echo "$i is bigger than X<br/>" > "public_html/$i.html"
	echo "Choose number:<br/>" >> "public_html/$i.html"
    else
	echo "X = $i<br/>You win<br/>" > "public_html/$i.html"
    fi
    k=0
    for j in $(seq 1 100); do
        if [ "$j" -ne "$i" ]; then
	   if [ $i -ne $randNum ]; then
            	echo "<a href=\"$j.html\"> $j</a>" >> "public_html/$i.html"

           fi
	fi
	k=$((k+1))
        if [ $k -eq 10 ]; then
                echo "<br/>" >> "public_html/$i.html"
                k=0
        fi
    done
done

echo "</body></html>" >> public_html/index.html
