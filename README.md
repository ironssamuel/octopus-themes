# Octopus themes

Themes for IntelliJ, Zed, and Sublime Text based on the Octopus Deploy brand identity.

## Repo info

This repo is a mess. Its a workspace more than anything.

``/examples`` contains AI-generate sample code files used for previewing the theme across common development cases like Python, Rust, Go, etc. and common deployment cases like YAML and Terraform.

``intellij`` contains the plugin code and gradle build for constructing the IntelliJ theme plug-in.

``sublime-text`` and ``zed`` directories contain Octopus themes for each IDE respectively.

``octopus-style-guide.md`` contains the Octopus Deploy color scales (with a teal extension) and semantic meaning/mapping for colors in the themes.

## Installation

Install in IntelliJ:
1. Download the package found at [https://github.com/ironssamuel/octopus-themes/releases/tag/v1.0.0](https://github.com/ironssamuel/octopus-themes/releases/tag/v1.0.0)
2. In IntelliJ: Settings/Preferences → Plugins → ⚙️ → Install Plugin from Disk... → select the ZIP
3. Rstart IntelliJ.

Install in Zed:

1.  Copy the theme JSON file into Zed's theme directory ``~/.config/zed/themes``. You may need to make this directory first. 
2.  In Zed: Cmd+Shift+P → theme selector: toggle (or Settings → Theme) → pick Octopus Dark or Octopus Light.

Install in Sublime Text:

1.  Open Preferences → Browse Packages... This opens your local package directory.
2.  Copy both theme files into this directory.
3.  In Sublime Text: Preferences → Color Scheme... → select Octopus Light or Octopus Dark.
