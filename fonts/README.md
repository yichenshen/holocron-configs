# Fonts

Font configurations here if for:

  - Setting Chinese fonts properly
  - Installing all of Google fonts

## Chinese Fonts

---

1. Install the Noto Sans CJK fonts.
  - https://www.google.com/get/noto/help/cjk/ OR
  - https://github.com/googlei18n/noto-cjk OR
  - Install all fonts, see [below](#google-fonts)
2. Copy `10-chinese-font.conf` to:
  - `/etc/fonts/conf.d/` for global setting OR
  - `~/.config/fontconfig/fonts.conf` for local setting

## Google fonts

---

Run `clone-fonts.sh`. This will clone all [Google fonts](https://github.com/google/fonts), plus [Noto Sans CJK](https://github.com/googlei18n/noto-cjk) into `~/fonts`.

Fonts will then be availible locally. To update fonts, `cd` into the corresponding folder and run `git pull` and then `fc-cache -fv`. You'll need to log out and log back in afterwards.
