{ pkgs, ... }:
{
  packages = with pkgs; [
    python3Packages.west
    python3Packages.pyelftools
    cmake
    ninja
    dtc
    gcc-arm-embedded
    glib
    libusb1
    pkg-config
    zlib

    # Debugging
    tio
  ];

  env = {
    ZEPHYR_TOOLCHAIN_VARIANT = "gnuarmemb";
    GNUARMEMB_TOOLCHAIN_PATH = "${pkgs.gcc-arm-embedded}";
  };

  enterShell = ''
    export ZEPHYR_BASE="$PWD/zephyr"
    export Zephyr_DIR="$PWD/zephyr/share/zephyr-package/cmake"
    echo "ZMK dev environment"
    echo "  Commands: west-setup, west-update, build-left, build-right, build-both, clean-build"
    echo "  Debug:    build-left-debug, build-right-debug, build-both-debug (USB logging)"
    echo "  Serial:   sudo tio /dev/ttyACM0 (USB logs, exit with Ctrl+T + Q)"
    echo "  Vendored modules: vendor/zmk-poor-mans-led-indicator (source: https://github.com/BlueDrink9/zmk-poor-mans-led-indicator)"
  '';

  scripts.build-left = {
    exec = ''
      west build -s zmk/app/ -d build/left -b "nice_nano//zmk" -- -DZMK_CONFIG=$(pwd)/config -DZMK_EXTRA_MODULES=$(pwd)/vendor/zmk-poor-mans-led-indicator -DSHIELD="lily58_left"
      cp build/left/zephyr/zmk.uf2 build/lily58_left-nice_nano-zmk.uf2
      echo "Copied to build/lily58_left-nice_nano-zmk.uf2"
    '';
    description = "Build left side firmware";
  };

  scripts.build-right = {
    exec = ''
      west build -s zmk/app/ -d build/right -b "nice_nano//zmk" -- -DZMK_CONFIG=$(pwd)/config -DZMK_EXTRA_MODULES=$(pwd)/vendor/zmk-poor-mans-led-indicator -DSHIELD="lily58_right"
      cp build/right/zephyr/zmk.uf2 build/lily58_right-nice_nano-zmk.uf2
      echo "Copied to build/lily58_right-nice_nano-zmk.uf2"
    '';
    description = "Build right side firmware";
  };

  scripts.build-both = {
    exec = ''
      build-left && build-right &&
      echo "
      Output:
      build/lily58_left-nice_nano-zmk.uf2
      build/lily58_right-nice_nano-zmk.uf2"
    '';
    description = "Build both sides";
  };

  scripts.build-left-debug = {
    exec = ''
      west build -s zmk/app/ -d build/left -b "nice_nano//zmk" -S zmk-usb-logging -- -DZMK_CONFIG=$(pwd)/config -DZMK_EXTRA_MODULES=$(pwd)/vendor/zmk-poor-mans-led-indicator -DSHIELD="lily58_left"
      cp build/left/zephyr/zmk.uf2 build/lily58_left-nice_nano-zmk.uf2
      echo "Copied to build/lily58_left-nice_nano-zmk.uf2"
    '';
    description = "Build left side firmware with USB logging";
  };

  scripts.build-right-debug = {
    exec = ''
      west build -s zmk/app/ -d build/right -b "nice_nano//zmk" -S zmk-usb-logging -- -DZMK_CONFIG=$(pwd)/config -DZMK_EXTRA_MODULES=$(pwd)/vendor/zmk-poor-mans-led-indicator -DSHIELD="lily58_right"
      cp build/right/zephyr/zmk.uf2 build/lily58_right-nice_nano-zmk.uf2
      echo "Copied to build/lily58_right-nice_nano-zmk.uf2"
    '';
    description = "Build right side firmware with USB logging";
  };

  scripts.build-both-debug = {
    exec = ''
      build-left-debug && build-right-debug &&
      echo "
      Output (debug):
      build/lily58_left-nice_nano-zmk.uf2
      build/lily58_right-nice_nano-zmk.uf2"
    '';
    description = "Build both sides with USB logging";
  };

  scripts.clean-build = {
    exec = ''
      rm -rf build/left build/right
    '';
    description = "Clean build directories";
  };

  scripts.west-update = {
    exec = ''
      west update --fetch-opt=--filter=tree:0
    '';
    description = "Sync modules to west.yml";
  };

  scripts.west-setup = {
    exec = ''
      unset ZEPHYR_BASE
      west init -l config
      west config update.fetch smart
      # https://github.com/zephyrproject-rtos/west/issues/319#issuecomment-1482043641
      west update --fetch-opt=--filter=tree:0
      export ZEPHYR_BASE="$PWD/zephyr"
    '';
    description = "Initialize or re-initialize west workspace";
  };
}
