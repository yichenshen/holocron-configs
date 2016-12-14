#!/bin/bash

git clone https://github.com/google/fonts ~/.fonts/google-fonts

git clone https://github.com/googlei18n/noto-cjk.git ~/.fonts/noto-cjk

fc-cache -fv
