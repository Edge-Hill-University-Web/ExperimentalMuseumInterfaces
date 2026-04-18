# PRD: EMI as a Research Showcase and Thought-Leadership Platform for Exploratory Cultural Heritage Interfaces

**Document type:** Product Requirements Document (research-infrastructure class)
**Subject:** emi.computing.edgehill.ac.uk (Experimental Museum Interfaces)
**Owners:** Dr David Walsh, Dr Daniel Campbell (Edge Hill University, Department of Computer Science)
**Author of this PRD:** Drafted for Dave Walsh, April 2026
**Status:** Draft v1.1, for review and iteration
**Reference comparators:** oliviavane.co.uk (tone, cumulative list pattern, and partner-facing credibility); Europeana Pro "Generous Interfaces" collection; UCL Centre for Digital Humanities project pages; Goldsmiths Interaction Research Studio; RCA Design Research.

**Changelog**

- **v1.1 (Apr 2026):** Re-verified against the live site and the Vane portfolio. Corrected the expansion of EMI to "Experimental Museum Interfaces". Replaced the speculative current-state audit with a direct audit of the four live pages. Reframed the Limitations reference page as an evolution of the existing Literature Review page. Added migration notes from the current four-item navigation to the proposed structure. Flagged the `/experiements/` path typo. Aligned Section 20 with the Socratic framework from ccforpms.com/advanced/write-prd (which is a PRD-writing methodology, not a section template).
- **v1.0:** Initial draft, written from public information about the authors' publications because the live site could not be fetched at drafting time.

---

## 1. Purpose of this document

This PRD treats the EMI site not as a conventional project website but as research infrastructure: a long-lived publishing surface that attracts collaboration, hosts reproducible interface demonstrations, and stakes a public position in the literature on exploratory access to large digital collections. It specifies why the site should exist in its proposed form, what the current site is missing if that is the goal, what content and demonstrations belong on it, and how it should be structured.

It is written for two audiences simultaneously: the site owners (Walsh and Campbell), and any future collaborator (student, RA, or partner institution) contributing to its content or code. The PRD is therefore explicit about rationale, and not only requirements.

## 2. Strategic positioning statement

EMI (Experimental Museum Interfaces) is a research group at Edge Hill University investigating how people, most of them non-expert, encounter, browse, and make sense of large digital collections, with a primary focus on cultural heritage. The site's job is to make three things visible:

1. The group's intellectual position on why the dominant interface paradigm for collections, the search box plus a results grid, is a poor fit for the majority of users.
2. A working catalogue of exploratory interface demonstrations, including live prototypes, reconstructions of historically significant but no longer accessible research interfaces, and novel concepts not yet published.
3. An open invitation to museums, archives, libraries, and industry partners to collaborate on access, evaluation, and deployment.

The site should read as the public face of an exploratory interface research group, comparable in seriousness and legibility to oliviavane.co.uk, but with a stronger academic voice, a deeper catalogue, and a clearer partner-facing invitation.

**What EMI is not:** it is not a grant support site, a teaching portfolio, a blog, or a staff profile page. Those functions already live elsewhere and should be linked, not reproduced.

## 3. Current-state evaluation

This section is a direct audit of the live site as of April 2026.

### 3.1 Structure and navigation (observed)

Top-level navigation: **Home, About, Experiments, Literature Review.** The header uses a persistent menu and a "Skip to main content" accessibility link. The footer is minimal.

The site has four primary HTML pages plus three experiment sub-pages, hosted under a folder path spelled `/experiements/` (a typo, see 3.7 below). No People page, no Publications page, no Contact page, no Collaborate page, no dedicated Voice or Legacy section.

### 3.2 Home page (observed)

The home page is a blog-style post list containing a single entry, titled **"The Impact of Generous Interfaces on User Engagement and Discovery"**, dated **19 September 2024**. The entry describes a research project that "aims to assess the effectiveness of generous interfaces in promoting user engagement and discovery in museum environments" and mentions tracking user interaction patterns, discovery of connections between artefacts, and informing future interface design for cultural institutions.

An **email sign-up form** ("Your email" / "Sign Up") is present on the home page. Its purpose, the list it subscribes to, and the privacy and GDPR implications are not explained anywhere on the page.

The home page offers no explicit positioning statement, no featured experiments strip, and no call-to-action into the rest of the site beyond the top navigation.

### 3.3 About page (observed)

This is the site's strongest page. It names the group, its purpose, and the leadership. Key passages, quoted briefly:

- "The Experimental Museum Interfaces (EMI) website is a research platform dedicated to exploring how technology can transform the way users interact with museum collections."
- "EMI is at the forefront of research in Human-Computer Interaction (HCI), with a particular focus on generous interfaces, collection browsing, and recommendation systems for cultural heritage."
- "Our work aims to push beyond traditional search-based interactions..."
- Types of Experiments listed: **Generous Browsing Interfaces, Interactive Timelines, Recommendation Systems, Visualisation Techniques.**
- "EMI is primarily led by Dr. David Walsh and Dr. Daniel Campbell from Edge Hill University."

The About page does not link to Walsh's or Campbell's institutional profiles, does not list publications, does not name partner institutions, does not name datasets, and does not provide a contact method.

### 3.4 Experiments page (observed)

A short landing page listing three experiments by title and one-line description:

- **Collection Explorer:** "A visual browsing tool for exploring museum artefacts interactively."
- **Timeline Journey:** "Discover collections through an interactive timeline."
- **Generous Browsing:** "Explore collections with minimal searching."

Each experiment links to its own page. All three experiment pages are **empty placeholders** with the closing sentence "More content about the experiment will be added here soon. Stay tuned for updates." No running demo, no dataset, no evaluation, no code link, no citation.

This is the single largest gap between what the site says it is and what it currently delivers.

### 3.5 Literature Review page (observed, and a pleasant surprise)

A Literature Review page exists and contains one complete section, **"Generous Interfaces"**, with in-text citations to Whitelaw (2012, 2015), Coburn (2016), Windhager (2019), and Speakman (2018). It names Tim Sherratt's "The Irish in Australia History Wall" and the British Library's "Explore the British Library" project as notable examples, and identifies four features of generous interfaces (Exploratory Navigation, Rich Visual Overviews, Thematic Grouping, Multidimensional Visualisation).

The page has no reference list, no DOI links, no author attribution within EMI, no date, and covers only one topic. It is a well-pitched seed for the thought-leadership surface proposed later in this PRD, and should be treated as the foundation of that surface rather than something to be built from scratch.

### 3.6 Credibility signals (observed)

Missing from the live site:

- Named partner museums, archives, or libraries.
- Named datasets used in experiments.
- Publication list or link to authors' ORCID / Google Scholar / DBLP / Edge Hill profile pages.
- Contact method (no email, no form, no physical address).
- Social or academic channels (no links to ORCID, GitHub, Mastodon, X, LinkedIn).
- Evaluations, participant numbers, IRB statements, or results.
- Funding acknowledgements.
- Press, exhibition, or workshop mentions.
- Code repositories.

### 3.7 Technical and editorial defects (observed)

- **URL typo.** The experiments folder is served at `/experiements/` rather than `/experiments/`. This appears in every experiment sub-page URL. It should be corrected and redirected, with old URLs preserved via 301 redirects so no external link breaks.
- **Date staleness.** The only dated content on the home page is from September 2024. A site that claims to be "at the forefront" of HCI research should show activity more recent than eighteen months old.
- **Placeholder content.** Three of three experiment detail pages are placeholders. This pattern damages credibility with any first-time reader.
- **Email sign-up without context.** The sign-up form has no associated privacy notice, purpose statement, or frequency expectation. Under UK GDPR this should be corrected before the site is promoted further.
- **Accessibility.** A "Skip to main content" link is present; that is good. Beyond this, a full WCAG 2.2 AA audit has not been performed in this PRD and should be commissioned.
- **No OpenGraph or Twitter-card metadata observed**, which limits how the site appears when shared on social channels.

### 3.8 Summary judgement

The current site has a clear, readable About page, a promising Literature Review seed, and a credible positioning (generous interfaces, collection browsing, recommendation systems). It is held back by three things: the entire Experiments section is a stub, the site carries no partner or publication credibility signals, and there is no route from the site to a named human. The work proposed in this PRD addresses each of these in sequence.

## 4. Goals, non-goals, and success metrics

### 4.1 Goals

- **G1. Be the canonical public reference for the EMI group's intellectual position**, including a standing page on the limitations of traditional browsing interfaces.
- **G2. Host a curated catalogue of interface demonstrations**, running in the browser, with a consistent presentation pattern (context, data, interface, evaluation, references).
- **G3. Recreate or approximate historically important research interfaces** that are no longer publicly accessible, using contemporary datasets, so that the literature they underpin remains demonstrable.
- **G4. Showcase novel interface concepts** that have not yet appeared in published literature, including current work on voice-controlled collection grids and voice-driven browsing.
- **G5. Convert visits into collaboration enquiries** from museums, archives, libraries, and industry partners.
- **G6. Provide reusable scaffolding** (page templates, data pipelines, evaluation kits) that postgraduate researchers and visiting collaborators can extend without permission gates.

### 4.2 Non-goals

- The site will not act as a grant-funding support tool, a consultancy shopfront, or a teaching portfolio.
- The site will not duplicate staff-profile content hosted on research.edgehill.ac.uk; it will link to it.
- The site will not aim for a mass-market voice; it targets researchers, curators, and informed industry readers.
- The site will not host raw museum content that partner institutions hold rights to; it will link to source catalogues and use pre-cleared sample data.

### 4.3 Success metrics

Metrics are chosen to match a research-infrastructure function, not a marketing site.

- **Referrals and citations:** number of peer-reviewed papers citing the site as a source for a live demonstration.
- **Collaboration enquiries:** inbound emails via the contact form from museums, archives, or industry partners, tracked quarterly.
- **Demo completion:** proportion of first-time visitors to a demo page who interact with the live interface for more than 30 seconds, measured with privacy-preserving analytics.
- **Partner reuse:** number of external groups that fork or reuse a published EMI demo or dataset.
- **Reading depth on the limitations page:** scroll completion and time-on-page as proxies for the page functioning as a reference.

## 5. Target audiences and their jobs-to-be-done

### 5.1 Academic researchers (primary)

Digital humanities, HCI, IR, and digital libraries researchers arriving from a paper, a talk, or a search. Their job: confirm that the work is substantive, find a cite-able reference, and decide whether to contact the group.

### 5.2 Curators and digital leads at cultural institutions (primary)

Museum, archive, and library staff exploring what exploratory interfaces look like in practice. Their job: see credible prior work with similar institutions, understand what partnership involves, and locate a named contact.

### 5.3 Industry partners (secondary)

Teams at search, AI, or heritage-tech companies looking for academic collaborators on exploratory browsing, recommendation, or AI-supported exploration. Their job: evaluate the group's technical seriousness and propose a project.

### 5.4 Postgraduate and early-career researchers (secondary)

Prospective students, research software engineers, or visiting scholars. Their job: understand the group's research programme, read active work, and identify a supervisor or collaborator.

### 5.5 Informed members of the public (tertiary)

Readers arriving from press coverage or a museum link who want to try a demo. Their job: find an interface that works in the browser, use it without friction, and read a short, plain-English explanation of what it demonstrates.

## 6. Gap analysis

The gap between the current site (assumed) and the positioning described in section 2 can be broken into six categories.

**Gap A, intellectual framing.** The About page states a position but the home page does not. The Literature Review page has one well-written section on generous interfaces but no second or third topic, no reference list, and no "canonical statement" on the limits of traditional browsing. A reader cannot cite EMI's position today. The proposed Home page rewrite plus an expanded Limitations-of-Browsing page closes this gap.

**Gap B, demonstration catalogue.** Three experiments are advertised and none are live. Running interfaces with a consistent presentation template (section 10.1) are the single biggest credibility lift the site can make.

**Gap C, legacy reconstruction.** Key interfaces referenced in the literature (rich-prospect browsers, generous-interface demonstrations, earlier faceted and relational views) are no longer online. The current site has no plan for approximating them on contemporary data. A Legacy section needs to be added.

**Gap D, forward-looking experiments.** Active work on voice-controlled collection grids and voice-driven browsing is not yet publicly visible. The site needs a route for surfacing work in progress without committing to the conclusions of unpublished studies.

**Gap E, collaboration surface.** There is no "work with us" page that names the kinds of partnerships the group is open to, the datasets it can work with, and the typical shape of a collaboration. There is also no contact method anywhere on the live site.

**Gap F, credibility infrastructure.** Citations, partner logos (where permitted), datasets, evaluation protocols, code repositories, author profile links, and press mentions are not aggregated into a single, scannable surface. Every one of these signals is absent from the live site today.

**Gap G, hygiene.** URL typo in the experiments folder, stale dated content, email sign-up without context, and missing social metadata. Each of these is small on its own and collectively they signal under-maintenance.

## 7. Proposed site structure and navigation

The proposed structure has a top-level navigation of seven items, chosen to be stable over time while leaving room for content growth underneath.

```
EMI / Experimental Museum Interfaces                                Edge Hill University

[About]  [Research]  [Experiments]  [Voice]  [Legacy]  [Writing]  [Collaborate]
```

Note: the "Experiments" label is retained from the current site rather than replaced with "Demonstrations", because it is already publicly indexed and aligns with the group's existing nomenclature. Treat the two words as synonymous in this PRD.

### 7.0 Migration from the current four-item navigation

The current navigation (Home, About, Experiments, Literature Review) maps onto the proposed structure as follows:

- **Home** remains, with a rewritten home page as specified in 7.1.
- **About** remains and is expanded (section 7.2).
- **Experiments** remains as the label and is expanded into a proper catalogue (section 7.4).
- **Literature Review** is promoted to the parent **Research** section (section 7.3), with the existing Generous Interfaces content preserved and extended, and the Limitations of Browsing reference page added underneath (section 12).
- **Voice, Legacy, Writing, Collaborate** are new.

Old URLs must be preserved via 301 redirects so external citations continue to resolve. In particular, the `/experiements/` folder typo should be fixed to `/experiments/` with redirects.

A rationale and content spec for each nav item follows.

### 7.1 Home (at /)

Not itself a nav item; the home page is the shortest route to the group's position and the three most important demos.

Content blocks, in order:

- One-sentence positioning statement (see section 8.1).
- Three-paragraph elaboration explaining what the group studies, why, and what kinds of interfaces it builds.
- A "featured demonstrations" strip showing three live interfaces (one classic, one voice, one novel).
- A "recent writing" list pulling the three most recent publications or posts.
- A short call to action to the Collaborate page.

Visually the home page should be spare and text-forward, closer in feel to oliviavane.co.uk than to a corporate research-lab home. A single serif heading typeface and a restrained palette will carry more academic credibility than illustrative flourishes.

### 7.2 About

A page that is explicitly about the group as an intellectual project, not about the individuals.

Content: the research programme in full, the two authors with short bios and links to their institutional profiles, a statement of research values (openness, reproducibility, respect for cultural institutions' constraints), and an honest statement of scope (what the group does not claim to do).

### 7.3 Research

A thematic map of the group's programme, broken into four or five research threads. Each thread is its own page with: a one-paragraph definition, links to relevant demonstrations, links to relevant writing, and a short list of open questions.

Proposed initial threads:

- **Casual and non-expert users.** Building on Walsh and Hall's work on initial encounters with digital cultural heritage.
- **Generous and rich-prospect interfaces.** Surveying, evaluating, and extending the paradigm.
- **AI-supported exploration.** Embedding generation, recommendation, and conversational guidance in collection access.
- **Voice and multimodal access.** The active thread described in section 9.
- **Evaluation and user categories.** Methods for studying browsing, building on the group's prior work on user categorisations.

Research threads are long-lived; specific projects live inside them.

### 7.4 Demonstrations

The heart of the site. A grid of interface demos, each one a runnable page with a consistent template (section 10.1). Demonstrations are tagged by research thread, by dataset, and by status (live, archived, in progress).

### 7.5 Voice

A dedicated top-level section because voice is both an active research thread and a distinctive positioning move. Its internal structure is given in section 9.

### 7.6 Legacy

A section devoted to recreating or approximating historically significant research interfaces that are no longer available. Its internal structure is given in section 11.

### 7.7 Writing

Publications, preprints, invited talks, short essays, and technical notes. This is the place for peer-reviewed work and for the kind of short-form thinking that supports the group's thought-leadership role without requiring a full paper.

Content organisation:

- **Publications:** reverse-chronological list with filters (year, venue, thread).
- **Essays:** short, signed pieces by Walsh, Campbell, or invited contributors, on topics such as "why the search box fails casual users" or "what a generous interface owes its users".
- **Talks and slides:** downloadable PDFs and recordings where permitted.
- **Press and mentions.**

### 7.8 Collaborate

A partner-facing page, not a generic contact form. Content:

- Kinds of partnership the group actively seeks (museums, archives, libraries, AI industry, funded projects).
- Typical shapes of a collaboration (a three-month co-designed prototype, a dissertation-scale evaluation, a longer AHRC-style project).
- Data stewardship principles, written so a museum's digital lead can assess whether the group is a trustworthy partner.
- A short, specific contact form that asks for organisation, dataset or question of interest, and timeframe.
- Named contacts for Walsh and Campbell.

### 7.9 Cross-cutting: site-wide affordances

- A persistent footer with ORCID and DBLP links for each author, a link to Edge Hill's computer-science department, and an RSS feed for Writing.
- A **Search** input in the header that queries the site itself, which is a small but symbolically appropriate choice for a group whose research argues against the primacy of search.
- A **Sitemap** linked from the footer.
- A consistent citation widget on every demo and essay page so that readers can cite the site as a source.

## 8. Editorial and tone specification

### 8.1 Core positioning sentence

> EMI studies how people encounter, browse, and understand large digital collections, and builds exploratory interfaces, with and beyond search, for cultural heritage and other knowledge-rich domains.

This sentence is load-bearing. It appears on the home page, in the site's meta description, and in the research group's academic bio blurb.

### 8.2 Voice

Academic, forward-looking, specific. Sentences favour concrete claims over generalities. Passive constructions are acceptable where appropriate for academic writing, but not as a default. The site avoids marketing adjectives ("innovative", "cutting-edge", "world-class") and instead lets the work carry the weight.

### 8.3 Language and formatting

- UK English throughout, Oxford comma, no em or en dashes.
- Every technical term is defined on first use on any given page.
- Every claim about interfaces is either cited or marked explicitly as in-progress.
- Images and videos carry captions that can stand alone when the image is shared.

### 8.4 Credibility patterns to borrow from oliviavane.co.uk

- Project-by-project deep pages with a uniform structure.
- Short, confident project intros that state the problem before the pretty screenshots.
- Restrained visual design with one or two hero images per project.
- Named partner institutions and datasets.
- A first-person "about" voice that is professional without being corporate.

EMI should adopt these patterns, and layer on a heavier academic apparatus (citations, evaluation, research threads) that the Vane portfolio has less need for.

## 9. Voice research programme on the site

Voice-controlled and voice-driven interaction with collections is a distinctive thread and one that few other exploratory-interface groups are working on. It deserves a top-level section and a specific content plan.

### 9.1 Voice section structure

```
/voice/
  /voice/overview
  /voice/grid       (voice-controlled collection grid)
  /voice/browse     (voice-driven collection browsing)
  /voice/evaluation
  /voice/roadmap
```

### 9.2 Content for each page

**Overview.** A framing essay: what changes when the input to a collection interface is speech rather than a keyboard or a mouse? Why grids and rich-prospect views are good candidates for voice. Why "browsing aloud" is a distinct interaction mode from "searching aloud". A list of named research questions.

**Voice-controlled collection grid.** The current prototype: a rich-prospect grid that responds to voice commands ("show me more like the one top-left", "zoom into the eighteenth century", "hide anything in colour"). The page should describe the dataset, the recogniser, the command grammar, and the known failure modes. A recorded demonstration video embedded at the top for readers who cannot speak aloud at their desk, and an in-browser demo for those who can.

**Voice-driven collection browsing.** The complementary prototype: voice used not to control a grid but to drive a tour through a collection, with the system narrating and the user steering with short utterances. A clear contrast with the grid prototype should be made explicit.

**Evaluation.** Methods, protocols, and preliminary results. This page is where the group stakes out its evaluation position for voice: recognition accuracy is necessary but not sufficient; the real question is whether voice changes what users find.

**Roadmap.** A public, living list of open questions and planned experiments. This signals active work without requiring publication-quality results.

### 9.3 Novel directions in voice to flag

Directions the site should claim before the literature catches up:

- **Voice as a disclosure modality for AI support.** Speaking "why are you showing me this?" as a first-class interaction, which surfaces model reasoning without cluttering the visual layout.
- **Voice-paced browsing.** Using speech prosody (speed, pauses) as an implicit signal of user attention, feeding back into item selection.
- **Collaborative voice browsing.** Two users at one screen, taking turns steering with voice. Underexplored in the published literature and highly relevant to museum settings.
- **Voice plus gaze or voice plus touch.** Multimodal fusion for gallery kiosks and large shared displays.
- **Voice-first evaluations for accessibility.** Framing the voice programme partly as an accessibility contribution, which opens partnership conversations with institutions that have accessibility mandates.

## 10. Interface demonstration catalogue

### 10.1 Demonstration page template

Every demonstration uses the same structure so that the catalogue reads as a coherent body of work.

```
Title
Short one-sentence description
Status: live | archived | in progress
Research thread(s): [...]
Dataset: [name, source, sample size]
Interface: [live embedded prototype]
How to try it: [short instructions]
What this demonstrates: [two or three paragraphs]
Evaluation: [methods, participant numbers, key findings or "not yet evaluated"]
Known limitations
Reproduction: [link to code, data, or build notes]
Citations: [papers that describe or evaluate this interface]
Acknowledgements: [partners, funders, students]
Suggested citation for this page
```

### 10.2 Categories of demonstration to host

**Rich-prospect and generous views.** Grid, timeline, map, and map-plus-time interfaces over sample heritage datasets. These form the baseline catalogue and anchor the group's claims about the paradigm.

**Faceted and relational browsers.** Demonstrations that allow navigation through facets while preserving a sense of the whole collection, which is the property missing from standard faceted search.

**Serendipity-oriented interfaces.** Interfaces explicitly designed to surface unexpected items, with a clear evaluation story on whether serendipity was actually delivered and whether it was welcome.

**AI-supported exploration.** Three sub-types:

- **Embedding-driven browsers.** "More like this" and "similar, but surprising" built on collection-specific embeddings.
- **Conversational guides.** An LLM-backed agent that narrates a walk through a collection, with citations back to catalogue records.
- **Caption and tag expansion.** Interfaces that use AI-generated descriptions to support browsing by content, evaluated with honest reporting of hallucination risk.

**Voice interfaces.** See section 9.

**Novel directions not yet in the literature.** This is the category that most strongly supports the thought-leadership goal. Candidate interfaces:

- **Collections as atmospheres.** Ambient, peripheral displays of a live collection stream designed for offices and communal spaces in partner institutions, evaluated for slow engagement.
- **Personal trails.** Persistent, shareable browsing trails through a collection, treating the trail as a first-class object that can be compared across users.
- **Negotiated queries.** An interface where the system proposes a refined query that the user can accept, modify, or reject, with the aim of shifting the cost of query formulation off the casual user.
- **Collection cross-walks.** A view that takes a single item and steps the user laterally through related items across three or four partner collections, foregrounding how a museum's holdings sit in a wider landscape.
- **Forgetting interfaces.** Prototypes that deliberately hide items the user has seen, to support exhaustive exploration of large collections.
- **Explanation dashboards.** A side panel that reveals why each item appeared, building on transparency research and honest about where AI is making the choice.
- **Child and family modes.** Versions of the group's interfaces tuned for younger users, aligned with Walsh's interest in non-expert audiences.

### 10.3 Ordering and curation

The demonstrations page shows a grid sorted by research thread by default, with filters for dataset, status, and year. A small editorial "featured" tray at the top rotates quarterly and is chosen by the owners.

## 11. Legacy interface recreation

Research interfaces that are no longer accessible are a recurring problem for the field: papers cite demos that a reader cannot try, so the published claims gradually lose force. The EMI site can take a stance on this by curating a small "Legacy" collection.

### 11.1 Principles

- **Approximation, not replication.** Most legacy interfaces were tied to specific museum datasets and APIs that no longer exist. The group will rebuild the interaction patterns on contemporary, well-licensed datasets, not attempt exact reproductions.
- **Attribution first.** Every Legacy page names the original authors, the original institution, the original dataset, and links to the original publication. The EMI implementation is clearly labelled as a contemporary approximation.
- **Evaluation framed as re-evaluation.** Where the original paper reported findings, the approximation invites readers to consider whether those findings still hold on contemporary data.

### 11.2 Dataset strategy

- **Europeana sample sets** for pan-European material.
- **Smithsonian Open Access** for a large, well-documented English-language set.
- **V&A API** for design and decorative arts material.
- **British Library Flickr Commons** for illustrations.
- **Living with Machines / British Newspaper Archive samples** where rights permit.
- **Edge Hill local archives** where partnership allows, as a distinctive local contribution.

### 11.3 Candidate legacy interfaces to approximate

The specific shortlist should be drawn up by the owners. A starting list drawn from the public literature includes rich-prospect browsers from the Ruecker-Radzikowska-Sinclair line of work, early generous-interface demonstrations (Whitelaw and colleagues), early timeline visualisations of digitised collections (including work of the kind Vane has published), and early faceted browsers over museum catalogues.

## 12. Standing reference page: limitations of traditional browsing interfaces

This page is central to the site's thought-leadership role. It is a long-form, citable reference that describes, in a structured and honest way, where the dominant browsing paradigm fails.

**Relationship to the existing Literature Review page.** The current Literature Review page contains a well-written section on generous interfaces with citations to Whitelaw (2012, 2015), Coburn (2016), Windhager (2019), and Speakman (2018). That content should not be discarded. It should become the sibling page to "Limitations of Browsing" under a combined Research > Literature area, with both pages sharing the same citation style and reference list. A suggested Research area structure is:

```
/research/
  /research/generous-interfaces         (the existing Literature Review page, preserved and extended)
  /research/limitations-of-browsing     (the new standing reference, below)
  /research/casual-users                (new, thread page)
  /research/voice-and-multimodal        (new, thread page)
  /research/ai-supported-exploration    (new, thread page)
  /research/evaluation-and-user-categories
```

### 12.1 Structure

```
/research/limitations-of-browsing

1. Introduction and scope
2. The casual user and the blank search box
3. Faceted search and the loss of the whole
4. Grids and the cost of uniform presentation
5. Ranking opacity and trust
6. Serendipity, or the absence of it
7. Scale: where rich-prospect views break
8. Accessibility and modality limits
9. Evaluation problems
10. Open research questions
References
```

### 12.2 Tone

Measured and citation-heavy. Every claim is either cited to a specific paper or clearly marked as the authors' position. The page is written as a reference, in the sense that other papers should be able to cite it as the group's canonical summary.

### 12.3 Anchor references from the authors' own work

- Walsh, D. and Hall, M. (2015). _Just Looking Around: Supporting Casual Users Initial Encounters with Digital Cultural Heritage_.
- Walsh, D., Clough, P. and Foster, J. (2016). _User Categories for Digital Cultural Heritage_.
- Walsh, D., Hall, M., Clough, P. and Foster, J. (2017). _The Ghost in the Museum Website: Investigating the General Public's Interactions with Museum Websites_ (TPDL).
- Walsh, D., Speakman, R. and Hall, M. (2018). _User Engagement with Generous Interfaces for Digital Cultural Heritage_.
- Walsh, D. and Hall, M. (2021). _Exploring Digital Cultural Heritage through Browsing_.
- Walsh, D. (2024). PhD thesis, University of Sheffield, on digital cultural heritage and user interaction with web-based systems.

These specific citations must be verified by the authors and supplemented with Campbell's relevant publications, which should be added during drafting.

### 12.4 Anchor references from the wider literature

Suggested external anchors to cite on this page: Whitelaw on generous interfaces; Ruecker, Radzikowska, and Sinclair on rich-prospect browsing; Dörk and colleagues on cultural heritage visualisation; Thudt, Hinrichs, and Carpendale on visual browsing; Vane on timeline design; Hinrichs and collaborators on InfoVis for heritage; Whitelaw on the Commons Explorer; relevant Europeana Pro issues.

Exact references to be confirmed by the authors.

## 13. Content production plan

### 13.1 Minimum viable launch

A three-month launch window, producing:

- Home, About, Research overview, one Research thread page (casual users), Collaborate, Writing, Demonstrations index.
- Three live demonstrations, one per research thread, including one voice demonstration.
- One Legacy page, fully written, with at least one working approximation.
- The Limitations of Browsing reference page in full.
- A complete Publications list.

### 13.2 Iterative expansion

After launch, add one new demonstration or Legacy approximation per month, one essay every two months, and a quarterly update to the home page's featured strip.

### 13.3 Authoring workflow

The site should be authored as flat Markdown under version control, rendered statically, and deployed from the Edge Hill server. This matches the technical profile of a small research group, supports reproducibility, and means any collaborator with a git account can propose content via a pull request.

## 14. Technical specification

### 14.1 Platform

A static site generator appropriate for a small academic group, such as Hugo, Eleventy, or Astro. The choice should favour build speed, long-term stability, and ease of handing over to a postgraduate researcher.

### 14.2 Demo hosting

Live demonstrations should be embedded as either static client-side prototypes or as iframes pointing at lightweight Node or Python services running on Edge Hill infrastructure. Each demo carries a link to its source repository under an Edge Hill or personal GitHub account.

### 14.3 Data handling

- No personal data collected without consent.
- Privacy-preserving analytics (Plausible, Fathom, or a self-hosted equivalent).
- Partner datasets held in controlled environments, with only cleared samples used on the public site.
- Every demo page names the dataset's licence.

### 14.4 Accessibility

The site should target WCAG 2.2 AA as a baseline, with explicit attention to voice-interface pages (transcripts, keyboard alternatives, captions).

### 14.5 Performance

Text-heavy pages should render on a 3G connection in under three seconds. Demo pages should load a lightweight preview first and invite the user to load the full interactive prototype, to protect readers on constrained connections.

## 15. Roadmap

**Phase 0, weeks 0 to 4: foundations.**
Information architecture finalised, page templates built, Home and About drafted, demonstration template agreed, content migration list compiled.

**Phase 1, weeks 4 to 12: minimum viable launch.**
Deliver the scope in section 13.1. Publicly announce via the authors' channels and via Europeana Pro, the DL and JCDL communities, and relevant UK museum digital networks.

**Phase 2, months 3 to 9: breadth.**
Add remaining Research thread pages, expand Demonstrations catalogue to eight to twelve live demos, publish the Voice section's first two prototypes, publish two to three Legacy approximations, publish four essays.

**Phase 3, months 9 to 18: reputation.**
Invite external contributors (including Vane and other named researchers) to contribute essays. Run a hosted workshop whose proceedings live on the site. Apply for funding that explicitly names the site as infrastructure.

## 16. Risks and mitigations

**Risk: the site becomes a museum of dead prototypes.** Mitigation: every demonstration has an explicit status flag (live, archived, in progress), and the home page only features live demos. Archived demos remain visible for reference but are clearly labelled.

**Risk: partner institutions object to their data being used in public demos.** Mitigation: strict dataset policy in section 14.3, and a partner review step before any new dataset is surfaced publicly.

**Risk: LLM-backed demonstrations hallucinate about collection items and damage the group's credibility.** Mitigation: every AI-supported demo carries an "AI disclosure" panel, never presents generated text as catalogue metadata, and cites the catalogue record for every item shown.

**Risk: the site is built and then not maintained.** Mitigation: the authoring workflow (section 13.3) is designed so a single postgraduate researcher can keep the site alive. A named successor is nominated before any given author leaves the group.

**Risk: the positioning is read as hostile to search.** Mitigation: the Limitations of Browsing page is framed as a reference about browsing, with explicit acknowledgement that search and browsing are complementary, and that the group's critique is of where browsing fails, not that search is sufficient.

**Risk: voice work is seen as novelty rather than research.** Mitigation: the Voice section leads with research questions and evaluation, not with demos, and its first published page is the Overview essay rather than a prototype.

## 17. Open questions for Walsh and Campbell

1. Do you want a single unified brand ("EMI") or two co-equal named researchers at the top of every page? The PRD assumes EMI as the brand. Confirmed: EMI is "Experimental Museum Interfaces".
2. What is the September 2024 home-page post about, and is the research project it describes still active? If yes, the home page should link to current outputs; if no, the post should be archived and replaced with a positioning block.
3. What is the email sign-up form on the home page subscribing people to? Until this is answered, the form should be removed to meet UK GDPR expectations.
4. Which three experiments should be live at launch? A pragmatic default is one rich-prospect grid, one voice prototype, and one AI-supported browser. The current three placeholder names (Collection Explorer, Timeline Journey, Generous Browsing) can be retained and filled in, or renamed.
5. Which legacy interface should be the first approximation? The shortlist in section 11.3 needs a named first target.
6. Are there existing collaborations (named partners, datasets) that can be surfaced on the Collaborate page from day one?
7. What is Campbell's active research programme, and which thread in section 7.3 does it best sit under?
8. Is there appetite to run a small invited workshop in year one, with proceedings published on the site?
9. Who, operationally, will review and merge content contributions from collaborators?
10. Are you willing to accept the `/experiements/` to `/experiments/` URL migration, with 301 redirects, before Phase 1 launch?

## 18. Appendix A: proposed sitemap

```
/
/about
/research
/research/casual-users
/research/generous-and-rich-prospect
/research/ai-supported-exploration
/research/voice-and-multimodal
/research/evaluation-and-user-categories
/research/limitations-of-browsing
/demonstrations
/demonstrations/[slug]
/voice
/voice/overview
/voice/grid
/voice/browse
/voice/evaluation
/voice/roadmap
/legacy
/legacy/[slug]
/writing
/writing/publications
/writing/essays
/writing/talks
/writing/press
/collaborate
/sitemap
/rss.xml
```

## 19. Appendix B: comparator notes

**oliviavane.co.uk** (audited April 2026). Top-level navigation: **Projects, Writing, Speaking, PhD, About**, plus direct links to Twitter and Observable. The home page is a single D3 collision-detection animation of circular image thumbnails with no other text, which works because the depth of evidence sits one click away. The Projects page is a **flat chronological list** in the form "Title. One-line description. Year." (for example: "Dive into Color. Colour and colour harmonies in the Smithsonian Design Museum collection. 2018"). The About page is where credibility accumulates: it opens with a first-person paragraph, names institutions (The Economist, British Library, Alan Turing Institute, V&A, Wellcome, Nordic Museum, Cooper Hewitt), states funders (AHRC scholarship) and affiliations (RSA Fellow, Observable Ambassador, Smithsonian Fellow), and then appends long sections titled **Selected Talks, Writing, Exhibitions,** and **Workshops / Teaching**, each populated with dated entries naming venues. The PhD page is an abstract plus the keywords list, with a citation widget, a PDF link, and a named supervisor (Stephen Boyd Davis).

Lessons to borrow directly:

- A flat, dense, dated list is more credible than a sparse grid of tiles.
- The About page is the real load-bearing page; Talks / Writing / Exhibitions / Workshops lists signal ongoing activity without requiring new essays every week.
- Every deliverable gets a named venue and a year. No undated content.
- The home page does not need to summarise the whole site; it just needs to get the reader to the pages that do.
- Contact is one email, stated on the About page.

Contrasts with EMI:

- EMI is a research group, not an individual practitioner, so it needs a Collaborate surface that Vane does not; research threads, evaluation, and datasets need to be foregrounded.
- EMI's Home page should carry more explicit positioning copy than Vane's, because cold readers will not know what "Experimental Museum Interfaces" is.
- EMI should keep its navigation stable over decades, so prefer durable labels (Experiments, Research, Writing) over trend-specific ones.

**Europeana Pro's "Issue 11: Generous Interfaces"** is the reference for how cultural-heritage audiences expect this conversation to be framed. The EMI site should be legible as a peer contribution to that conversation, with language and reference patterns to match.

**Living with Machines** (Turing, British Library) is a reference for how to present a multi-institution research programme with a public face that works for both researchers and curators. EMI sits at a smaller scale but can borrow structure.

## 20. Appendix C: Socratic framing for v2 revisions

The PRD-writing guide referenced in the brief (ccforpms.com/advanced/write-prd) is a methodology for partnering with AI on PRDs rather than a fixed section template. Its most transferable artefact is a Socratic question set, applied below to EMI.

**Problem clarity.**

- What specific pain does a curator at a medium-sized museum feel that EMI uniquely addresses?
- What does a casual non-expert user gain from a generous interface that a search box cannot give them, stated as concretely as possible?
- What is the cost of cultural institutions not having exploratory interfaces, and who bears that cost?

**Solution validation.**

- Why is a public showcase site the right intervention, rather than (for example) a closed partnership programme or a journal special issue?
- What alternatives have been tried by peer groups, and what did they learn that EMI should inherit?
- What is the simplest version of this site that still credibly supports collaboration enquiries?

**Success criteria.**

- What ratio of demo completions to collaboration enquiries would count as a working funnel?
- How many cited uses of EMI demos in third-party publications per year would make the site research infrastructure rather than a portfolio?
- What would indicate failure clearly enough to trigger a rebuild?

**Constraints.**

- What technical commitments will make the site maintainable by a single postgraduate researcher?
- What are we not doing (teaching materials, grant-finding, consultancy) and how is that stated on the site without sounding curt?
- If the site had to launch in four weeks, what is the minimum content set?

**Strategic fit.**

- Why now, given that voice interfaces and AI-supported exploration are both at a tractable stage?
- How does this sit alongside Edge Hill's wider computer-science research profile without duplicating existing pages?
- How does this sit alongside peer sites (Vane, Whitelaw, Dörk, Hinrichs) without reading as derivative?

v2 should answer three of the five categories at the start of each major new section, and carry those answers into the copy on the actual site pages.

## 21. Appendix D: accuracy and gaps audit of v1

This appendix records what changed between v1 and v1.1 so that the methodology is transparent.

**What v1 got right.**

- The high-level strategic positioning as research infrastructure, not a conventional project site.
- The need for a Voice section and a Legacy section.
- The demonstration template and the catalogue categories.
- The recognition that the current site lacked credibility signals and a collaboration surface.
- The characterisation of the Experiments pages as thin project stubs.

**What v1 got wrong and has been corrected in v1.1.**

- EMI was guessed as "Exploratory Media Interaction"; the correct expansion is "Experimental Museum Interfaces". Fixed throughout.
- The current navigation was assumed to be "Home / People / Publications / Projects". It is actually **Home / About / Experiments / Literature Review.** Fixed in Section 3 and Section 7.
- The existence of a Literature Review page was missed. It is present and contains a credible section on generous interfaces citing Whitelaw (2012, 2015), Coburn (2016), Windhager (2019), and Speakman (2018). The Limitations-of-Browsing proposal has been rewritten as an evolution of that page rather than a replacement.
- The home page was assumed to be a positioning page with a name list. It is actually a **post-list page with a single September 2024 entry and an email sign-up form.** Fixed in Section 3.
- The URL typo `/experiements/` was not mentioned in v1. Added in Section 3.7, Section 7.0, and Section 17.
- The ccforpms.com reference was treated in v1 as a PRD-section template. It is actually a **Claude Code PRD-writing methodology** with a Socratic framework. Added as Section 20.
- Olivia Vane comparator notes in v1 were partial; v1.1 includes the actual navigation, the flat-list Projects pattern, and the cumulative About page as the load-bearing page.

**Gaps in v1.1 that a future v2 should close.**

- **Citation verification.** Section 12.3 lists anchor references to the authors' own work. These must be verified against Walsh's and Campbell's current publication lists and DOIs added.
- **Campbell's programme.** The PRD needs a direct contribution from Campbell about his active research threads so Section 7.3 can be tuned rather than assumed.
- **Partner list.** The Collaborate page spec needs confirmed names and the partner review process agreed with Edge Hill research office and data-protection lead.
- **Voice prototype detail.** Section 9 was written without sight of the current voice-controlled grid and voice-driven browsing prototypes; a v2 revision after a live demo walkthrough will sharpen the novelty claims.
- **Accessibility audit.** Full WCAG 2.2 AA review not yet performed on the current site; the PRD assumes it and should instead commission it.
- **Analytics plan.** Section 4.3 names metrics but does not specify the analytics implementation; v2 should name the tool, the events, and the dashboard.
- **Content inventory.** A full audit of content the authors already have (slides, posters, videos, preprints) has not been done; this should precede the Phase 1 launch content plan in Section 13.1.
- **Vane-style cumulative lists.** Sections 7.7 (Writing) and 7.8 (Collaborate) should be re-specified in v2 so that Talks, Press, and Exhibitions surfaces mirror the cumulative-list pattern that makes oliviavane.co.uk credible.

---

_End of PRD v1.1. Revisions should be versioned at the top of this file with a change log._
