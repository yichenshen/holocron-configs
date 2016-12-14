#!/bin/bash

git clone https://github.com/google/fonts ~/.fonts/google-fonts

wget https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJK.ttc.zip

mkdir -p ~/.font/NotoSansCJK

unzip NotoSansCJK.ttc.zip -d ~/.font/NotoSansCJK

rm -f NotoSansCJK.ttc.zip

fc-cache -fv
