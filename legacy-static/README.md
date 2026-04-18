# legacy-static

This folder contains a read-only copy of the original EMI static website as it existed before the monorepo rebuild began (Sprint 0, April 2026).

**Do not edit these files.** They are preserved here as a migration reference so that content, copy, and structure decisions from the original site can be consulted during Sprints 6–15. Once migration is complete (Sprint 15, Milestone M3) this folder may be archived.

## Contents

| File / folder        | Original purpose                                                        |
| -------------------- | ----------------------------------------------------------------------- |
| `index.html`         | Home page                                                               |
| `about.html`         | About page                                                              |
| `experiments.html`   | Experiments listing                                                     |
| `literature.html`    | Generous Interfaces literature review                                   |
| `accessibility.html` | Accessibility statement                                                 |
| `contact.html`       | Contact page                                                            |
| `privacy.html`       | Privacy notice                                                          |
| `terms.html`         | Terms of use                                                            |
| `styles.css`         | Global stylesheet                                                       |
| `experiements/`      | Three experiment placeholder pages (note the typo in the original path) |
| `fonts/`             | Locally hosted web fonts                                                |
| `images/`            | Site images including the EMI logo                                      |

## Note on the misspelled path

The original site served experiment sub-pages under `/experiements/` (misspelled). The new site corrects this to `/experiments/`. Legacy redirects (`/experiements/*` → `/experiments/*`) are implemented in Sprint 5 and tested in `tests/bdd/features/redirects-legacy-urls.feature`.
