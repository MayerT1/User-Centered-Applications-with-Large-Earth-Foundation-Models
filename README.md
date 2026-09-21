# User-Centered Applications with Large Earth Foundation Models

Event hub + GitHub Pages site for the workshop. Attendees submit their code repo
and Hugging Face model links here; the site (agenda, who's who, resources) is
generated from data files in `registry/`.

## Layout

```
registry/            source-of-truth data (edit these, then run build_data.py)
  submissions.yaml    one entry per attendee project (repo + HF model)
  people.yaml         who's who entries
  resources.yaml      curated resource links
scripts/
  build_data.py       registry/*.yaml -> docs/data/*.json
  add_mirror.sh        add/update a git submodule mirror of an attendee repo
mirrors/              git submodules, one per attendee repo (optional, see below)
docs/                 the actual GitHub Pages site (Pages source = main /docs)
.github/
  ISSUE_TEMPLATE/submission.yml   attendee-facing submission form
  workflows/build-data.yml        regenerates docs/data/*.json on registry changes
  workflows/sync-mirrors.yml      updates git submodules on demand
```

## How attendee submission works

1. Attendee creates their **own** GitHub repo for code and pushes their model to
   **Hugging Face Hub**.
2. Attendee opens a **GitHub Issue** using the "Project Submission" template (or a
   PR editing `registry/submissions.yaml` directly) with: team/name, repo URL, HF
   model URL, short description, optional headshot.
3. Maintainer merges → `build-data.yml` regenerates `docs/data/submissions.json`
   automatically → the site's Resources/Projects page updates.
4. (Optional, "mirroring") To have an attendee's repo appear *inside* this repo
   (not just linked), add it as a git submodule:
   ```
   scripts/add_mirror.sh <team-slug> <https-url-to-their-repo>
   ```
   This adds `mirrors/<team-slug>` as a submodule pointing at their repo. It
   stays a live pointer to their repo (their commits show up when the submodule
   is updated) rather than a copy, so nothing has to be re-uploaded. Run
   `.github/workflows/sync-mirrors.yml` (Actions tab → "Run workflow") to pull
   the latest commit for every mirror.

## Local build

```
pip install pyyaml
python3 scripts/build_data.py
```

## Publishing

GitHub repo Settings → Pages → Source: `main` branch, `/docs` folder. No build
step required — the site is plain HTML/CSS/JS reading the JSON in `docs/data/`.

## Handoff to an org account

This repo currently lives under a personal account and will be transferred to
the workshop's organizational account once created:
`Settings → General → Danger Zone → Transfer ownership`. Pages, issues,
workflows, and submodule mirrors all survive a transfer; only remotes that
external collaborators have cloned need to update their `origin` URL.
