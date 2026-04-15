---
name: platform-connector
description: >
  Full cross-platform Relume workflow — given any Figma component, output it in React,
  HTML, and/or Webflow. Also handles the reverse: new component from Webflow added to all
  formats. Use when the user wants to go from Figma to code in multiple formats, replicate
  a design across platforms, or propagate a new component across the full stack.
  Triggers: "usa este componente en React/HTML/Webflow", "replica este diseño en código",
  "pasa de Figma a todos los formatos", "agregar nuevo componente desde Webflow",
  "dame el código en todos los formatos", any cross-platform component request.
---

# Relume Platform Connector

Three repos, one unified manifest:

| Repo | Local path | GitHub |
|---|---|---|
| `components` | `D:/PROJECTS/PERSONAL/DESIGN REPOSITORY/CODE/REACT RELUME/components` | DotmainStudio/components |
| `scrapper` | `D:/PROJECTS/PERSONAL/DESIGN REPOSITORY/CODE/REACT RELUME/scrapper` | DotmainStudio/scrapper |
| `skills` | `D:/PROJECTS/PERSONAL/DESIGN REPOSITORY/CODE/REACT RELUME/skills` | DotmainStudio/skills |

---

## Manifest schema

Every component in `components/manifest.json` has:

```json
{
  "name": "Navbar 1",
  "category": "navbars",
  "slug": "navbar-1",
  "figmaName": "Navbar / 1 /",
  "figmaNodeId": "4172:6205",
  "figmaVariants": ["Desktop", "Mobile"],
  "reactFile": "react/navbars.tsx",
  "htmlFile": "html/navbars.html",
  "webflowFile": "webflow-json/navbars.json"
}
```

All 1072 components have `figmaNodeId` and `figmaVariants` set. The manifest is the
single source of truth — always read it first.

---

## Figma name → category mapping

| Figma component | Category | Figma range |
|---|---|---|
| `Navbar / N /` | navbars | 1–32 |
| `Footer / N /` | footers | 1–17 |
| `Header / N /` | hero-header-sections | 1–43, 71–157 |
| `Header / N /` | header-sections | 44–70 |
| `Layout / N /` | feature-sections | 1–682 |
| `CTA / N /` | cta-sections | 1–67 |
| `Contact / N /` | contact-sections | 1–30 |
| `Pricing / N /` | pricing-sections | 1–57 |
| `FAQ / N /` | faq-sections | 1–14 |
| `Testimonial / N /` | testimonial-sections | 1–67 |
| `Logo / N /` | logo-sections | 1–6 |
| `Team / N /` | team-sections | 1–22 |
| `Blog / N /` | blog-header-sections | 1–32 |
| `Blog / N /` | blog-sections | 1–36 |
| `Blog Post Header / N /` | blog-post-headers | 1–5 |
| `Career / N /` | career-sections | 1–27 |
| `Gallery / N /` | gallery-sections | 1–27 |
| `Contact Modal / N /` | contact-modals | 1–6 |
| `Portfolio / N /` | portfolio-sections | 1–23 |
| `Portfolio Header / N /` | portfolio-headers | 1–12 |
| `Event / N /` | event-sections | 1–37 |
| `Event Header / N /` | event-headers | 1–6 |
| `Event Item Header / N /` | event-item-headers | 1–11 |
| `Stats / N /` | stats-sections | 1–60 |
| `Multi Form / N /` | multi-step-forms | 1–46 |
| `Form / N /` | forms | 1–20 |
| `Content / N /` | long-form-content-sections | 1–32 |
| `Loader / N /` | loaders | 1–5 |
| `Timeline / N /` | timeline-sections | 1–21 |
| `Comparison / N /` | comparison-sections | 1–15 |
| `Cookie / N /` | cookie-consent | 1–5 |
| `Banner / N /` | banners | 1–16 |
| `Links N` | link-pages | 1–16 |
| `Product / N /` | product-list-sections | 1–12 |
| `Product Header / N /` | product-headers | 1–9 |
| `Category Filters / N /` | category-filters | 1–6 |
| `Application Shell / N /` | application-shells | 1–16 |
| `Sidebar / N /` | sidebars | 1–12 |
| `Topbar / N /` | topbars | 1–8 |
| `Page Header / N /` | page-headers | 1–5 |
| `Section Header / N /` | section-headers | 1–4 |
| `Card Header / N /` | card-headers | 1–2 |
| `Sign up / N /` | sign-up-and-log-in-pages | sign-up variants |
| `Login / N /` | sign-up-and-log-in-pages | login variants |
| `Sign up - Modal / N /` | sign-up-and-log-in-modals | sign-up modal variants |
| `Login - Modal / N /` | sign-up-and-log-in-modals | login modal variants |
| `Onboarding Form / N /` | onboarding-forms | 1–17 |
| `Table / N /` | tables | 1–10 |
| `Stacked List / N /` | stacked-lists | 1–10 |
| `Grid List / N /` | grid-lists | 1–10 |
| `Stat Card / N /` | stat-cards | 1–8 |
| `Description List / N /` | description-lists | 1–4 |

> **Note on `Blog / N /`**: `blog-header-sections` and `blog-sections` both use `Blog / N /`
> as their Figma name. Use the category to disambiguate — check both in the manifest if needed.
>
> **Note on Layouts vs code**: Figma has 682 `Layout` components; the code repo covers ~100
> of the most common ones. If N > available range, use the closest match.

---

## Workflow 1: Figma → React + HTML + Webflow

### Step 1 — Identify the component

From Figma (if Figma MCP is active):
- Get the exact component name from Figma: `Navbar / 14 /`
- Note the `figmaNodeId` if you can see it

From user message or description:
- Determine the component type and number (e.g. "Navbar 14", "header section 23")

### Step 2 — Look up the manifest

```
Read: components/manifest.json
Filter by: figmaName === "Navbar / 14 /" (or by name/slug/category)
```

From the matching entry, extract:
- `figmaNodeId` → use with Figma MCP to read live component data
- `figmaVariants` → available breakpoints/variants
- `reactFile` → path to React source
- `htmlFile` → path to HTML source
- `webflowFile` → path to Webflow JSON

### Step 3 — Read live Figma data (if MCP available)

With `figmaNodeId`, use the Figma MCP server to:
- Read the actual component content (text, images, layout)
- Check which variant is active (Desktop vs Mobile)
- Extract real content to populate the code output

### Step 4 — Output the requested format(s)

**React:**
- Read `reactFile` (e.g. `react/navbars.tsx`)
- Locate the component section using the separator pattern:
  ```
  // ============================================================
  // Navbar 14
  // ============================================================
  ```
- Adapt: replace placeholder text/images with actual content, adjust props

**HTML:**
- Read `htmlFile` (e.g. `html/navbars.html`)
- Locate the same component by its HTML comment marker
- Adapt structure for the target context

**Webflow:**
- Read `webflowFile` (e.g. `webflow-json/navbars.json`)
- Extract the relevant component JSON
- Adapt content fields before importing to Webflow

### Step 5 — Deliver

Present the requested format(s). If the user didn't specify, ask:
> "¿Qué formato necesitas? React, HTML, Webflow, o todos?"

---

## Workflow 2: Webflow → all formats (new component)

When a new component is built in Webflow and needs to propagate:

1. **Export** Webflow component JSON
2. **Place** in `components/webflow-json/<category>.json`
3. **Add entry** to `components/manifest.json`:
   ```json
   {
     "name": "<ComponentType> <N>",
     "category": "<category>",
     "slug": "<component-type>-<n>",
     "figmaName": "<FigmaType> / <N> /",
     "figmaNodeId": "",
     "figmaVariants": [],
     "reactFile": "react/<category>.tsx",
     "htmlFile": "html/<category>.html",
     "webflowFile": "webflow-json/<category>.json"
   }
   ```
4. **Guide React/HTML creation** if needed — derive from Webflow structure
5. **Design in Figma** under RELUME-KIT — get `figmaNodeId`
6. **Run** `scrapper/figma/extract-nodes.js` to fill in `figmaNodeId` + `figmaVariants`

---

## Design tokens (quick reference)

From RELUME-KIT variables — use these when adapting components:

| Token type | Values |
|---|---|
| Colors | `Color Scheme 1/{Text|Background|Border|Accent}` — Light/Dark |
| Typography | H1=56px → H6=20px (desktop); scales down on mobile |
| Radius | XSmall=4, Small=8, Medium=16, Large=24, Round=999 |
| Containers | large=1280, medium=1024, small=768 |

In Tailwind (React): `text-text-primary`, `bg-background-primary`, `border-border-primary`
