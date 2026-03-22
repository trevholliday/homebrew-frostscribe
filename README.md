# homebrew-frostscribe

Homebrew tap for [Frostscribe](https://github.com/trevholliday/frostscribe) — a native macOS disc ripping and encoding tool for Jellyfin, Plex, and Kodi.

## Install

```bash
brew tap trevholliday/frostscribe
brew install frostscribe
```

## What gets installed

- `frostscribe` — interactive CLI for ripping discs
- `frostscribe-worker` — launchd encode worker daemon

## After install

```bash
frostscribe init          # run the setup wizard
frostscribe worker start  # install and start the encode worker
frostscribe rip           # rip your first disc
```

MakeMKV is required and must be downloaded separately from https://www.makemkv.com
