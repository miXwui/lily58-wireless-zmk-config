# Notes

## Keyboards

- https://www.moergo.com/
- https://github.com/dschil138/Fulcrum

## Health

- https://my.clevelandclinic.org/health/body/21889-median-nerve
- https://getreuer.info/posts/keyboards/thumb-ergo/index.html#on-smaller-keyboards
- https://www.reddit.com/r/ErgoMechKeyboards/comments/y17q81/corne_huge_pain_in_the_shoulder_thumbs_and_wrists/

### Tenting

- https://rmwphd.github.io/tenting

## Miscellaneous

- https://getreuer.info/posts/keyboards/achordion/index.html

## To writeup

- Minimizing chording. Avoid pressing multiple keys together with fingers from the same hand to prevent unnecessary strain and RSI.
- Posture, tenting

## Unicode

- External module for Unicode input: https://github.com/urob/zmk-unicode
- ZMK native tracking: https://github.com/zmkfirmware/zmk/issues/232
- Use `#define` aliases in keymap for readable unicode references
- Mod-morph with `&uc` for shifted variants (en/em dash, smart quotes)

## ZMK

- Zephyr 4.1 HWMv2: board names changed from `nice_nano_v2` to `nice_nano//zmk`
- Deep sleep regression #3207 fixed via `v4.1.0+zmk-fixes` branch

## Dev

- `devenv shell` to enter environment, then `build-both` for firmware
- `west update` only needed when `west.yml` changes
