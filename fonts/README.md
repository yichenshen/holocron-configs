# Fonts

Font configurations here if for:

  - Setting Chinese fonts properly
  - Installing all of Google fonts

## Chinese Fonts

1. Install the Noto CJK fonts (both Sans and Serif).
  - https://github.com/googlei18n/noto-cjk (repo history is HUGE) OR
  - https://www.google.com/get/noto/help/cjk/ OR
  - Install all fonts, see [below](#google-fonts)
2. Copy `58-noto-cjk-sc.conf` to:
  - `~/.config/fontconfig/fonts.conf` for local setting OR
  - For global setting
    1. Copy it to `/usr/share/fontconfig/conf.avail`
    2. Symlink it to `/etc/fonts/conf.d/` with `ln -s /usr/share/fontconfig/conf.avail/58-noto-cjk-sc.conf /etc/fonts/conf.d`

> The rule here with the numbering is to place it right after the first fallback font.

## Google fonts

Run `clone-fonts.sh`. This will clone all [Google fonts](https://github.com/google/fonts), as well as download Noto Sans CJK and Noto Serif CJK (within two OTC files) into `~/fonts`.

Fonts will then be availible locally. You can update google fonts by going to the directory and execute `git clone`, and then `fc-cache -fv`. Log out and log back in afterwards.

## Nerd fonts

Copy `Roboto_Medium_Nerd_Font` to `~/.fonts`: `cp -r Roboto_Medium_Nerd_Font ~/.fonts`
