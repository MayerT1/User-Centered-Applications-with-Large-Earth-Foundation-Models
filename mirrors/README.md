# Mirrors

Each subdirectory here is a **git submodule** pointing at an attendee's own
repo (added via `scripts/add_mirror.sh`). They are live pointers, not copies —
cloning this repo with `--recurse-submodules` pulls in every mirrored repo at
whatever commit was last synced.

```
git clone --recurse-submodules <this-repo-url>
# or, after a plain clone:
git submodule update --init --recursive
```

Update all mirrors to their latest upstream commit:

```
scripts/add_mirror.sh <slug> <repo-url>   # per-repo, or
git submodule update --remote --init --recursive   # all at once
```

or run the "Sync mirrors" GitHub Action from the Actions tab.
