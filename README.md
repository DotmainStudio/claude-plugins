# DotmainStudio Claude Plugins

Personal Claude Code plugin marketplace for DotmainStudio workflows.

## Install marketplace

```bash
claude plugin marketplace add https://github.com/DotmainStudio/claude-plugins
```

## Available plugins

| Plugin | Description |
|--------|-------------|
| `base-connector` | Full Relume design-to-code workflow — Figma → React mapping, page building |
| `base-react` | Find and use Relume React + HTML components (1072 components, manifest search) |
| `base-figma` | RELUME-KIT Figma guide — component catalog, naming conventions, design tokens |
| `color-scale-generator` | HEX → 0–100 color scale with semantic UI tokens |

## Install plugins

```bash
claude plugin install base-connector@dotmainstudio
claude plugin install base-react@dotmainstudio
claude plugin install base-figma@dotmainstudio
claude plugin install color-scale-generator@dotmainstudio
```

## New computer setup

```bash
# 1. Add marketplace
claude plugin marketplace add https://github.com/DotmainStudio/claude-plugins

# 2. Install all plugins
claude plugin install base-connector@dotmainstudio
claude plugin install base-react@dotmainstudio
claude plugin install base-figma@dotmainstudio
claude plugin install color-scale-generator@dotmainstudio

# 3. Clone component library
git clone https://github.com/DotmainStudio/relume-components

# 4. Set up global CLAUDE.md
cp relume-components/CLAUDE.global.md ~/.claude/CLAUDE.md
# Edit the local path in that file
```
