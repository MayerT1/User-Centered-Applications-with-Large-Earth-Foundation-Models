# Contributing / Submitting a Project

1. Push your code to **your own** GitHub repo and your model to **Hugging Face Hub**.
2. Submit your links one of two ways:
   - Open a **"Project Submission" issue** (Issues → New → Project Submission).
   - Or open a **PR** adding an entry to `registry/submissions.yaml`.
3. A maintainer merges it. `docs/data/submissions.json` regenerates automatically
   and your project appears on the [Resources page](docs/resources.html).
4. If you asked for mirroring, a maintainer runs
   `scripts/add_mirror.sh <your-slug> <your-repo-url>` to add your repo as a
   submodule under `mirrors/<your-slug>`.

## Editing the site content

- **Agenda**: edit `docs/data/agenda.json` directly (see schema below), or hand
  the source Word/Doc doc to a maintainer to convert.
- **Who's Who**: add an entry to `registry/people.yaml`, drop a photo in
  `docs/assets/people/`, then run `python3 scripts/build_data.py`.
- **Resources**: add an entry to `registry/resources.yaml`, then run
  `python3 scripts/build_data.py`.

### Agenda JSON schema (`docs/data/agenda.json`)

```json
[
  {
    "label": "Day 1",
    "date": "2026-10-01",
    "items": [
      { "time": "9:00 AM", "title": "Welcome & Intro", "speaker": "Tim Mayer", "description": "Kickoff." }
    ]
  }
]
```
