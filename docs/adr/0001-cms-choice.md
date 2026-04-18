# ADR 0001 — CMS Choice

**Status:** Accepted  
**Date:** 2026-04-17  
**Deciders:** Dr David Walsh, Dr Daniel Campbell

---

## Context

The EMI website needs a content management system so that experiments, publications, essays, team members, and partner information can be added and updated without code changes. The CMS must be self-hostable (Edge Hill University cannot depend on third-party SaaS for research infrastructure), Docker-native, and capable of modelling the 14+ content types defined in the PRD.

Two candidates were evaluated:

| Criterion            | Strapi v4                               | Payload CMS                              |
| -------------------- | --------------------------------------- | ---------------------------------------- |
| Maturity             | Stable, production-proven since 2019    | Younger (v1 2022, v2 2023), growing fast |
| TypeScript           | First-class since v4.3                  | Code-first TypeScript native             |
| Docker support       | Official Docker images, well-documented | Good, less prescriptive                  |
| Content type builder | Visual UI in admin panel                | Config-as-code only                      |
| Plugin ecosystem     | Large (2 000+ plugins)                  | Smaller but growing                      |
| Licence              | MIT (self-hosted)                       | MIT                                      |
| Documentation        | Extensive                               | Good, improving                          |
| Team familiarity     | Higher — used in prior EHU projects     | Lower                                    |

---

## Decision

**Strapi v4** is selected as the CMS.

The visual content-type builder materially reduces the time needed to create and iterate on the 14 content types during Sprints 3 and 4. Team familiarity with Strapi reduces onboarding risk on a solo-maintainer project. The mature plugin ecosystem (scheduled publishing, i18n if needed, email) avoids custom implementation work.

---

## Consequences

- Content types are defined via the Strapi admin UI and stored as JSON schema in `apps/cms/src/api/*/content-types/`. These files are version-controlled.
- All CMS business logic is isolated to `apps/cms/`. The `packages/shared-types/` package exposes TypeScript interfaces derived from those schemas so the `web` app has type-safe access to CMS responses.
- If Strapi is replaced in future, the content-type definitions and shared-types package form the migration boundary — the frontend is insulated from the swap.
- Payload CMS remains a viable alternative if Strapi licensing changes or the project grows to need Payload's code-first approach for complex access control. This ADR should be revisited at M3 (Sprint 15).
