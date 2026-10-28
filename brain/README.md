# brain/

2nd-brain setups for Hidden Tokens work: vault structures, transfer formats,
sync conventions. The repo carries the *shape*, backups stay wherever the
vault of record lives.

Golden rules encoded elsewhere in this repo:
- Vault backups are git auto-commit + push (see the sync conventions file when it appears).
- Application data never lives inside a secrets store.
