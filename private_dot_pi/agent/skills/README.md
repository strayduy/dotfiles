# Pi skills

Hand-written, Pi-specific skill files live here. They're picked up because
`~/.pi/agent/settings.json` lists `"skills": ["skills"]` (paths in that file
resolve relative to `~/.pi/agent`).

Third-party skills are **not** vendored here. Declare them in
`dot_agents/agents.toml` (→ `~/.agents/agents.toml`) and let
[dotagents](https://github.com/getsentry/dotagents) install them into
`~/.agents/skills/`, which Pi reads natively.

See `docs/skills.md` in the `@earendil-works/pi-coding-agent` npm package for the
skill file format.
