# Pi themes

Custom themes live here. Referenced from `~/.pi/agent/settings.json` via
`"themes": ["themes"]`. Select one by setting `"theme": "<name>"`. See
`docs/themes.md` in the `@earendil-works/pi-coding-agent` package.

Theme files are validated strictly: no extra top-level keys (so no `"//"`
comment fields). Keep notes here instead.

## tokyonight-storm.json

Tokyo Night (Storm variant). Palette from folke/tokyonight.nvim. Storm has
lighter backgrounds than Night (`#24283b` vs `#1a1b26`) for higher fg contrast.
