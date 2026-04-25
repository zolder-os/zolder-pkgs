# zolder-os/zolder-pkgs

Public pacman repository for [ZolderOS](https://github.com/zolder-os/zolder). The source repo is private; signed package artifacts and the install script are served from this repo via GitHub Pages.

## Install

```bash
curl -fsSL https://zolder-os.github.io/zolder-pkgs/install.sh | sh -s -- --channel edge
sudo pacman -Sy zolder-hello
```

The signing key fingerprint is `B9D3 6BB5 A0BA 438D 164D  C4F1 CF31 A79F 22F7 D6BB`. Verify before adding to `pacman-key`. See [SECURITY.md](https://github.com/zolder-os/zolder/blob/main/SECURITY.md) on the source repo.

## Channels

- `edge/x86_64/` — nightly auto-bumps, fail-tolerant.
- `stable/x86_64/` — manual cuts, "I'd point a non-technical friend at this" bar.

## Layout

```
keys/release.asc          public signing key
install.sh                bootstrap script (curl-pipe friendly)
edge/x86_64/              edge channel pacman repo
stable/x86_64/            stable channel pacman repo
```

This branch (`gh-pages`) is the publication target of `release.yml` over in `zolder-os/zolder`. Don't push by hand.
