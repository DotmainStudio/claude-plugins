# skills

Claude Code skills for the Relume platform. Install these to use Relume components efficiently in any project.

## Install

```bash
./install.sh
```

Copies all plugins to `~/.claude/plugins/`. Restart Claude Code after installing.

## Skills

| Skill | Trigger | Purpose |
|---|---|---|
| `base-react` | "usa componente React", "dame el código del navbar" | Find and use React components from manifest |
| `base-figma` | "abre en Figma", "componente de Figma" | Work with components in RELUME-KIT Figma file |
| `base-connector` | "diseña con Relume", "pasa de Figma a código" | Bridge Figma file ↔ React code library |
| `color-scale-generator` | "descompone color", "genera paleta", "escala de colores" | Decompose a HEX into a full design token scale |
| `platform-connector` | "replica en todos los formatos", "Figma a React/HTML/Webflow" | Full cross-platform workflow: Figma → React + HTML + Webflow |

## Adding a new skill

1. Create `plugins/<skill-name>/skills/<skill-name>.md`
2. Run `./install.sh` to install
3. Restart Claude Code

## Related repos

- `components` — component data (manifest, React, HTML, Webflow)
- `scrapper` — extraction and sync tooling
