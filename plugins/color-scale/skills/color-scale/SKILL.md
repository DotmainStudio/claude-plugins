---
name: color-scale
description: >
  Descompone cualquier color HEX en una escala completa de 0 a 100 tonos, manteniendo la esencia del color (hue y saturación) variando solo la luminosidad. Genera tokens semánticos para UI (fondos claros, fondos oscuros, texto, acentos, bordes). Usa esta skill siempre que el usuario mencione: descomponer un color, generar escala de colores, paleta de colores, tonos de un color, escala de grises de un color, colores para una interfaz, design tokens, color para fondo/texto/acento, o cuando pida trabajar con un HEX y extraer variaciones. También trigerea con frases como "dame los tonos de este color", "genera una paleta", "quiero los colores de un azul para mi web".
---

# Color Scale Skill

Este skill toma un color HEX como entrada y genera una escala completa de tonos, útil para diseño de interfaces web y sistemas de diseño.

## Qué hace esta skill

1. **Recibe** un color HEX (ej: `#ECEAE3`)
2. **Genera** una escala de 0–100 usando interpolación HSL seed-relativa (el seed define su posición natural en la escala según su luminosidad HSL)
3. **Identifica** la posición exacta del color semilla en la escala
4. **Sugiere tokens semánticos** para uso en UI

## Algoritmo correcto: interpolación HSL seed-relativa

**Importante**: usar HSL (no OKLCH) para la interpolación. OKLCH comprime el gamut cerca del negro/blanco, haciendo que los tonos extremos (2–10, 90–98) sean indistinguibles. HSL preserva el hue incluso a luminosidades muy bajas o muy altas.

El algoritmo es:

```javascript
function hexToRgb(hex) {
  hex = hex.replace('#','');
  if(hex.length===3) hex=hex.split('').map(c=>c+c).join('');
  return [parseInt(hex.slice(0,2),16), parseInt(hex.slice(2,4),16), parseInt(hex.slice(4,6),16)];
}

function rgbToHsl(r, g, b) {
  r/=255; g/=255; b/=255;
  const max=Math.max(r,g,b), min=Math.min(r,g,b);
  let h, s, l=(max+min)/2;
  if(max===min){ h=s=0; }
  else {
    const d=max-min;
    s=l>0.5 ? d/(2-max-min) : d/(max+min);
    h=max===r ? (g-b)/d+(g<b?6:0) : max===g ? (b-r)/d+2 : (r-g)/d+4;
    h/=6;
  }
  return {h, s, l};
}

function hslToHex(h, s, l) {
  let r, g, b;
  if(s===0){ r=g=b=l; }
  else {
    const hue2rgb=(p,q,t)=>{
      if(t<0)t+=1; if(t>1)t-=1;
      if(t<1/6) return p+(q-p)*6*t;
      if(t<1/2) return q;
      if(t<2/3) return p+(q-p)*(2/3-t)*6;
      return p;
    };
    const q=l<0.5 ? l*(1+s) : l+s-l*s;
    const p=2*l-q;
    r=hue2rgb(p,q,h+1/3);
    g=hue2rgb(p,q,h);
    b=hue2rgb(p,q,h-1/3);
  }
  r=Math.round(r*255); g=Math.round(g*255); b=Math.round(b*255);
  return '#'+[r,g,b].map(v=>v.toString(16).padStart(2,'0')).join('');
}

// Algoritmo principal: seed-relativo
function calculateColorScale(hex) {
  const [r,g,b] = hexToRgb(hex);
  const {h, s, l} = rgbToHsl(r, g, b);
  const seedPos = Math.round(l * 100); // posición natural del seed (0–100)
  const scale = new Array(101);

  for(let i=0; i<=100; i++) {
    if(i < seedPos) {
      const factor = seedPos > 0 ? i / seedPos : 0;
      scale[i] = hslToHex(h, s, l * factor);
    } else if(i > seedPos) {
      const factor = (100 - seedPos) > 0 ? (i - seedPos) / (100 - seedPos) : 1;
      scale[i] = hslToHex(h, s, l + (1 - l) * factor);
    } else {
      scale[i] = hslToHex(h, s, l);
    }
  }
  return scale; // índice 0=negro, 100=blanco, seedPos=color original
}
```

**Comportamiento clave**:
- El seed `#ECEAE3` (HSL l≈0.91) cae en la posición **91** de la escala
- Los pasos 0–90 van de negro a `#ECEAE3`, preservando el hue cálido en todos los tonos
- Los pasos 91–100 van de `#ECEAE3` a blanco puro
- El índice 2 de `#ECEAE3` da `#060604` (negro-cálido distinguible, no negro puro)

## Pasos personalizados

Para mostrar solo un subconjunto de pasos (ej: 2, 4, 6, 8, 10, 20, 30, 40, 50, 60, 70, 80, 90, 92, 94, 96, 98):

```javascript
const STEPS = [2, 4, 6, 8, 10, 20, 30, 40, 50, 60, 70, 80, 90, 92, 94, 96, 98];
const scale = calculateColorScale(hex);
const result = STEPS.map(step => ({ step, hex: scale[step] }));
```

## Tokens semánticos

```javascript
function getSemanticTokens(scale, seedPos) {
  return {
    'bg-page':      scale[Math.min(98, seedPos + 7)],
    'bg-subtle':    scale[Math.min(96, seedPos + 5)],
    'bg-muted':     scale[Math.min(92, seedPos + 1)],
    'border':       scale[Math.max(0, seedPos - 10)],
    'border-strong':scale[Math.max(0, seedPos - 20)],
    'accent':       scale[seedPos],
    'accent-dark':  scale[Math.max(0, seedPos - 8)],
    'text-muted':   scale[Math.max(0, seedPos - 30)],
    'text-base':    scale[Math.max(0, seedPos - 50)],
    'text-strong':  scale[Math.max(0, seedPos - 70)],
    'bg-dark':      scale[Math.max(0, seedPos - 60)],
    'bg-darker':    scale[Math.max(0, seedPos - 80)],
  };
}
```

## Cuándo mostrar qué

- **"descompon este color"** / **"genera la escala"**: mostrar los 17 pasos estándar (2,4,6,8,10,20,30,40,50,60,70,80,90,92,94,96,98) como artifact visual con tarjetas + HEX
- **"dame el tono X"**: devolver solo el HEX del paso solicitado
- **"para UI" / "tokens"**: mostrar tabla de tokens semánticos con nombre → HEX → uso
- **Escala completa 0–100**: mostrar todos los 101 valores como tira visual

## Notas importantes

- **No usar OKLCH para esta interpolación**: colapsa los tonos 2–10 a negro puro (#000000) porque comprime el gamut en los extremos. HSL preserva el hue cálido/frío incluso en negros casi puros.
- Variante desaturada: reducir `s` al 50% antes de generar (`s * 0.5`)
- Color neutro (s < 0.05): avisar que la escala será casi un gris sin temperatura de color
