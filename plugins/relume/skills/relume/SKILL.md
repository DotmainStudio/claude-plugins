---
name: relume
description: >
  Full Relume workflow — bridges the RELUME-KIT Figma file with the React code library.
  Use when the user wants to go from a Figma design to code, pick a Relume component for
  a section, build a full page with Relume, or needs help deciding which component fits
  their design. Triggers include: "diseña con Relume", "usa Relume para esta pagina",
  "que componente de Relume uso aqui", "pasa este diseño de Figma a codigo", "construye
  esta pagina con Relume", or any end-to-end Relume design-to-code workflow.
---

# Relume — Design to Code Workflow

Two resources work together:
- **Figma**: RELUME-KIT file (`r8zlPV51ULZouN5JUylrN7`) — use `relume-figma` skill for details
- **Code**: `DotmainStudio/relume-components` repo — use `relume-components` skill for details

---

## Figma name → Code file mapping

| Figma component | Figma range | Code category | Code file |
|---|---|---|---|
| `Navbar / N /` | 1–32 | navbars | react/navbars.tsx |
| `Footer / N /` | 1–17 | footers | react/footers.tsx |
| `Header / N /` | 1–43, 71–157 | hero-header-sections | react/hero-header-sections.tsx |
| `Header / N /` | 44–70 | header-sections | react/header-sections.tsx |
| `Layout / N /` | 1–682 | feature-sections | react/feature-sections.tsx |
| `CTA / N /` | 1–67 | cta-sections | react/cta-sections.tsx |
| `Testimonial / N /` | 1–67 | testimonial-sections | react/testimonial-sections.tsx |
| `Pricing / N /` | 1–57 | pricing-sections | react/pricing-sections.tsx |
| `FAQ / N /` | 1–14 | faq-sections | react/faq-sections.tsx |
| `Contact / N /` | 1–30 | contact-sections | react/contact-sections.tsx |
| `Stats / N /` | 1–60 | stats-sections | react/stats-sections.tsx |
| `Blog Header / N /` | 1–32 | blog-header-sections | react/blog-header-sections.tsx |
| `Blog Section / N /` | 1–36 | blog-sections | react/blog-sections.tsx |
| `Form / N /` | 1–46 | multi-step-forms | react/multi-step-forms.tsx |
| `Form / N /` | 1–20 | forms | react/forms.tsx |
| `App Shell / N /` | 1–16 | application-shells | react/application-shells.tsx |
| `Table / N /` | 1–10 | tables | react/tables.tsx |
| `Auth Page / N /` | 1–17 | sign-up-and-log-in-pages | react/sign-up-and-log-in-pages.tsx |
| `Auth Modal / N /` | 1–5 | sign-up-and-log-in-modals | react/sign-up-and-log-in-modals.tsx |
| `Sidebar / N /` | 1–12 | sidebars | react/sidebars.tsx |
| `Onboarding / N /` | 1–17 | onboarding-forms | react/onboarding-forms.tsx |
| `Career / N /` | 1–27 | career-sections | react/career-sections.tsx |
| `Gallery / N /` | 1–27 | gallery-sections | react/gallery-sections.tsx |
| `Team / N /` | 1–22 | team-sections | react/team-sections.tsx |
| `Timeline / N /` | 1–21 | timeline-sections | react/timeline-sections.tsx |
| `Banner / N /` | 1–16 | banners | react/banners.tsx |
| `Logo / N /` | 1–6 | logo-sections | react/logo-sections.tsx |
| `Comparison / N /` | 1–15 | comparison-sections | react/comparison-sections.tsx |
| `Product Header / N /` | 1–9 | product-headers | react/product-headers.tsx |
| `Product List / N /` | 1–12 | product-list-sections | react/product-list-sections.tsx |
| `Stacked List / N /` | 1–10 | stacked-lists | react/stacked-lists.tsx |
| `Grid List / N /` | 1–10 | grid-lists | react/grid-lists.tsx |
| `Stat Card / N /` | 1–8 | stat-cards | react/stat-cards.tsx |

> **Note**: Figma has more variants than the code repo for some types (e.g. Layout has 682 in Figma, 100 in code). If N > available range, use the closest match.

---

## Workflow: Figma → Code

### Starting from a Figma design (with Figma MCP)
1. Get the component name from Figma (e.g. `Navbar / 14 /`)
2. Look up the mapping table above → `navbars` → `react/navbars.tsx`
3. Search `manifest.json` for `figmaName: "Navbar / 14 /"` to confirm entry
4. Read the section in `react/navbars.tsx` for `Navbar 14`
5. Deliver the code, adapt content to the project

### Starting from a screenshot or description
1. Identify the UI pattern (navbar, hero, features, etc.)
2. Ask the user if they have a specific variant number in mind
3. Read `manifest.json` → filter by category
4. Read the relevant `.tsx` file → find the best match
5. Deliver and adapt

### Building a full page
For each section of the page:
1. Identify the section type
2. Find the matching component
3. Compose the page with the selected components
4. Keep consistent design tokens (see `relume-figma` skill for token reference)

---

## Design tokens (quick reference)

From the RELUME-KIT variables:
- Colors: `Color Scheme 1/{Text|Background|Border|Accent}` — supports Light/Dark
- Typography: H1=56px → H6=20px (desktop), scales down on mobile
- Radius: XSmall=4, Small=8, Medium=16, Large=24, Round=999
- Containers: large=1280, medium=1024, small=768

In Tailwind (React code): `text-text-primary`, `bg-background-primary`, `border-border-primary`
