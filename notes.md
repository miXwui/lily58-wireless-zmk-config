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
- UC_SET_LINUX / UC_SET_MACOS / UC_SET_WIN_COMPOSE on L/M/W keys
- Ghostty: unicode input requires IBus/Fcitx running (GTK input method)

## ZMK

- Zephyr 4.1 HWMv2: board names changed from `nice_nano_v2` to `nice_nano//zmk`
- Deep sleep regression #3207 fixed via `v4.1.0+zmk-fixes` branch
- Trimmed west manifest: only cmsis, hal_nordic, mbedtls, tinycrypt + lvgl (from zmk import)
- `Zephyr_DIR` export needed in devenv for cmake to find Zephyr

### Bluetooth troubleshooting

- `CONFIG_BT_CTLR_PHY_2M=n`: disables 2Mbps PHY for wider adapter compatibility (our fix)
- Source: https://github.com/zmkfirmware/zmk/issues/1487
- v0.3.0 enforces stricter Bluetooth protocols; disabling 2M PHY helps older devices: https://github.com/zmkfirmware/zmk/issues/3158#issuecomment-3688452642
- Nice!nano power-on: 2 quick blinks (Adafruit bootloader, before ZMK starts)
- LED module polls BLE connection every 200ms for up to 5s on peripheral boot
- Vendored zmk-poor-mans-led-indicator locally to patch boot delay and avoid west-update dependency

## Dev

- `devenv shell` to enter environment, then `build-both` for firmware
- `west-setup` to init workspace (run once, or when `west.yml` changes)
- `west update --fetch-opt=--filter=tree:0` for faster clones
- `build-both-debug` for USB logging (requires zephyr_udc0 in overlay)
- `sudo tio /dev/ttyACM0` to view serial logs
