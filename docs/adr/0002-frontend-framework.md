# ADR 0002 — Frontend Framework

**Status:** Accepted  
**Date:** 2026-04-17  
**Deciders:** Dr David Walsh, Dr Daniel Campbell

---

## Context

The EMI website is a research showcase with a mix of content-heavy static pages (About, Research threads, Writing) and interactive experiment embeds (Voice grid, Legacy reconstructions). The frontend framework must support server-side rendering for SEO and accessibility, static export for low-traffic pages, and an interactive component model for experiment pages. It must also integrate cleanly with a headless CMS API and run inside Docker.

Two candidates were evaluated:

| Criterion              | Next.js 14 (App Router)                     | Astro 4                                    |
| ---------------------- | ------------------------------------------- | ------------------------------------------ |
| Rendering model        | SSR, SSG, ISR — per route                   | SSG first, SSR via adapters                |
| Interactive components | React — full ecosystem                      | Islands architecture — any framework       |
| TypeScript             | First-class                                 | First-class                                |
| CMS integration        | Mature fetch/cache primitives in App Router | Good, adapter-based                        |
| Docker support         | Well-documented, multi-stage builds         | Good                                       |
| Experiment embeds      | React components co-located in repo         | Components in separate islands             |
| Team familiarity       | Higher                                      | Lower                                      |
| Bundle size            | Larger by default                           | Smaller by default (no JS unless opted in) |

---

## Decision

**Next.js 14 with the App Router** is selected as the frontend framework.

The experiment pages require interactive React components (voice grid, visualisations) that are closely coupled to the rest of the codebase. Keeping the entire frontend in a single React/Next.js app avoids the complexity of a hybrid framework. Next.js App Router's per-route caching and streaming allow the content-heavy pages to be statically generated while experiment pages remain dynamic.

---

## Consequences

- The frontend lives in `apps/web/` with an App Router structure under `app/`.
- Each route segment maps directly to the sitemap confirmed in Sprint 0. See `docs/ARCHITECTURE.md` section 6 for the full route map.
- Shared UI components live in `packages/ui/` and are consumed by `apps/web/`.
- TypeScript strict mode is enforced via `tsconfig.base.json`.
- Astro remains a valid alternative if the project evolves towards primarily static content and the interactive experiment pages are decoupled as standalone tools. Revisit at M5 if relevant.
