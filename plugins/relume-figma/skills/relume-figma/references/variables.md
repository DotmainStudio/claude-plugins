# Relume Kit — Design Tokens Reference

## Variable Collections

### 1. Color Schemes
**Modes**: Light, Dark

| Variable | Light (alias) | Dark (alias) |
|---|---|---|
| `Color Scheme 1/Text` | Neutral Darkest (#000000) | White (#FFFFFF) |
| `Color Scheme 1/Foreground` | Primitives/Color Primary/Base | Primitives alias |
| `Color Scheme 1/Background` | White (#FFFFFF) | Neutral Darkest (#000000) |
| `Color Scheme 1/Border` | Neutral Darkest 20% opacity | Neutral Darkest 30% opacity |
| `Color Scheme 1/Accent` | Primary Base | Primary Base |

**Usage**: Apply `Color Scheme 1` variables to components. Switch mode to toggle Light/Dark.
These are semantic aliases — they reference Primitives, not raw values.

---

### 2. Primitives
**Modes**: Mode 1 (single mode — raw values)

#### Neutral Scale
| Variable | Hex |
|---|---|
| `Color/White` | #FFFFFF |
| `Color/Neutral Lightest` | #EEEEEE |
| `Color/Neutral Lighter` | #CCCCCC |
| `Color/Neutral Light` | #AAAAAA |
| `Color/Neutral` | #666666 |
| `Color/Neutral Dark` | #444444 |
| `Color/Neutral Darker` | #222222 |
| `Color/Neutral Darkest` | #000000 |

#### Opacity — White
| Variable | Alpha |
|---|---|
| `Opacity/Transparent` | 0% |
| `Opacity/White 5` | 5% |
| `Opacity/White 10` | 10% |
| `Opacity/White 15` | 15% |
| `Opacity/White 20` | 20% |
| `Opacity/White 30` | 30% |
| `Opacity/White 40` | 40% |
| `Opacity/White 50` | 50% |
| `Opacity/White 60` | 60% |

#### Opacity — Black (Neutral Darkest)
| Variable | Alpha |
|---|---|
| `Opacity/Neutral Darkest 5` | 5% |
| `Opacity/Neutral Darkest 10` | 10% |
| `Opacity/Neutral Darkest 15` | 15% |
| `Opacity/Neutral Darkest 20` | 20% |
| `Opacity/Neutral Darkest 30` | 30% |
| `Opacity/Neutral Darkest 40` | 40% |
| `Opacity/Neutral Darkest 50` | 50% |
| `Opacity/Neutral Darkest 60` | 60% |

#### Primary Color Scale
Steps: `Base, 2, 4, 6, 8, 10, 20, 30, 40, 50, 60, 70, 80, 90, 92, 94, 96, 98`
Variable name pattern: `Color Primary/{step}`
Note: Default values are all white — **the user must define their brand color here**.

#### Secondary Color Scale
Same structure as Primary. Steps: `Base, 2, 4, 6, 8, 10, 20, 30, 40, 50, 60, 70, 80, 90, 92, 94, 96, 98`
Variable name pattern: `Color Secondary/{step}`

---

### 3. UI Styles
**Modes**: Mode 1

#### Border Radius
| Variable | Value (px) |
|---|---|
| `Radius/XSmall` | 4 |
| `Radius/Small` | 8 |
| `Radius/Medium` | 16 |
| `Radius/Large` | 24 |
| `Radius/XLarge` | 32 |
| `Radius/Round` | 999 (pill shape) |

#### Stroke / Border
| Variable | Value (px) |
|---|---|
| `Stroke/Border Width` | 1 |
| `Stroke/Divider Width` | 1 |

---

### 4. Typography
**Modes**: Desktop, Mobile

| Variable | Desktop (px) | Mobile (px) |
|---|---|---|
| `Text Sizes/Heading 1` | 56 | 40 |
| `Text Sizes/Heading 2` | 48 | 36 |
| `Text Sizes/Heading 3` | 40 | 32 |
| `Text Sizes/Heading 4` | 32 | 24 |
| `Text Sizes/Heading 5` | 24 | 20 |
| `Text Sizes/Heading 6` | 20 | 18 |
| `Text Sizes/Text Large` | 20 | 18 |
| `Text Sizes/Text Medium` | 18 | 16 |
| `Text Sizes/Text Regular` | 16 | 16 |
| `Text Sizes/Text Small` | 14 | 14 |
| `Text Sizes/Text Tiny` | 12 | 12 |

---

### 5. Spacing & Sizing
**Modes**: Desktop, Mobile

#### Containers
| Variable | Desktop (px) | Mobile (px) |
|---|---|---|
| `Container/container-large` | 1280 | 1280 |
| `Container/container-medium` | 1024 | 1024 |
| `Container/container-small` | 768 | 768 |

#### Max Widths
| Variable | Desktop (px) | Mobile (px) |
|---|---|---|
| `Max Width/max-width-xxlarge` | 1280 | 1280 |
| `Max Width/max-width-xlarge` | 1024 | 1024 |
| `Max Width/max-width-large` | 768 | 768 |
| `Max Width/max-width-medium` | 560 | 560 |

---

## How to Apply Variables in Code (use_figma)

```javascript
// Get a variable by name
const collections = figma.variables.getLocalVariableCollections();
const uiStyles = collections.find(c => c.name === 'UI Styles');
const typo = collections.find(c => c.name === 'Typography');

// Apply a variable to a node property
const radiusMedium = figma.variables.getLocalVariables()
  .find(v => v.name === 'Radius/Medium');

node.setBoundVariable('cornerRadius', radiusMedium);

// Switch color scheme mode (Light/Dark)
const colorSchemes = collections.find(c => c.name === 'Color Schemes');
const lightMode = colorSchemes.modes.find(m => m.name === 'Light');
// Apply mode to a frame:
frame.setExplicitVariableModeForCollection(colorSchemes, lightMode.modeId);
```
