# Fonts

Font configurations here if for:

  - Setting Chinese fonts properly
  - Installing all of Google fonts

## Chinese Fonts

1. Install the Noto Sans CJK fonts.
  - https://github.com/googlei18n/noto-cjk (repo history is HUGE) OR
  - https://www.google.com/get/noto/help/cjk/ OR
  - Install all fonts, see [below](#google-fonts)
2. Copy `10-chinese-font.conf` to:
  - `/etc/fonts/conf.d/` for global setting OR
  - `~/.config/fontconfig/fonts.conf` for local setting

## Google fonts

Run `clone-fonts.sh`. This will clone all [Google fonts](https://github.com/google/fonts), as well as download Noto Sans CJK (all on one OTC) into `~/fonts`.

Fonts will then be availible locally. You can update google fonts by going to the directory and execute `git clone`, and then `fc-cache -fv`. Log out and log back in afterwards.
