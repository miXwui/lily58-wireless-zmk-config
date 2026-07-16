# TODO

- Nice looking Nice!View font

```text
CONFIG_ZMK_DISPLAY_STATUS_SCREEN_BUILT_IN=y
CONFIG_ZMK_LV_FONT_DEFAULT_SMALL_MONTSERRAT_26=y
CONFIG_LV_FONT_DEFAULT_MONTSERRAT_26=y
```

<https://discord.com/channels/924164891990978570/924171485948543057/1289664478543089686>

[Keyboard layouts doc (3rd edition)](https://docs.google.com/document/d/1W0jhfqJI2ueJ2FNseR4YAFpNfsUM-_FlREHbpNGmC2o/edit?tab=t.dg66iecr8la0)

[Chair/desk arm mount, etc.](https://discord.com/channels/924164891990978570/924171485948543057/1384240721405415574)

[KLP Lamé keycaps](https://discord.com/channels/924164891990978570/924171485948543057/1385304827357040841)

## Prevent RSI

- [ ] Get rid of all chords. (Existing double-shift capslock combo is rarely
      used and probably unlikely an RSI concern.)
- [x] Comfortable thumb modifiers/keys that are on the outside of the palm, not
      inside/under in conjunction with IJKL arrow cluster that led to pain.
  - [x] Single tap -> hold for nav layer.
  - [x] Double tap -> hold for mouse layer.
- [x] Make right outer key `Enter`.

- [x] Swap `-` and `=` keys.

- [ ] Put `Alt` or `Cmd` key on right side?

- [x] Move `Mod` key to right.

- [ ] Make the left outer key an index hold key to symbols?

I think thumb modifier holds on opposite hands works. ~~Never use the same hand
with thumb to hold a modifier button and press other keys for an extended period
of time.~~ Well, I moved the right arrow nav modifier to the farthest left
(large) key on the Lily58 and it's substantially more comfy, so we'll see.

## Unicode input

- [ ] Replace macro-based Unicode with `urob/zmk-unicode` module
- [ ] Add `#define` aliases for all Unicode characters
- [ ] Add mod-morphs: en/em dash, smart single/double quotes
- [ ] Remove em dash from Lower layer (position 23)
- [ ] Fix `DEG` position (was on S, should be on D)
- [ ] Add é, ñ, ¡, •, … to Unicode layer

## ZMK/firmware

- [ ] Update ZMK to latest main with Zephyr 4.1/HWMv2
- [ ] Update board names: `nice_nano_v2` → `nice_nano//zmk`
- [ ] Change double shift to caps lock with accidental-trigger guard

## Dev environment

- [ ] Set up `devenv` with build scripts
- [ ] Add `.gitignore` and `.ignore` for `.devenv/` and `build/`

## Display features (when OLED installed)

- [ ] Show active BT profile/device name on screen
- [ ] Show current Unicode OS mode (Linux/Mac/Windows) on screen
