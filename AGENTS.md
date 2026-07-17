# Lily58 ZMK Config

Personal ZMK configuration for a Lily58 split keyboard with nice!nano v2.0 controllers.

## Build commands

- `build-both`: build left and right firmware (no logging)
- `build-both-debug`: build with USB logging via zmk-usb-logging snippet
- `west-setup`: initialize west workspace (run once after cloning)
- `west-update`: sync modules when west.yml changes
- `clean-build`: remove build directories

## Key files

- `config/lily58.conf`: main config (power, Bluetooth, LED, debouncing)
- `config/lily58.keymap`: keymap with Unicode, mod-morphs, combos
- `config/lily58.overlay`: devicetree overlay (indicator-led alias, zephyr_udc0)
- `config/west.yml`: ZMK manifest (pinned ZMK, urob/zmk-unicode)
- `devenv.nix`: Nix dev environment with build scripts

## Vendored modules

- `vendor/zmk-poor-mans-led-indicator`: LED status indicator for BT operations
  - Source: https://github.com/BlueDrink9/zmk-poor-mans-led-indicator
  - Vendored locally to replace fixed boot delay with polling-based detection for immediate power off/on cycles
  - Avoids west-update dependency
  - Polls BLE connection every 200ms for up to 5s on peripheral boot

## Bluetooth

- `CONFIG_BT_CTLR_PHY_2M=n`: disables 2M PHY for compatibility/stability at a slight latency and power cost
- `CONFIG_ZMK_BLE_PASSKEY_ENTRY=n`: explicitly disabled (EXPERIMENTAL_FEATURES would imply this)
- Pin: ZMK pinned to 904c9aec (Zephyr 4.1 + HWMv2)

## LED behavior

See `config/lily58.conf` for detailed documentation on LED blink patterns.

- nice!nano power-on: 2 quick blinks (Adafruit bootloader, before ZMK)
- Battery on boot: 2/4/6 blinks for high/low/critical (more blinks = more urgency)
- BLE on peripheral: polls connection, shows 1 long blink when connected

## Troubleshooting

- The blue LEDs should blink when plugged into USB, along with the steady orange charging LED
- Use `sudo tio /dev/ttyACM0` to view USB logs (requires debug build)
