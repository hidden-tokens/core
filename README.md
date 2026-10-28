# hidden-tokens/core

The shared open-core for every Hidden Tokens effort: the tooling that the
standards in [`hidden-tokens/.github`](https://github.com/hidden-tokens/.github)
assume but don't ship. Anything a maintainer has to set up twice belongs here once.

| Directory | What lives here |
|---|---|
| `editors/` | Editor configs (editorconfig, formatting, LSP profiles) applied across org work |
| `dev-env/` | Dev-environment bootstrapping — make a new machine repo-ready in one command |
| `agents/` | Agent setups: profiles, operational interfaces, governance |
| `brain/` | 2nd-brain setups: vault structures, transfer tools, sync conventions |

## Conventions

- Every change goes through a pull request. CI checks are the contract, not decoration.
- Shared workflow callers live in `.github/workflows/` and point at
  `hidden-tokens/.github/...@main` — the org's stable reference.

## Bootstrapping a dev environment

```bash
git clone git@github.com:hidden-tokens/core.git ~/hidden-tokens/core
bash ~/hidden-tokens/core/dev-env/bootstrap.sh
```

The script is idempotent: fresh machines and in-progress machines converge to the same state.

## Pilot note

This repository hosts the proof fixture for the shared reusable workflows
(P2.2/P2.3 acceptance in the standards repo's `TODO.md`): its layout — shell
scripts, config files, markdown — is representative of org reality. The
`security.yml` caller demonstrates the first verified integration.
