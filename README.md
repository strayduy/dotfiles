# dotfiles

My personal dotfiles, managed by [chezmoi](https://www.chezmoi.io/). Works on
**macOS** and **Ubuntu/Debian Linux**.

## What's in here

- **Shell** — zsh with a modular `~/.config/zsh/config/*.zsh` setup
  ([starship](https://starship.rs/) prompt, [zoxide](https://github.com/ajeetdsouza/zoxide)
  for `j`-style jumping, a big set of git aliases).
- **Editor** — [Neovim](https://neovim.io/) with `lazy.nvim` + LSP configs
  under `dot_config/exact_nvim/`.
- **Terminal** — [WezTerm](https://wezfurlong.org/wezterm/) (`dot_config/wezterm/`).
- **Multiplexer** — `tmux.conf`.
- **Runtimes** — [mise](https://mise.jdx.dev/) manages Node, Python, Bun, etc.
  Tools are declared in `dot_config/mise/config.toml`.
- **AI coding agent** — [Pi](https://pi.dev) global config under
  `private_dot_pi/agent/` (settings, custom skills/extensions/prompts/themes).
  Installed automatically via mise's node.
- **macOS extras** — [Aerospace](https://github.com/nikitabobko/AeroSpace)
  (tiling WM), [SketchyBar](https://github.com/FelixKratz/SketchyBar) (status
  bar), [JankyBorders](https://github.com/FelixKratz/JankyBorders).

## Install on a fresh machine

```sh
# Install chezmoi to ~/.local/bin, pull this repo, and apply it — all in one shot.
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply $GITHUB_USERNAME
```

Replace `$GITHUB_USERNAME` with your GitHub username (or pass it literally —
the variable is just a placeholder).

Once chezmoi finishes, point the local source repo at your own remote:

```sh
chezmoi cd
git remote set-url origin $GIT_REMOTE_URL
```

Replace `$GIT_REMOTE_URL` with the actual remote URL, e.g.
`git@github.com:yourname/dotfiles.git`.

Open a new shell when everything finishes so the updated `PATH` is picked up.

chezmoi will:

1. Run `run_once_before_10-install-packages.sh` — installs system packages
   via Homebrew (macOS) or apt + upstream installers (Ubuntu/Debian).
2. Render every `dot_*` / `exact_*` source path into `$HOME`.
3. Run `run_once_after_20-install-mise-tools.sh` — `mise install` to set up
   the language runtimes declared in `dot_config/mise/config.toml`.
4. Run `run_once_after_30-install-pi.sh` — `npm install -g` the
   [Pi coding agent](https://pi.dev) using the mise-managed node.

## Day-to-day

```sh
chezmoi diff             # show pending changes vs. ~
chezmoi apply            # apply changes
chezmoi apply -v -n      # dry-run with verbose output
chezmoi edit ~/.zshrc    # edit a managed file (opens the source)
chezmoi cd               # cd into the source repo
```

## Adding a language runtime

Edit `dot_config/mise/config.toml`:

```toml
[tools]
node   = "lts"
python = "latest"
bun    = "latest"
rust   = "latest"   # ← add it here
```

Then `chezmoi apply` (and bump the `mise-config-revision:` comment in
`run_once_after_20-install-mise-tools.sh.tmpl` if you want the bootstrap
script to re-run automatically), or just `mise install` directly.

## Adding a system package

Append to the relevant array in
`run_once_before_10-install-packages.sh.tmpl`:

- `BREW_FORMULAE` / `BREW_CASKS` for macOS
- `APT_PACKAGES` for Ubuntu/Debian (or add an upstream installer block below
  for tools not packaged on Ubuntu LTS)

Then `chezmoi apply` — chezmoi notices the script changed and re-runs it.

## Customizing the Pi coding agent

Pi's global config lives at `~/.pi/agent/`, managed here as
`private_dot_pi/agent/`:

- Edit `private_dot_pi/agent/settings.json.tmpl` for model defaults, theme,
  retry/compaction, etc. See `docs/settings.md` in the
  `@earendil-works/pi-coding-agent` npm package for the full schema.
- Drop custom extensions / skills / prompt templates / themes into the
  matching subdirectory — `settings.json` already references them by name.
- Project-scoped overrides go in `<project>/.pi/settings.json` and belong in
  *that project's* repo, not this one.
- Credentials (`~/.pi/agent/auth.json`) and conversation history
  (`~/.pi/agent/sessions/`) are intentionally not tracked.

To upgrade Pi, bump the `pi-revision:` comment in
`run_once_after_30-install-pi.sh.tmpl` and run `chezmoi apply`.

## Layout

See [`AGENTS.md`](./AGENTS.md) for the full directory map, chezmoi naming
conventions, and contributor notes.

## License

Personal config — use as inspiration, no warranty.
