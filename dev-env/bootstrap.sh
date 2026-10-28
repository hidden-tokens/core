#!/usr/bin/env bash
# hidden-tokens/core — dev-environment bootstrap.
#
# Idempotent: fresh and already-set-up machines converge to the same state.
# Nothing here requires root; every external install URL is printed before use.
set -Eeuo pipefail

os="$(uname -s)"

say() { printf '\n[%s] %s\n' "${1:-ok}" "${2:-}"; }

# --- git -------------------------------------------------------------------
command -v git >/dev/null || { say fail "git is required, install it first"; exit 1; }

# --- rust + cargo (product: Rust / Tauri) ------------------------------------
if ! command -v cargo >/dev/null; then
  say install "rustup (https://sh.rustup.rs)"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable
  # shellcheck disable=SC1091
  . "$HOME/.cargo/env"
fi
say ok "rust: $(cargo --version)"

# --- bun (docs/site/tooling layer) -------------------------------------------
if ! command -v bun >/dev/null; then
  say install "bun (https://bun.sh/install)"
  curl -fsSL https://bun.sh/install | bash
fi
say ok "bun: $(bun --version)"

# --- tauri prerequisites (advice only — distro-specific, may need sudo) ------
if [ "$os" = "Linux" ]; then
  say info "Tauri on Linux needs webkit2gtk + rsvg deps; per-distro commands live in dev-env/tauri-linux.md"
  if ! command -v apt >/dev/null && ! command -v pacman >/dev/null && ! command -v dnf >/dev/null; then
    say warn "No apt/pacman/dnf detected — review dev-env/tauri-linux.md manually"
  fi
fi

say done "core dev environment ready"
