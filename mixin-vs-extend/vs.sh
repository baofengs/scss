#!/bin/bash

scss -f ./mixin.scss mixin.css
scss -f ./extend.scss extend.css

cp ./mixin.css mixin.unzip.css
cp ./extend.css extend.unzip.css

gzip -f ./mixin.css
gzip -f ./extend.css

echo '====== mixin ======'
du -h ./mixin.scss
du -h ./mixin.unzip.css
du -h ./mixin.css.gz

echo '====== extend ======'
du -h ./extend.scss
du -h ./extend.unzip.css
du -h ./extend.css.gz

rm -rf .sass-cache
rm *.gz
rm *.map
