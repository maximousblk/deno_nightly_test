#!/bin/sh

set -e

if [ "$(uname -m)" != "x86_64" ]; then
  echo "Error: Unsupported architecture $(uname -m). Only x64 binaries are available." 1>&2
  exit 1
fi

if ! command -v unzip >/dev/null; then
  echo "Error: unzip is required to install Deno (Nightly) (see: 'https://deno.land/x/nightly#unzip-is-required')." 1>&2
  exit 1
fi

if [ "$OS" = "Windows_NT" ]; then
  target="x86_64-pc-windows-msvc"
else
  case $(uname -s) in
  Darwin) target="x86_64-apple-darwin" ;;
  *) target="x86_64-unknown-linux-gnu" ;;
  esac
fi

if [ $# -eq 0 ]; then
  deno_uri="https://github.com/maximousblk/nightly/releases/latest/download/deno-${target}.zip"
else
  deno_uri="https://github.com/maximousblk/nightly/releases/download/${1}/deno-${target}.zip"
fi

deno_install="${DENO_INSTALL:-$HOME/.deno}"
bin_dir="$deno_install/bin"
exe="$bin_dir/deno"

if [ ! -d "$bin_dir" ]; then
  mkdir -p "$bin_dir"
fi

curl --fail --location --progress-bar --output "$exe.zip" "$deno_uri"
unzip -d "$bin_dir" -o "$exe.zip"
chmod +x "$exe"
rm "$exe.zip"

echo "Deno (Nightly) was installed successfully to $bin_dir/deno"
if command -v deno >/dev/null; then
  echo "Run 'deno --help' to get started"
else
  case $SHELL in
  /bin/zsh) shell_profile=".zshrc" ;;
  *) shell_profile=".bash_profile" ;;
  esac
  echo "Manually add the directory to your \$HOME/$shell_profile (or similar)"
  echo "  export DENO_INSTALL=\"$deno_install\""
  echo "  export PATH=\"\$DENO_INSTALL/bin:\$PATH\""
  echo "Run '$exe --help' to get started"
fi
