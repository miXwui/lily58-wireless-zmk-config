# Lily58

These are my configuration and notes for my Lily58 bought from https://typeractive.xyz/ (highly recommended!)

![Lily58 Kailh Choc with a Framework 13](images/typeractive-lily-58-with-framework-13-min.jpg)

## Setup

### Build locally

Install ZMK toolchain:
https://zmk.dev/docs/development/setup

Build the config from the ZMK folder (make sure to clean the `build/` folder before each build):

Left side:

```sh
west build -s app/ -d build/ -b "nice_nano_v2"  -- -DZMK_CONFIG=/home/mwu/Documents/git-repos/lily58-wireless-zmk-config/config/ -DSHIELD="lily58_left"
cp build/zephyr/zmk.uf2 ../lily58-wireless-zmk-config/build/lily58_left-nice_nano_v2-zmk.uf2
```

Right side:

```sh
west build -s app/ -d build/ -b "nice_nano_v2"  -- -DZMK_CONFIG=/home/mwu/Documents/git-repos/lily58-wireless-zmk-config/config/ -DSHIELD="lily58_right"
cp build/zephyr/zmk.uf2 ../lily58-wireless-zmk-config/build/lily58_right-nice_nano_v2-zmk.uf2
```

### Update keyboard sides

1. For each side, connect via USB and copy the respective `.uf2` file.
2. It will then update/restart and disconnect from USB with an "Error while copying" (false error).

Note: sometimes Nautilus won't allow writing apparently after reconnecting or connecting the other side after, I think because it wasn't properly ejected. So just eject and reconnect, and writing will work again.

```
