---
name: base-figma
description: >
  Working guide for the RELUME-KIT Figma file (r8zlPV51ULZouN5JUylrN7). Use this skill
  whenever the user asks to design, select, reference, or compose sections and components
  using Relume in Figma. Triggers include: "usa el componente de Relume", "abre el Navbar",
  "pon un Header", "crea una sección con Relume", "usa el kit de Relume", "agrega un footer",
  "diseña con Relume", "selecciona un layout", or any request involving sections, templates
  or page building in Figma using this kit. Always load this skill before touching any
  Relume component in the RELUME-KIT file.
---

# Relume Figma Kit — Skill

## File Reference
- **File key**: `r8zlPV51ULZouN5JUylrN7`
- **File name**: RELUME-KIT
- **Link**: https://www.figma.com/design/r8zlPV51ULZouN5JUylrN7/RELUME-KIT

---

## Component Naming Convention

All components in this file follow a strict naming pattern:

```
ComponentType / Number /
```

Examples:
- `Navbar / 1 /` → `Navbar / 32 /`
- `Header / 1 /` → `Header / 157 /`
- `Layout / 1 /` → `Layout / 682 /`
- `Footer / 1 /` → `Footer / 17 /`

All are `COMPONENT_SET` type nodes. When referencing a component, always use this exact
format. The trailing slash is part of the name.

---

## Page & Component Catalog

### MARKETING COMPONENTS

| Page (in Figma) | Component Type | Range | Count |
|---|---|---|---|
| ↳  Navbars | `Navbar` | 1–32 | 32 |
| ↳  Footers | `Footer` | 1–17 | 17 |
| ↳  Hero Headers ✨ NEW | `Header` | 1–43, 71–157 | 130 |
| ↳  Headers | `Header` | 44–70 | 27 |
| ↳  Features | `Layout` | 1–682 | 682 |
| ↳  Careers | `Career` | 1–27 | 27 |
| ↳  Gallery | `Gallery` | 1–27 | 27 |
| ↳  Contact | `Contact` | 1–30 | 30 |
| ↳  FAQ | `FAQ` | 1–14 | 14 |
| ↳  Pricing | `Pricing` | 1–57 | 57 |
| ↳  Testimonials | `Testimonial` | 1–67 | 67 |
| ↳  Logos | `Logo` | 1–6 | 6 |
| ↳  Team | `Team` | 1–22 | 22 |
| ↳  Timelines | `Timeline` | 1–21 | 21 |
| ↳  CTA ✨ NEW | `CTA` | 1–67 | 67 |
| ↳  Cookie Consent | `Cookie` | 1–5 | 5 |
| ↳  Blog Headers | `Blog Header` | 1–32 | 32 |
| ↳  Blog Sections | `Blog Section` | 1–36 | 36 |
| ↳  Blog Post Headers | `Blog Post Header` | 1–5 | 5 |
| ↳  Banners | `Banner` | 1–16 | 16 |
| ↳  Contact Modals | `Contact Modal` | 1–6 | 6 |
| ↳  Comparisons | `Comparison` | 1–15 | 15 |
| ↳  Portfolio Sections | `Portfolio Section` | 1–23 | 23 |
| ↳  Portfolio Headers | `Portfolio Header` | 1–12 | 12 |
| ↳  Event Sections | `Event Section` | 1–37 | 37 |
| ↳  Event Headers | `Event Header` | 1–6 | 6 |
| ↳  Event Item Headers | `Event Item Header` | 1–11 | 11 |
| ↳  Stats Sections | `Stats` | 1–60 | 60 |
| ↳  Multi-step Forms | `Form` | 1–46 | 46 |
| ↳  Long Form Content Sections | `Content` | 1–32 | 32 |
| ↳  Loaders | `Loader` | 1–5 | 5 |
| ↳  Links pages | `Links` | 1–16 | 16 |

### ECOMMERCE COMPONENTS

| Page (in Figma) | Component Type | Range | Count |
|---|---|---|---|
| ↳  Product Headers | `Product Header` | 1–9 | 9 |
| ↳  Product List Sections | `Product List` | 1–12 | 12 |
| ↳  Category Filters | `Category Filter` | 1–6 | 6 |

### APPLICATION COMPONENTS

| Page (in Figma) | Component Type | Range | Count |
|---|---|---|---|
| ↳  Application Shells | `App Shell` | 1–16 | 16 |
| ↳  Sidebars | `Sidebar` | 1–12 | 12 |
| ↳  Topbars | `Topbar` | 1–8 | 8 |
| ↳  Page Headers | `Page Header` | 1–5 | 5 |
| ↳  Section Headers | `Section Header` | 1–4 | 4 |
| ↳  Card Headers | `Card Header` | 1–2 | 2 |
| ↳  Sign Up and Log In Pages | `Auth Page` | 1–17 | 17 |
| ↳  Sign Up and Log In Modals | `Auth Modal` | 1–5 | 5 |
| ↳  Onboarding Forms | `Onboarding` | 1–17 | 17 |
| ↳  Tables | `Table` | 1–10 | 10 |
| ↳  Stacked Lists | `Stacked List` | 1–10 | 10 |
| ↳  Grid Lists | `Grid List` | 1–10 | 10 |
| ↳  Stat Cards | `Stat Card` | 1–8 | 8 |
| ↳  Forms | `Form` | 1–20 | 20 |
| ↳  Description Lists | `Description List` | 1–4 | 4 |

### PAGE TEMPLATES

| Page (in Figma) | Count |
|---|---|
| ↳  Home Pages | 8 |
| ↳  Pricing Pages | 5 |
| ↳  About Pages | 5 |
| ↳  Contact Pages | 5 |
| ↳  Blog Pages | 5 |
| ↳  Blog Post Pages | 5 |
| ↳  Portfolio Pages | 7 |
| ↳  Legal Pages | 2 |

---

## Design System (Variables)

See `references/variables.md` for the full token system. Summary:

- **Color Scheme**: `Color Scheme 1/{Text|Foreground|Background|Border|Accent}` — supports Light/Dark mode switching
- **Primitives**: Neutral scale + Opacity tokens + Primary/Secondary color scales (2–98)
- **Radius**: XSmall=4, Small=8, Medium=16, Large=24, XLarge=32, Round=999
- **Typography**: H1–H6 + Text scales, with Desktop/Mobile breakpoints
- **Spacing**: Container large=1280, medium=1024, small=768

---

## Style Guide Page

The `↳  Style Guide` page (id: `2368:52`) contains 7 frames:
- `Icons` — icon library
- `Logos` — logo assets
- `Shadows` — shadow styles
- `Radius` — corner radius reference
- `UI Elements` — base UI components
- `Variables` — visual variable reference
- `Typography` — type scale reference

---

## Working with Components

### To place a component from the kit:
1. Use `figma.variables.getLocalVariableCollections()` to access tokens
2. Navigate to the correct page for the component type
3. Reference the component by exact name: `ComponentType / N /`
4. Use `importComponentSetByKeyAsync` or search by name within the page

### Variant structure:
Components are `COMPONENT_SET` nodes. Each set contains variants — typically a
`Default` variant and optionally `Dark`, `Alternate`, or breakpoint-specific variants.
Always check the component's `variantProperties` before instantiating.

### Applying design tokens:
- Use `Color Scheme 1` variables for semantic colors (text, bg, border, accent)
- Use `Primitives` for raw color values
- Use `Typography` variables for consistent font sizes across breakpoints
- Use `UI Styles` for radius and stroke values

---

## Quick Reference: Most Used Components

For landing pages, the typical flow is:
1. **Navbar** (1–32) — navigation
2. **Header / Hero** (1–157) — hero section
3. **Layout** (1–682) — feature sections (most versatile, 682 options)
4. **Testimonial** (1–67) — social proof
5. **Pricing** (1–57) — pricing tables
6. **CTA** (1–67) — conversion sections
7. **Footer** (1–17) — footer

For app UIs, use: App Shell → Sidebar/Topbar → Page Header → Tables/Lists/Forms
