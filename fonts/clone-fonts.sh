#!/bin/bash

git clone https://github.com/google/fonts ~/.fonts/google-fonts

wget https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJK.ttc.zip
mkdir -p ~/.fonts/NotoSansCJK
unzip NotoSansCJK.ttc.zip -d ~/.fonts/NotoSansCJK
rm -f NotoSansCJK.ttc.zip

wget https://noto-website.storage.googleapis.com/pkgs/NotoSerifCJK.ttc.zip
mkdir -p ~/.fonts/NotoSerifCJK
unzip NotoSerifCJK.ttc.zip -d ~/.fonts/NotoSerifCJK
rm -f NotoSerifCJK.ttc.zip

fc-cache -fv
