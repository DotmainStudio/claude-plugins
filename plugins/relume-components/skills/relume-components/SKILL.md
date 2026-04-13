---
name: relume-components
description: >
  Find and use Relume React + HTML components from the DotmainStudio code library.
  Use when the user asks to implement a UI section, build a page, find component code,
  or get the React/HTML code for a Relume component. Triggers include: "usa el componente
  de Relume", "dame el codigo del navbar", "implementa un hero", "busca el componente",
  "crea la seccion con Relume", "get the Relume code", or any request to build UI using
  the Relume library in code.
---

# Relume Components — Code Library

## Repository
- **GitHub**: https://github.com/DotmainStudio/relume-components (private)
- **Local** (varies by machine — check `~/.claude/CLAUDE.md` for the local path)

## Tech stack
React + TypeScript + Tailwind CSS + `@relume_io/relume-ui`

---

## How to find a component

**Step 1 — Read `manifest.json` first** (lightweight index, ~150KB, never skip this)

Each entry has:
```json
{
  "name": "Navbar 1",
  "category": "navbars",
  "slug": "navbar-1",
  "reactFile": "react/navbars.tsx",
  "htmlFile": "html/navbars.html",
  "figmaType": "Navbar",
  "figmaName": "Navbar / 1 /"
}
```

**Step 2 — Search by:**
- Category slug: `navbars`, `hero-header-sections`, `feature-sections`, etc.
- Component name: `Navbar 1`, `Layout 53`
- Figma name: `Navbar / 1 /`, `Layout / 53 /`

**Step 3 — Read only the relevant file**
```
react/navbars.tsx              → all navbar variants
react/hero-header-sections.tsx → hero headers (Layout 1–100+)
react/feature-sections.tsx     → feature sections (Layout 1–100)
```

Each file has components separated by:
```
// ============================================================
// Component Name
// ============================================================
```

---

## Category → File mapping (50 categories)

| Category | React file | HTML file |
|----------|-----------|-----------|
| navbars | react/navbars.tsx | html/navbars.html |
| footers | react/footers.tsx | html/footers.html |
| hero-header-sections | react/hero-header-sections.tsx | html/hero-header-sections.html |
| header-sections | react/header-sections.tsx | html/header-sections.html |
| feature-sections | react/feature-sections.tsx | html/feature-sections.html |
| cta-sections | react/cta-sections.tsx | html/cta-sections.html |
| contact-sections | react/contact-sections.tsx | html/contact-sections.html |
| pricing-sections | react/pricing-sections.tsx | html/pricing-sections.html |
| faq-sections | react/faq-sections.tsx | html/faq-sections.html |
| testimonial-sections | react/testimonial-sections.tsx | html/testimonial-sections.html |
| logo-sections | react/logo-sections.tsx | html/logo-sections.html |
| team-sections | react/team-sections.tsx | html/team-sections.html |
| blog-header-sections | react/blog-header-sections.tsx | html/blog-header-sections.html |
| blog-sections | react/blog-sections.tsx | html/blog-sections.html |
| stats-sections | react/stats-sections.tsx | html/stats-sections.html |
| multi-step-forms | react/multi-step-forms.tsx | html/multi-step-forms.html |
| testimonial-sections | react/testimonial-sections.tsx | html/testimonial-sections.html |
| application-shells | react/application-shells.tsx | html/application-shells.html |
| tables | react/tables.tsx | html/tables.html |
| forms | react/forms.tsx | html/forms.html |
| sidebars | react/sidebars.tsx | html/sidebars.html |
| sign-up-and-log-in-pages | react/sign-up-and-log-in-pages.tsx | html/sign-up-and-log-in-pages.html |

*(see manifest.json for all 50 categories)*

---

## Usage rules

1. **Always read manifest first** — never read category files blindly
2. **Read only what you need** — don't load multiple large files at once
3. **Adapt, don't copy** — use the component as a base, adjust content and props
4. **Both formats available** — React (`.tsx`) and HTML (`.html`) for every component
