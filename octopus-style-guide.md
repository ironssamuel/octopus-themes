# Octopus Theme — Style Guide

A reference for contributors porting the Octopus theme to new editors, or extending it with new token mappings. The guide covers the color palette, the semantic rules that govern how colors are assigned, and the specific values used in each of the two variants.

## Contents

1. [Color Palette](#color-palette)
   - [Accent Scales](#accent-scales)
   - [Neutral Scales](#neutral-scales)
   - [Extended Teal Scale](#extended-teal-scale)
2. [Theme Variants](#theme-variants)
3. [Background Layers](#background-layers)
4. [Typography](#typography)
5. [Borders & Interactive Elements](#borders--interactive-elements)
6. [Syntax Colors](#syntax-colors)
7. [Terminal Colors](#terminal-colors)
8. [Version Control & Diff](#version-control--diff)
9. [Diagnostics](#diagnostics)
10. [Player Cursors & Selections](#player-cursors--selections)
11. [Notes for Contributors](#notes-for-contributors)

---

## Color Palette

The Octopus theme is built exclusively from the [Octopus Design System](https://www.octopus.design/latest/foundations/color/color-scales-CwpnEHRI) color scales, plus one designed extension (Teal). Every hex value in the theme maps to a named step in one of these scales.

### Accent Scales

Each accent scale runs from 100 (lightest tint) to 900 (darkest shade).

<table>
  <tr>
    <th>Step</th>
    <th>Blue</th>
    <th>Purple</th>
    <th>Green</th>
    <th>Yellow</th>
    <th>Orange</th>
    <th>Red</th>
  </tr>
  <tr>
    <td><strong>100</strong></td>
    <td><code>#F2F8FD</code></td>
    <td><code>#F8F5FD</code></td>
    <td><code>#EEFAF5</code></td>
    <td><code>#FFF7D9</code></td>
    <td><code>#FFF5ED</code></td>
    <td><code>#FFF3F3</code></td>
  </tr>
  <tr>
    <td><strong>200</strong></td>
    <td><code>#CDE4F7</code></td>
    <td><code>#E7DEF8</code></td>
    <td><code>#B8E7D3</code></td>
    <td><code>#FFDF62</code></td>
    <td><code>#FFDABF</code></td>
    <td><code>#FFD8D8</code></td>
  </tr>
  <tr>
    <td><strong>300</strong></td>
    <td><code>#87BFEC</code></td>
    <td><code>#C5AEEE</code></td>
    <td><code>#5ECD9E</code></td>
    <td><code>#E5B203</code></td>
    <td><code>#FFA461</code></td>
    <td><code>#FF9F9F</code></td>
  </tr>
  <tr>
    <td><strong>400</strong></td>
    <td><code>#449BE1</code></td>
    <td><code>#A683E5</code></td>
    <td><code>#00AB62</code></td>
    <td><code>#B98F02</code></td>
    <td><code>#EA7325</code></td>
    <td><code>#FF5D5D</code></td>
  </tr>
  <tr>
    <td><strong>500</strong></td>
    <td><code>#1A77CA</code></td>
    <td><code>#895ED3</code></td>
    <td><code>#00874D</code></td>
    <td><code>#927002</code></td>
    <td><code>#C45317</code></td>
    <td><code>#D63D3D</code></td>
  </tr>
  <tr>
    <td><strong>600</strong></td>
    <td><code>#155EA0</code></td>
    <td><code>#7043B7</code></td>
    <td><code>#006A3D</code></td>
    <td><code>#745801</code></td>
    <td><code>#A13C14</code></td>
    <td><code>#AA3030</code></td>
  </tr>
  <tr>
    <td><strong>700</strong></td>
    <td><code>#0F4778</code></td>
    <td><code>#572B97</code></td>
    <td><code>#00502E</code></td>
    <td><code>#584201</code></td>
    <td><code>#7E2812</code></td>
    <td><code>#802424</code></td>
  </tr>
  <tr>
    <td><strong>800</strong></td>
    <td><code>#093051</code></td>
    <td><code>#3B1D66</code></td>
    <td><code>#00361F</code></td>
    <td><code>#3B2C00</code></td>
    <td><code>#59170D</code></td>
    <td><code>#571818</code></td>
  </tr>
  <tr>
    <td><strong>900</strong></td>
    <td><code>#041A2D</code></td>
    <td><code>#21103A</code></td>
    <td><code>#001E11</code></td>
    <td><code>#201800</code></td>
    <td><code>#340B07</code></td>
    <td><code>#310E0E</code></td>
  </tr>
</table>

### Neutral Scales

Two neutral scales provide the backbone for backgrounds and text.

**Navy** — cool blue-grey, used as the dark variant's background and text palette.

**Slate** — warm grey-blue, used as the light variant's background and text palette.

<table>
  <tr>
    <th>Step</th>
    <th>Navy</th>
    <th>Slate</th>
  </tr>
  <tr><td><strong>100</strong></td><td><code>#F4F6F8</code></td><td><code>#F5F6F8</code></td></tr>
  <tr><td><strong>200</strong></td><td><code>#DAE2E9</code></td><td><code>#DEE1E6</code></td></tr>
  <tr><td><strong>300</strong></td><td><code>#A9BBCB</code></td><td><code>#B2B9C5</code></td></tr>
  <tr><td><strong>400</strong></td><td><code>#7C98B4</code></td><td><code>#8A96A7</code></td></tr>
  <tr><td><strong>500</strong></td><td><code>#557999</code></td><td><code>#68778D</code></td></tr>
  <tr><td><strong>600</strong></td><td><code>#3E607D</code></td><td><code>#515D70</code></td></tr>
  <tr><td><strong>700</strong></td><td><code>#2E475D</code></td><td><code>#3D4653</code></td></tr>
  <tr><td><strong>800</strong></td><td><code>#1F303F</code></td><td><code>#282F38</code></td></tr>
  <tr><td><strong>900</strong></td><td><code>#111A23</code></td><td><code>#16191F</code></td></tr>
</table>

### Extended Teal Scale

The Octopus Design System does not currently include a teal scale. Teal fills the hue gap between Blue (210°) and Green (153°) at approximately **H 182°**, and is needed for semantic roles such as `property`, `tag`, and `selector.pseudo`. These values are designed extensions of the system.

<table>
  <tr>
    <th>Step</th>
    <th>Teal</th>
    <th>Primary use</th>
  </tr>
  <tr>
    <td><strong>300</strong></td>
    <td><code>#1ECCD3</code></td>
    <td>Dark: property, list markers, markup punctuation</td>
  </tr>
  <tr>
    <td><strong>400</strong></td>
    <td><code>#18A6AA</code></td>
    <td>Dark: tags, pseudo-selectors</td>
  </tr>
  <tr>
    <td><strong>600</strong></td>
    <td><code>#0F676A</code></td>
    <td>Light: property, list markers, markup punctuation</td>
  </tr>
  <tr>
    <td><strong>700</strong></td>
    <td><code>#0B4E50</code></td>
    <td>Light: tags, pseudo-selectors</td>
  </tr>
</table>

> **Why teal?** In CI/CD work, YAML and JSON keys (`property`) are the most-read token in the editor. Teal creates a strong three-way distinction between keys (teal), string values (green), and keywords (purple) that makes pipeline configs scannable at speed.

---

## Theme Variants

The theme ships in two variants. The scale steps used by each variant are summarized here for quick reference.

<table>
  <tr>
    <th>Role</th>
    <th>Dark (Navy scale)</th>
    <th>Light (Slate/White)</th>
  </tr>
  <tr>
    <td>Deepest background</td>
    <td>Navy-900 <code>#111A23</code></td>
    <td>White <code>#FFFFFF</code></td>
  </tr>
  <tr>
    <td>Panel / sidebar background</td>
    <td>Navy-800 <code>#1F303F</code></td>
    <td>Slate-100 <code>#F5F6F8</code></td>
  </tr>
  <tr>
    <td>Elevated surface (dropdowns, menus)</td>
    <td>Navy-700 <code>#2E475D</code></td>
    <td>Slate-200 <code>#DEE1E6</code></td>
  </tr>
  <tr>
    <td>Body text</td>
    <td>Navy-100 <code>#F4F6F8</code></td>
    <td>Slate-800 <code>#282F38</code></td>
  </tr>
  <tr>
    <td>Primary accent</td>
    <td>Blue-400 <code>#449BE1</code></td>
    <td>Blue-500 <code>#1A77CA</code></td>
  </tr>
  <tr>
    <td>Keyword color</td>
    <td>Purple-400 <code>#A683E5</code></td>
    <td>Purple-700 <code>#572B97</code></td>
  </tr>
  <tr>
    <td>String color</td>
    <td>Green-300 <code>#5ECD9E</code></td>
    <td>Green-500 <code>#00874D</code></td>
  </tr>
  <tr>
    <td>Property / key color</td>
    <td>Teal-300 <code>#1ECCD3</code></td>
    <td>Teal-600 <code>#0F676A</code></td>
  </tr>
  <tr>
    <td>Type / class color</td>
    <td>Yellow-300 <code>#E5B203</code></td>
    <td>Yellow-500 <code>#927002</code></td>
  </tr>
  <tr>
    <td>Number / constant color</td>
    <td>Orange-300/400 <code>#FFA461</code> / <code>#EA7325</code></td>
    <td>Orange-500/600 <code>#C45317</code> / <code>#A13C14</code></td>
  </tr>
</table>

> **Rule of thumb:** Dark uses lighter steps (300–400 range) for accent colors — they need to shine on a deep background. Light uses darker steps (500–700 range) — they need sufficient contrast on white. Steps are chosen to achieve at minimum WCAG AA contrast (4.5:1) against their respective backgrounds.

---

## Background Layers

Backgrounds follow a strict three-tier hierarchy. Each tier is one step apart in the neutral scale, creating a clear sense of depth without harsh contrast.

### Dark variant

<table>
  <tr>
    <th>Layer</th>
    <th>Surfaces</th>
    <th>Color</th>
    <th>Scale step</th>
  </tr>
  <tr>
    <td><strong>Canvas</strong> (deepest)</td>
    <td>Editor, gutter, active tab, toolbar, inactive title bar</td>
    <td><code>#111A23</code></td>
    <td>Navy-900</td>
  </tr>
  <tr>
    <td><strong>Chrome</strong></td>
    <td>Panels, sidebar, tab bar, inactive tabs, status bar, title bar</td>
    <td><code>#1F303F</code></td>
    <td>Navy-800</td>
  </tr>
  <tr>
    <td><strong>Float</strong> (highest)</td>
    <td>Dropdowns, menus, tooltips, elevated surfaces</td>
    <td><code>#2E475D</code></td>
    <td>Navy-700</td>
  </tr>
</table>

### Light variant

<table>
  <tr>
    <th>Layer</th>
    <th>Surfaces</th>
    <th>Color</th>
    <th>Scale step</th>
  </tr>
  <tr>
    <td><strong>Canvas</strong> (lightest)</td>
    <td>Editor, gutter, active tab, toolbar, inactive title bar</td>
    <td><code>#FFFFFF</code></td>
    <td>White</td>
  </tr>
  <tr>
    <td><strong>Chrome</strong></td>
    <td>Panels, sidebar, tab bar, inactive tabs, status bar, title bar</td>
    <td><code>#F5F6F8</code></td>
    <td>Slate-100</td>
  </tr>
  <tr>
    <td><strong>Float</strong> (lowest)</td>
    <td>Dropdowns, menus, tooltips, elevated surfaces</td>
    <td><code>#DEE1E6</code></td>
    <td>Slate-200</td>
  </tr>
</table>

> **Note:** In the dark variant the editor is *darker* than surrounding panels (Canvas < Chrome), creating a focused, inward feel. In the light variant the editor is *lighter* than surrounding panels (Canvas > Chrome), creating an outward feel. Both respect the same three-tier depth model — they just invert the direction.

---

## Typography

Text is drawn from the same neutral scale used for backgrounds, at the opposite end of the lightness range.

<table>
  <tr>
    <th>Role</th>
    <th>Dark</th>
    <th>Light</th>
  </tr>
  <tr>
    <td>Body text, headlines</td>
    <td>Navy-100 <code>#F4F6F8</code></td>
    <td>Slate-800 <code>#282F38</code></td>
  </tr>
  <tr>
    <td>Muted text (labels, secondary info)</td>
    <td>Navy-300 <code>#A9BBCB</code></td>
    <td>Slate-600 <code>#515D70</code></td>
  </tr>
  <tr>
    <td>Placeholder text</td>
    <td>Navy-400 <code>#7C98B4</code></td>
    <td>Slate-500 <code>#68778D</code></td>
  </tr>
  <tr>
    <td>Disabled text</td>
    <td>Navy-600 <code>#3E607D</code></td>
    <td>Slate-300 <code>#B2B9C5</code></td>
  </tr>
  <tr>
    <td>Accent text / links</td>
    <td>Blue-300 <code>#87BFEC</code></td>
    <td>Blue-500 <code>#1A77CA</code></td>
  </tr>
  <tr>
    <td>Link hover</td>
    <td>Blue-300 <code>#87BFEC</code></td>
    <td>Blue-500 <code>#1A77CA</code></td>
  </tr>
</table>

---

## Borders & Interactive Elements

<table>
  <tr>
    <th>Role</th>
    <th>Dark</th>
    <th>Light</th>
  </tr>
  <tr>
    <td>Default border</td>
    <td>Navy-700 <code>#2E475D</code></td>
    <td>Slate-200 <code>#DEE1E6</code></td>
  </tr>
  <tr>
    <td>Focused / selected border</td>
    <td>Blue-400 <code>#449BE1</code></td>
    <td>Blue-500 <code>#1A77CA</code></td>
  </tr>
  <tr>
    <td>Disabled border</td>
    <td>Navy-600 <code>#3E607D</code></td>
    <td>Slate-300 <code>#B2B9C5</code></td>
  </tr>
  <tr>
    <td>Element hover</td>
    <td>Navy-700 <code>#2E475D</code></td>
    <td>Slate-200 <code>#DEE1E6</code></td>
  </tr>
  <tr>
    <td>Element active</td>
    <td>Navy-600 <code>#3E607D</code></td>
    <td>Slate-300 <code>#B2B9C5</code></td>
  </tr>
  <tr>
    <td>Element selected</td>
    <td>Blue-400 @ 20% <code>#449BE133</code></td>
    <td>Blue-500 @ 20% <code>#1A77CA33</code></td>
  </tr>
  <tr>
    <td>Drop target highlight</td>
    <td>Blue-400 @ 30% <code>#449BE14C</code></td>
    <td>Blue-500 @ 30% <code>#1A77CA4C</code></td>
  </tr>
  <tr>
    <td>Search match</td>
    <td>Blue-400 @ 40% <code>#449BE166</code></td>
    <td>Blue-500 @ 40% <code>#1A77CA66</code></td>
  </tr>
  <tr>
    <td>Active search match</td>
    <td>Yellow-300 @ 40% <code>#E5B20366</code></td>
    <td>Yellow-400 @ 40% <code>#B98F0266</code></td>
  </tr>
  <tr>
    <td>Active line background</td>
    <td>Navy-800 @ 50% <code>#1F303F80</code></td>
    <td>Slate-100 @ 50% <code>#F5F6F880</code></td>
  </tr>
  <tr>
    <td>Document highlight (read)</td>
    <td>Blue-400 @ 10% <code>#449BE11A</code></td>
    <td>Blue-500 @ 10% <code>#1A77CA1A</code></td>
  </tr>
  <tr>
    <td>Document highlight (write)</td>
    <td>Navy-700 @ 40% <code>#2E475D66</code></td>
    <td>Slate-200 @ 40% <code>#DEE1E666</code></td>
  </tr>
  <tr>
    <td>Scrollbar thumb</td>
    <td>Navy-300 @ 30% <code>#A9BBCB4C</code></td>
    <td>Slate-600 @ 30% <code>#515D704C</code></td>
  </tr>
</table>

---

## Syntax Colors

The syntax system follows the same semantic logic as popularly-adopted themes like Catppuccin, adapted to the Octopus palette. The color-to-role assignments are consistent across both variants; only the specific steps differ (lighter steps in dark, darker steps in light).

### Language Defaults

<table>
  <tr>
    <th>Token</th>
    <th>Role / examples</th>
    <th>Dark</th>
    <th>Light</th>
  </tr>
  <tr>
    <td><strong>Keyword</strong></td>
    <td><code>if</code>, <code>return</code>, <code>for</code>, <code>import</code></td>
    <td>Purple-400 <code>#A683E5</code></td>
    <td>Purple-700 <code>#572B97</code></td>
  </tr>
  <tr>
    <td><strong>String</strong></td>
    <td>String literals, text literals</td>
    <td>Green-300 <code>#5ECD9E</code></td>
    <td>Green-500 <code>#00874D</code></td>
  </tr>
  <tr>
    <td><strong>Number</strong></td>
    <td>Integer and float literals</td>
    <td>Orange-300 <code>#FFA461</code></td>
    <td>Orange-500 <code>#C45317</code></td>
  </tr>
  <tr>
    <td><strong>Constant</strong></td>
    <td>Named constants, <code>null</code>, enum values</td>
    <td>Orange-400 <code>#EA7325</code></td>
    <td>Orange-600 <code>#A13C14</code></td>
  </tr>
  <tr>
    <td><strong>Boolean</strong></td>
    <td><code>true</code>, <code>false</code></td>
    <td>Purple-300 <code>#C5AEEE</code></td>
    <td>Purple-600 <code>#7043B7</code></td>
  </tr>
  <tr>
    <td><strong>Type</strong></td>
    <td>Type names, class definitions, interfaces</td>
    <td>Yellow-300 <code>#E5B203</code></td>
    <td>Yellow-500 <code>#927002</code></td>
  </tr>
  <tr>
    <td><strong>Enum / Variant</strong></td>
    <td>Enum type names and variant names</td>
    <td>Yellow-300 <code>#E5B203</code></td>
    <td>Yellow-500 <code>#927002</code></td>
  </tr>
  <tr>
    <td><strong>Function / Method</strong></td>
    <td>Function definitions and calls</td>
    <td>Blue-300 <code>#87BFEC</code></td>
    <td>Blue-500 <code>#1A77CA</code></td>
  </tr>
  <tr>
    <td><strong>Constructor</strong></td>
    <td>Constructor calls and definitions</td>
    <td>Blue-300 <code>#87BFEC</code></td>
    <td>Blue-500 <code>#1A77CA</code></td>
  </tr>
  <tr>
    <td><strong>Property</strong></td>
    <td>Struct fields, JSON/YAML keys, object members</td>
    <td>Teal-300 <code>#1ECCD3</code></td>
    <td>Teal-600 <code>#0F676A</code></td>
  </tr>
  <tr>
    <td><strong>Variable</strong></td>
    <td>Local variables, identifiers (default)</td>
    <td>Navy-100 <code>#F4F6F8</code></td>
    <td>Slate-800 <code>#282F38</code></td>
  </tr>
  <tr>
    <td><strong>Variable (special)</strong></td>
    <td><code>this</code>, <code>self</code>, <code>super</code></td>
    <td>Orange-400 <code>#EA7325</code></td>
    <td>Orange-500 <code>#C45317</code></td>
  </tr>
  <tr>
    <td><strong>Operator</strong></td>
    <td><code>=</code>, <code>+</code>, <code>-&gt;</code>, <code>|&gt;</code></td>
    <td>Blue-200 <code>#CDE4F7</code></td>
    <td>Slate-600 <code>#515D70</code></td>
  </tr>
  <tr>
    <td><strong>Attribute</strong></td>
    <td>Decorators, annotations (<code>@decorator</code>, <code>#[derive]</code>)</td>
    <td>Purple-300 <code>#C5AEEE</code></td>
    <td>Purple-600 <code>#7043B7</code></td>
  </tr>
  <tr>
    <td><strong>Tag</strong></td>
    <td>HTML / XML element names</td>
    <td>Teal-400 <code>#18A6AA</code></td>
    <td>Teal-700 <code>#0B4E50</code></td>
  </tr>
  <tr>
    <td><strong>Namespace</strong></td>
    <td>Module paths, package qualifiers</td>
    <td>Navy-100 <code>#F4F6F8</code></td>
    <td>Slate-800 <code>#282F38</code></td>
  </tr>
  <tr>
    <td><strong>Label</strong></td>
    <td>Goto labels, lifetime labels (<code>'a</code>)</td>
    <td>Blue-300 <code>#87BFEC</code></td>
    <td>Blue-500 <code>#1A77CA</code></td>
  </tr>
  <tr>
    <td><strong>Preprocessor</strong></td>
    <td><code>#define</code>, <code>#include</code>, macros</td>
    <td>Purple-400 <code>#A683E5</code></td>
    <td>Purple-700 <code>#572B97</code></td>
  </tr>
</table>

### Strings (sub-types)

<table>
  <tr>
    <th>Token</th>
    <th>Role / examples</th>
    <th>Dark</th>
    <th>Light</th>
  </tr>
  <tr>
    <td><strong>String</strong></td>
    <td>Plain string literals</td>
    <td>Green-300 <code>#5ECD9E</code></td>
    <td>Green-500 <code>#00874D</code></td>
  </tr>
  <tr>
    <td><strong>String (escape)</strong></td>
    <td><code>\n</code>, <code>\t</code>, <code>\"</code>, Unicode escapes</td>
    <td>Purple-300 <code>#C5AEEE</code></td>
    <td>Purple-600 <code>#7043B7</code></td>
  </tr>
  <tr>
    <td><strong>String (regex)</strong></td>
    <td>Regular expression literals</td>
    <td>Red-400 <code>#FF5D5D</code></td>
    <td>Red-700 <code>#802424</code></td>
  </tr>
  <tr>
    <td><strong>String (special / symbol)</strong></td>
    <td>Symbols, interned strings, special literals</td>
    <td>Red-400 <code>#FF5D5D</code></td>
    <td>Red-700 <code>#802424</code></td>
  </tr>
</table>

> **Escape sequences use Purple, not muted grey.** `\n` inside a shell command or pipeline YAML value changes runtime behavior. Making escape sequences clearly visible (purple, keyword-adjacent) reduces the chance of misreading a string's actual value.

### Punctuation

<table>
  <tr>
    <th>Token</th>
    <th>Role</th>
    <th>Dark</th>
    <th>Light</th>
  </tr>
  <tr>
    <td><strong>Punctuation</strong></td>
    <td>General punctuation</td>
    <td>Navy-400 <code>#7C98B4</code></td>
    <td>Slate-500 <code>#68778D</code></td>
  </tr>
  <tr>
    <td><strong>Punctuation (bracket)</strong></td>
    <td><code>(</code> <code>)</code> <code>[</code> <code>]</code> <code>{</code> <code>}</code></td>
    <td>Navy-400 <code>#7C98B4</code></td>
    <td>Slate-500 <code>#68778D</code></td>
  </tr>
  <tr>
    <td><strong>Punctuation (delimiter)</strong></td>
    <td><code>,</code> <code>.</code> <code>;</code> <code>:</code></td>
    <td>Navy-400 <code>#7C98B4</code></td>
    <td>Slate-500 <code>#68778D</code></td>
  </tr>
  <tr>
    <td><strong>Punctuation (list marker)</strong></td>
    <td>Markdown <code>-</code> and <code>*</code> list bullets</td>
    <td>Teal-300 <code>#1ECCD3</code></td>
    <td>Teal-600 <code>#0F676A</code></td>
  </tr>
  <tr>
    <td><strong>Punctuation (markup)</strong></td>
    <td>Markdown heading <code>#</code>, bold/italic markers</td>
    <td>Teal-300 <code>#1ECCD3</code></td>
    <td>Teal-600 <code>#0F676A</code></td>
  </tr>
  <tr>
    <td><strong>Punctuation (special)</strong></td>
    <td>String interpolation <code>${</code>, format specs</td>
    <td>Orange-300 <code>#FFA461</code></td>
    <td>Orange-500 <code>#C45317</code></td>
  </tr>
</table>

### CSS / Selectors

<table>
  <tr>
    <th>Token</th>
    <th>Role</th>
    <th>Dark</th>
    <th>Light</th>
  </tr>
  <tr>
    <td><strong>Selector</strong></td>
    <td>CSS class, ID, element selectors</td>
    <td>Orange-300 <code>#FFA461</code></td>
    <td>Orange-500 <code>#C45317</code></td>
  </tr>
  <tr>
    <td><strong>Selector (pseudo)</strong></td>
    <td><code>:hover</code>, <code>::before</code>, pseudo-classes</td>
    <td>Teal-400 <code>#18A6AA</code></td>
    <td>Teal-700 <code>#0B4E50</code></td>
  </tr>
</table>

### Prose & Documentation

<table>
  <tr>
    <th>Token</th>
    <th>Role</th>
    <th>Dark</th>
    <th>Light</th>
  </tr>
  <tr>
    <td><strong>Comment</strong></td>
    <td>Inline and block comments</td>
    <td>Navy-400 <code>#7C98B4</code> <em>italic</em></td>
    <td>Slate-600 <code>#515D70</code> <em>italic</em></td>
  </tr>
  <tr>
    <td><strong>Comment (doc)</strong></td>
    <td>Documentation comments (<code>///</code>, <code>/** */</code>)</td>
    <td>Navy-300 <code>#A9BBCB</code> <em>italic</em></td>
    <td>Slate-600 <code>#515D70</code> <em>italic</em></td>
  </tr>
  <tr>
    <td><strong>Title</strong></td>
    <td>Markdown headings (<code>#</code>, <code>##</code>)</td>
    <td>Navy-100 <code>#F4F6F8</code> <strong>bold</strong></td>
    <td>Slate-800 <code>#282F38</code> <strong>bold</strong></td>
  </tr>
  <tr>
    <td><strong>Emphasis</strong></td>
    <td>Markdown <em>italic</em></td>
    <td>Blue-300 <code>#87BFEC</code> <em>italic</em></td>
    <td>Blue-500 <code>#1A77CA</code> <em>italic</em></td>
  </tr>
  <tr>
    <td><strong>Emphasis (strong)</strong></td>
    <td>Markdown <strong>bold</strong></td>
    <td>Purple-300 <code>#C5AEEE</code> <strong>bold</strong></td>
    <td>Purple-600 <code>#7043B7</code> <strong>bold</strong></td>
  </tr>
  <tr>
    <td><strong>Text literal</strong></td>
    <td>Inline code (<code>`backtick`</code>)</td>
    <td>Green-300 <code>#5ECD9E</code></td>
    <td>Green-500 <code>#00874D</code></td>
  </tr>
  <tr>
    <td><strong>Link text</strong></td>
    <td>The label part of a hyperlink</td>
    <td>Blue-300 <code>#87BFEC</code> <em>italic</em></td>
    <td>Blue-500 <code>#1A77CA</code> <em>italic</em></td>
  </tr>
  <tr>
    <td><strong>Link URI</strong></td>
    <td>The URL part of a hyperlink</td>
    <td>Blue-400 <code>#449BE1</code></td>
    <td>Blue-600 <code>#155EA0</code></td>
  </tr>
</table>

### Editor Gutter & General

<table>
  <tr>
    <th>Role</th>
    <th>Dark</th>
    <th>Light</th>
  </tr>
  <tr>
    <td>Line numbers</td>
    <td>Navy-600 <code>#3E607D</code></td>
    <td>Slate-300 <code>#B2B9C5</code></td>
  </tr>
  <tr>
    <td>Active line number</td>
    <td>Navy-100 <code>#F4F6F8</code></td>
    <td>Slate-800 <code>#282F38</code></td>
  </tr>
  <tr>
    <td>Hover line number</td>
    <td>Navy-300 <code>#A9BBCB</code></td>
    <td>Slate-600 <code>#515D70</code></td>
  </tr>
  <tr>
    <td>Invisible characters</td>
    <td>Navy-600 <code>#3E607D</code></td>
    <td>Slate-300 <code>#B2B9C5</code></td>
  </tr>
  <tr>
    <td>Wrap guide</td>
    <td>Navy-100 @ 5% <code>#F4F6F80D</code></td>
    <td>Slate-800 @ 5% <code>#282F380D</code></td>
  </tr>
  <tr>
    <td>Active wrap guide</td>
    <td>Navy-100 @ 10% <code>#F4F6F81A</code></td>
    <td>Slate-800 @ 10% <code>#282F381A</code></td>
  </tr>
  <tr>
    <td>Hint</td>
    <td>Navy-400 <code>#7C98B4</code></td>
    <td>Slate-500 <code>#68778D</code></td>
  </tr>
  <tr>
    <td>Predictive / ghost text</td>
    <td>Navy-600 <code>#3E607D</code> <em>italic</em></td>
    <td>Slate-300 <code>#B2B9C5</code> <em>italic</em></td>
  </tr>
</table>

---

## Terminal Colors

ANSI colors follow a stepped approach: dim = one step darker, regular = base, bright = one step lighter. All values map to named steps in the Octopus accent scales.

<table>
  <tr>
    <th>ANSI slot</th>
    <th>Role</th>
    <th>Dark — dim / base / bright</th>
    <th>Light — dim / base / bright</th>
  </tr>
  <tr>
    <td><strong>Black (0 / 8)</strong></td>
    <td>Terminal black</td>
    <td>Navy-800 / Navy-900 / Navy-400<br><code>#1F303F</code> / <code>#111A23</code> / <code>#7C98B4</code></td>
    <td>Slate-200 / Slate-800 / Slate-500<br><code>#DEE1E6</code> / <code>#282F38</code> / <code>#68778D</code></td>
  </tr>
  <tr>
    <td><strong>Red (1 / 9)</strong></td>
    <td>Errors, deletions</td>
    <td>Red-600 / Red-400 / Red-300<br><code>#AA3030</code> / <code>#FF5D5D</code> / <code>#FF9F9F</code></td>
    <td>Red-600 / Red-500 / Red-400<br><code>#AA3030</code> / <code>#D63D3D</code> / <code>#FF5D5D</code></td>
  </tr>
  <tr>
    <td><strong>Green (2 / 10)</strong></td>
    <td>Success, additions</td>
    <td>Green-600 / Green-400 / Green-300<br><code>#006A3D</code> / <code>#00AB62</code> / <code>#5ECD9E</code></td>
    <td>Green-600 / Green-500 / Green-400<br><code>#006A3D</code> / <code>#00874D</code> / <code>#00AB62</code></td>
  </tr>
  <tr>
    <td><strong>Yellow (3 / 11)</strong></td>
    <td>Warnings, modified</td>
    <td>Yellow-600 / Yellow-300 / Yellow-200<br><code>#745801</code> / <code>#E5B203</code> / <code>#FFDF62</code></td>
    <td>Yellow-500 / Yellow-400 / Yellow-300<br><code>#927002</code> / <code>#B98F02</code> / <code>#E5B203</code></td>
  </tr>
  <tr>
    <td><strong>Blue (4 / 12)</strong></td>
    <td>Links, info</td>
    <td>Blue-600 / Blue-400 / Blue-300<br><code>#155EA0</code> / <code>#449BE1</code> / <code>#87BFEC</code></td>
    <td>Blue-600 / Blue-500 / Blue-400<br><code>#155EA0</code> / <code>#1A77CA</code> / <code>#449BE1</code></td>
  </tr>
  <tr>
    <td><strong>Magenta (5 / 13)</strong></td>
    <td>Keywords, special</td>
    <td>Purple-600 / Purple-400 / Purple-300<br><code>#7043B7</code> / <code>#A683E5</code> / <code>#C5AEEE</code></td>
    <td>Purple-600 / Purple-500 / Purple-400<br><code>#7043B7</code> / <code>#895EDA</code> / <code>#A683E5</code></td>
  </tr>
  <tr>
    <td><strong>Cyan (6 / 14)</strong></td>
    <td>Properties, tags</td>
    <td>Blue-700 / Blue-300 / Blue-200<br><code>#0F4778</code> / <code>#87BFEC</code> / <code>#CDE4F7</code></td>
    <td>Blue-700 / Blue-400 / Blue-300<br><code>#0F4778</code> / <code>#449BE1</code> / <code>#87BFEC</code></td>
  </tr>
  <tr>
    <td><strong>White (7 / 15)</strong></td>
    <td>Terminal white</td>
    <td>Navy-300 / Navy-100 / White<br><code>#A9BBCB</code> / <code>#F4F6F8</code> / <code>#FFFFFF</code></td>
    <td>Slate-400 / Slate-600 / Slate-900<br><code>#8A96A7</code> / <code>#515D70</code> / <code>#16191F</code></td>
  </tr>
</table>

**Window colors**

<table>
  <tr>
    <th>Role</th>
    <th>Dark</th>
    <th>Light</th>
  </tr>
  <tr>
    <td>Terminal background</td>
    <td>Navy-900 <code>#111A23</code></td>
    <td>White <code>#FFFFFF</code></td>
  </tr>
  <tr>
    <td>Terminal foreground</td>
    <td>Navy-100 <code>#F4F6F8</code></td>
    <td>Slate-800 <code>#282F38</code></td>
  </tr>
  <tr>
    <td>Bright foreground</td>
    <td>White <code>#FFFFFF</code></td>
    <td>Slate-900 <code>#16191F</code></td>
  </tr>
  <tr>
    <td>Dim foreground</td>
    <td>Navy-400 <code>#7C98B4</code></td>
    <td>Slate-500 <code>#68778D</code></td>
  </tr>
</table>

---

## Version Control & Diff

<table>
  <tr>
    <th>Role</th>
    <th>Dark</th>
    <th>Light</th>
  </tr>
  <tr>
    <td>Added (gutter indicator)</td>
    <td>Green-400 <code>#00AB62</code></td>
    <td>Green-500 <code>#00874D</code></td>
  </tr>
  <tr>
    <td>Modified (gutter indicator)</td>
    <td>Yellow-300 <code>#E5B203</code></td>
    <td>Yellow-400 <code>#B98F02</code></td>
  </tr>
  <tr>
    <td>Deleted (gutter indicator)</td>
    <td>Red-400 <code>#FF5D5D</code></td>
    <td>Red-500 <code>#D63D3D</code></td>
  </tr>
  <tr>
    <td>Word added (inline)</td>
    <td>Green-400 @ 35% <code>#00AB6259</code></td>
    <td>Green-500 @ 35% <code>#00874D59</code></td>
  </tr>
  <tr>
    <td>Word deleted (inline)</td>
    <td>Red-400 @ 80% <code>#FF5D5DCC</code></td>
    <td>Red-500 @ 80% <code>#D63D3DCC</code></td>
  </tr>
  <tr>
    <td>Conflict marker (ours)</td>
    <td>Green-400 @ 10% <code>#00AB621A</code></td>
    <td>Green-500 @ 10% <code>#00874D1A</code></td>
  </tr>
  <tr>
    <td>Conflict marker (theirs)</td>
    <td>Blue-400 @ 10% <code>#449BE11A</code></td>
    <td>Blue-500 @ 10% <code>#1A77CA1A</code></td>
  </tr>
</table>

**Diff syntax tokens** (for in-editor diff views)

<table>
  <tr>
    <th>Token</th>
    <th>Dark</th>
    <th>Light</th>
  </tr>
  <tr>
    <td><code>diff.plus</code> (added lines)</td>
    <td>Green-400 <code>#00AB62</code></td>
    <td>Green-500 <code>#00874D</code></td>
  </tr>
  <tr>
    <td><code>diff.minus</code> (removed lines)</td>
    <td>Red-400 <code>#FF5D5D</code></td>
    <td>Red-500 <code>#D63D3D</code></td>
  </tr>
</table>

---

## Diagnostics

Diagnostic colors are used for inline errors, warnings, hints, and file-status badges. Each state has three values: the foreground color, a translucent background tint, and a border.

<table>
  <tr>
    <th>State</th>
    <th>Foreground</th>
    <th>Background tint</th>
    <th>Border</th>
    <th>Palette step</th>
  </tr>
  <tr>
    <td colspan="5"><strong>Dark variant</strong></td>
  </tr>
  <tr>
    <td>Error</td>
    <td><code>#FF9F9F</code></td>
    <td><code>#80242480</code> (10%)</td>
    <td><code>#FF5D5D</code></td>
    <td>Red-300 / Red-700 / Red-400</td>
  </tr>
  <tr>
    <td>Warning</td>
    <td><code>#FFDF62</code></td>
    <td><code>#7458011A</code> (10%)</td>
    <td><code>#E5B203</code></td>
    <td>Yellow-200 / Yellow-600 / Yellow-300</td>
  </tr>
  <tr>
    <td>Info</td>
    <td><code>#87BFEC</code></td>
    <td><code>#0F47781A</code> (10%)</td>
    <td><code>#449BE1</code></td>
    <td>Blue-300 / Blue-700 / Blue-400</td>
  </tr>
  <tr>
    <td>Hint</td>
    <td><code>#7C98B4</code></td>
    <td><code>#0F47781A</code> (10%)</td>
    <td><code>#449BE1</code></td>
    <td>Navy-400 / Blue-700 / Blue-400</td>
  </tr>
  <tr>
    <td>Success</td>
    <td><code>#5ECD9E</code></td>
    <td><code>#00502E1A</code> (10%)</td>
    <td><code>#00AB62</code></td>
    <td>Green-300 / Green-700 / Green-400</td>
  </tr>
  <tr>
    <td>Created</td>
    <td><code>#00AB62</code></td>
    <td><code>#00502E1A</code> (10%)</td>
    <td><code>#00AB62</code></td>
    <td>Green-400 / Green-700 / Green-400</td>
  </tr>
  <tr>
    <td>Deleted</td>
    <td><code>#FF5D5D</code></td>
    <td><code>#8024241A</code> (10%)</td>
    <td><code>#FF5D5D</code></td>
    <td>Red-400 / Red-700 / Red-400</td>
  </tr>
  <tr>
    <td>Modified</td>
    <td><code>#E5B203</code></td>
    <td><code>#7458011A</code> (10%)</td>
    <td><code>#E5B203</code></td>
    <td>Yellow-300 / Yellow-600 / Yellow-300</td>
  </tr>
  <tr>
    <td>Conflict</td>
    <td><code>#E5B203</code></td>
    <td><code>#7458011A</code> (10%)</td>
    <td><code>#E5B203</code></td>
    <td>Yellow-300 / Yellow-600 / Yellow-300</td>
  </tr>
  <tr>
    <td>Renamed</td>
    <td><code>#449BE1</code></td>
    <td><code>#0F47781A</code> (10%)</td>
    <td><code>#449BE1</code></td>
    <td>Blue-400 / Blue-700 / Blue-400</td>
  </tr>
  <tr>
    <td>Hidden / Ignored</td>
    <td><code>#3E607D</code></td>
    <td><code>#1F303F33</code> (20%)</td>
    <td><code>#2E475D</code></td>
    <td>Navy-600 / Navy-800 / Navy-700</td>
  </tr>
  <tr>
    <td colspan="5"><strong>Light variant</strong></td>
  </tr>
  <tr>
    <td>Error</td>
    <td><code>#D63D3D</code></td>
    <td><code>#FFF3F34C</code> (30%)</td>
    <td><code>#D63D3D</code></td>
    <td>Red-500 / Red-100 / Red-500</td>
  </tr>
  <tr>
    <td>Warning</td>
    <td><code>#927002</code></td>
    <td><code>#FFF7D94C</code> (30%)</td>
    <td><code>#B98F02</code></td>
    <td>Yellow-500 / Yellow-100 / Yellow-400</td>
  </tr>
  <tr>
    <td>Info</td>
    <td><code>#1A77CA</code></td>
    <td><code>#F2F8FD4C</code> (30%)</td>
    <td><code>#1A77CA</code></td>
    <td>Blue-500 / Blue-100 / Blue-500</td>
  </tr>
  <tr>
    <td>Hint</td>
    <td><code>#68778D</code></td>
    <td><code>#F2F8FD4C</code> (30%)</td>
    <td><code>#1A77CA</code></td>
    <td>Slate-500 / Blue-100 / Blue-500</td>
  </tr>
  <tr>
    <td>Success</td>
    <td><code>#00874D</code></td>
    <td><code>#EEFAF54C</code> (30%)</td>
    <td><code>#00874D</code></td>
    <td>Green-500 / Green-100 / Green-500</td>
  </tr>
  <tr>
    <td>Created</td>
    <td><code>#00874D</code></td>
    <td><code>#EEFAF54C</code> (30%)</td>
    <td><code>#00874D</code></td>
    <td>Green-500 / Green-100 / Green-500</td>
  </tr>
  <tr>
    <td>Deleted</td>
    <td><code>#D63D3D</code></td>
    <td><code>#FFF3F34C</code> (30%)</td>
    <td><code>#D63D3D</code></td>
    <td>Red-500 / Red-100 / Red-500</td>
  </tr>
  <tr>
    <td>Modified</td>
    <td><code>#927002</code></td>
    <td><code>#FFF7D94C</code> (30%)</td>
    <td><code>#B98F02</code></td>
    <td>Yellow-500 / Yellow-100 / Yellow-400</td>
  </tr>
  <tr>
    <td>Conflict</td>
    <td><code>#927002</code></td>
    <td><code>#FFF7D94C</code> (30%)</td>
    <td><code>#B98F02</code></td>
    <td>Yellow-500 / Yellow-100 / Yellow-400</td>
  </tr>
  <tr>
    <td>Renamed</td>
    <td><code>#1A77CA</code></td>
    <td><code>#F2F8FD4C</code> (30%)</td>
    <td><code>#1A77CA</code></td>
    <td>Blue-500 / Blue-100 / Blue-500</td>
  </tr>
  <tr>
    <td>Hidden / Ignored</td>
    <td><code>#B2B9C5</code></td>
    <td><code>#DEE1E64C</code> (30%)</td>
    <td><code>#DEE1E6</code></td>
    <td>Slate-300 / Slate-200 / Slate-200</td>
  </tr>
</table>

---

## Player Cursors & Selections

Multi-cursor / collaborative editing uses one color per player, drawn from the accent palette. Selection backgrounds are the same color at 24% opacity.

<table>
  <tr>
    <th>Player</th>
    <th>Dark cursor / selection</th>
    <th>Light cursor / selection</th>
    <th>Palette</th>
  </tr>
  <tr>
    <td>1</td>
    <td><code>#449BE1</code> / <code>#449BE13D</code></td>
    <td><code>#1A77CA</code> / <code>#1A77CA3D</code></td>
    <td>Blue-400 / Blue-500</td>
  </tr>
  <tr>
    <td>2</td>
    <td><code>#FF5D5D</code> / <code>#FF5D5D3D</code></td>
    <td><code>#D63D3D</code> / <code>#D63D3D3D</code></td>
    <td>Red-400 / Red-500</td>
  </tr>
  <tr>
    <td>3</td>
    <td><code>#E5B203</code> / <code>#E5B2033D</code></td>
    <td><code>#B98F02</code> / <code>#B98F023D</code></td>
    <td>Yellow-300 / Yellow-400</td>
  </tr>
  <tr>
    <td>4</td>
    <td><code>#A683E5</code> / <code>#A683E53D</code></td>
    <td><code>#7043B7</code> / <code>#7043B73D</code></td>
    <td>Purple-400 / Purple-600</td>
  </tr>
  <tr>
    <td>5</td>
    <td><code>#00AB62</code> / <code>#00AB623D</code></td>
    <td><code>#00874D</code> / <code>#00874D3D</code></td>
    <td>Green-400 / Green-500</td>
  </tr>
  <tr>
    <td>6</td>
    <td><code>#87BFEC</code> / <code>#87BFEC3D</code></td>
    <td><code>#449BE1</code> / <code>#449BE13D</code></td>
    <td>Blue-300 / Blue-400</td>
  </tr>
  <tr>
    <td>7</td>
    <td><code>#FFDF62</code> / <code>#FFDF623D</code></td>
    <td><code>#E5B203</code> / <code>#E5B2033D</code></td>
    <td>Yellow-200 / Yellow-300</td>
  </tr>
  <tr>
    <td>8</td>
    <td><code>#C5AEEE</code> / <code>#C5AEEE3D</code></td>
    <td><code>#895EDA</code> / <code>#895EDA3D</code></td>
    <td>Purple-300 / Purple-500</td>
  </tr>
</table>

---

## Notes for Contributors

### Color-to-role summary

The full semantic logic in one table. When in doubt about where a new token should go, find the nearest semantic category here.

| Semantic category | Scale | Dark step | Light step |
|---|---|---|---|
| Background (canvas) | Navy / White | 900 | — |
| Background (chrome) | Navy / Slate | 800 | 100 |
| Background (float) | Navy / Slate | 700 | 200 |
| Body text | Navy / Slate | 100 | 800 |
| Muted text / doc comments | Navy / Slate | 300 | 600 |
| Placeholder text | Navy / Slate | 400 | 500 |
| Disabled / invisible | Navy / Slate | 600 | 300 |
| Primary accent / focused border | Blue | 400 | 500 |
| Accent text / links | Blue | 300 | 500 |
| Keywords / preprocessor | Purple | 400 | 700 |
| Attributes / booleans / escape sequences | Purple | 300 | 600 |
| Strings | Green | 300 | 500 |
| Numbers | Orange | 300 | 500 |
| Constants | Orange | 400 | 600 |
| Types / enums / variants | Yellow | 300 | 500 |
| Functions / constructors / labels | Blue | 300 | 500 |
| Properties / list markers / markup | Teal (ext.) | 300 | 600 |
| Tags / pseudo-selectors | Teal (ext.) | 400 | 700 |
| Operators | Blue / Slate | 200 | 600 |
| Comments | Navy / Slate | 400 | 600 |
| Regex / special strings | Red | 400 | 700 |
| Variable (special) | Orange | 400 | 500 |
| Selectors | Orange | 300 | 500 |
| Error | Red | 300 / 400 | 500 |
| Warning | Yellow | 200 / 300 | 500 |
| Success / added | Green | 300 / 400 | 500 |
| Info / renamed | Blue | 300 / 400 | 500 |

### Rules

1. **Stay on-system.** Every color value must map to a named step in the Octopus Design System or the Extended Teal scale. No ad-hoc hex values.

2. **Step selection for contrast.** In the dark variant, use steps 200–400 for accent colors on the Navy-900/800 background. In the light variant, use steps 500–700 on white/Slate-100. Always verify at least 4.5:1 contrast ratio (WCAG AA) for text tokens.

3. **Comments are always italic.** Both `comment` and `comment.doc` use `font_style: "italic"`. This is non-negotiable — it is the clearest visual signal that content is non-executable.

4. **Doc comments are slightly brighter than regular comments** in the dark variant (Navy-300 vs Navy-400). In the light variant they share the same step (Slate-600) since the contrast budget is tighter on a white background.

5. **Escape sequences must not be muted.** A muted escape sequence (`\n`, `\t`, `\\`) inside a yellow-on-dark YAML string value is nearly invisible. Escape sequences use Purple to make them clearly readable and semantically distinct from the string they appear in.

6. **Teal is reserved for structure, not content.** Teal (property, tag, selector.pseudo, list markers) marks structural tokens — the *shape* of data. Green marks content — the *value* of data. Never swap them.

7. **Backgrounds use opacity only for transient states.** Solid backgrounds are for permanent layers. Opacity-based backgrounds (10–40%) are for hover, selection, match highlighting, and diagnostics — states that overlay the layer beneath them.

8. **Extending the teal scale.** If a new step is needed (e.g., Teal-200 for a subtle background tint), derive it at H ≈ 182°, following the same lightness/saturation progression as the adjacent accent scales at the equivalent step. Verify it reads as clearly "between blue and green" — not as either.
