# Pi skills

Local skill files live here. They're picked up because `~/.pi/agent/settings.json`
lists `"skills": ["skills"]` (paths in that file resolve relative to `~/.pi/agent`).

See `docs/skills.md` in the `@earendil-works/pi-coding-agent` npm package for the
skill file format. For reusable skill bundles, prefer publishing them as an npm
package and referencing it from `settings.json`'s `packages` array instead of
vendoring them here.
