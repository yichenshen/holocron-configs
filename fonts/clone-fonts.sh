#!/bin/bash

git clone --depth 1 https://github.com/google/fonts ~/.fonts/google-fonts
git clone --depth 1 https://github.com/googlei18n/noto-cjk.git ~/.fonts/NotoCJK

fc-cache -fv
