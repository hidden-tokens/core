# hidden-tokens/core

The shared open-core for every Hidden Tokens effort. It holds the tooling the
standards in [`hidden-tokens/.github`](https://github.com/hidden-tokens/.github)
assume but don't ship. Anything a maintainer would have to set up twice lives
here once.

| Directory | What lives here |
|---|---|
| `editors/` | Editor configs (editorconfig, formatting, LSP profiles) applied across org work |
| `dev-env/` | Dev-environment notes, per-distro Tauri prerequisites |
| `agents/` | Agent setups: profiles, operational interfaces, governance |
| `brain/` | 2nd-brain setups: vault structures, transfer tools, sync conventions |

## Conventions

- Every change goes through a pull request. CI checks are the contract, not decoration.
- Shared workflow callers live in `.github/workflows/` and point at
  `hidden-tokens/.github/...@main`, the org's stable reference.

## Setting up a machine

For agents, one line does it:

```bash
curl -fsSL https://raw.githubusercontent.com/hidden-tokens/core/main/setup.sh | bash
```

The script is idempotent, needs no root, and prints every URL it touches
before using it. For humans who prefer to read first: clone the repo, skim
`setup.sh`, then run `bash setup.sh` from inside.

## Pilot note

This repository hosts the proof fixture for the shared reusable workflows: its
layout of shell scripts, config files, and markdown is representative of org
reality. The `security.yml` caller demonstrates the first verified
integration (secret scan green on every push and PR).
