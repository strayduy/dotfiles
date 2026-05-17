# AGENTS.md

Notes for AI/coding agents working in this repository.

## What this repo is

A personal dotfiles repository managed by [chezmoi](https://www.chezmoi.io/).
Targets **macOS** and **Ubuntu/Debian Linux**. The source tree here is rendered
into `$HOME` by `chezmoi apply`.

## chezmoi naming conventions used here

chezmoi renames source files when applying them. Some prefixes you will see:

- `dot_foo`              → `~/.foo`
- `exact_foo/`           → `~/.foo/` with chezmoi removing files in the target
                           that aren't in source (an "exact" directory)
- `executable_foo.sh`    → `~/.foo.sh` with the executable bit set
- `run_once_<name>.sh`   → script run once (re-runs only when its contents
                           change). `run_once_before_` runs before files are
                           applied, `run_once_after_` runs after.
- `<file>.tmpl`          → Go-template-rendered by chezmoi. Inside templates,
                           `{{ .chezmoi.os }}` is `"darwin"` or `"linux"`,
                           `{{ .chezmoi.osRelease.id }}` is e.g. `"ubuntu"`.

Docs: <https://www.chezmoi.io/reference/source-state-attributes/>.

## Layout

```
.
├── AGENTS.md
├── README.md
├── dot_zshenv                              → ~/.zshenv (sets ZDOTDIR)
├── tmux.conf                               (not currently managed by chezmoi;
│                                            see "Known quirks" below)
├── run_once_before_10-install-packages.sh.tmpl
│       OS-dispatched installer for system packages. Uses Homebrew on macOS
│       and apt + upstream installers on Ubuntu/Debian.
├── run_once_after_20-install-mise-tools.sh.tmpl
│       Installs language runtimes (Node, Python, Bun) via mise.
├── run_once_after_30-install-pi.sh.tmpl
│       Installs the Pi coding agent (`@earendil-works/pi-coding-agent`)
│       globally via mise's node@lts.
├── private_dot_pi/                         → ~/.pi/ (mode 0700)
│   └── agent/
│       ├── settings.json.tmpl              global Pi settings
│       ├── extensions/                     local Pi extensions
│       ├── skills/                         local Pi skills
│       ├── prompts/                        local Pi prompt templates
│       └── themes/                         local Pi themes
└── dot_config/                             → ~/.config/
    ├── zsh/
    │   ├── dot_zshrc                       → ~/.config/zsh/.zshrc
    │   └── config/*.zsh                    sourced from .zshrc in lex order
    │       ├── aliases.zsh                 personal + ported oh-my-zsh git aliases
    │       ├── bun.zsh                     BUN_INSTALL / completions
    │       ├── devtools.zsh                starship, zoxide (`j`), shell-color-scripts
    │       └── mise.zsh                    `eval $(mise activate zsh)`
    ├── mise/config.toml                   declarative list of language runtimes
    ├── exact_nvim/                         Neovim config (lua/, lsp/, lazy.nvim)
    ├── wezterm/wezterm.lua                 terminal emulator
    ├── starship.toml                       prompt
    ├── aerospace/aerospace.toml            macOS tiling WM
    ├── borders/bordersrc                   macOS window borders (JankyBorders)
    └── sketchybar/                         macOS status bar (executable_ scripts)
```

## OS-conditional bits

- **macOS-only configs:** `aerospace/`, `borders/`, `sketchybar/`. These are
  harmless on Linux because the apps don't exist there, but the install script
  only installs them via Homebrew casks on `darwin`.
- **Everything else** (zsh, nvim, wezterm, starship, tmux) is cross-platform.

If you add Linux-specific or macOS-specific config, prefer a `.tmpl` with
`{{ if eq .chezmoi.os "darwin" }} ... {{ end }}` over forking files.

## Bootstrap flow on a fresh machine

```sh
# 1. install chezmoi (one-liner from chezmoi.io)
sh -c "$(curl -fsLS get.chezmoi.io)"

# 2. apply this repo — chezmoi will run the run_once_ scripts automatically
chezmoi init --apply <github-user>/dotfiles
```

The run-once scripts in order:

1. `run_once_before_10-install-packages.sh.tmpl`
   - macOS: installs Homebrew if needed, then installs CLI formulae and
     GUI casks (wezterm, aerospace, sketchybar, borders, Meslo Nerd Font).
   - Ubuntu/Debian: `apt-get install` for the core tools, then upstream
     installers for tools that aren't reliably packaged (chezmoi, mise,
     starship, zoxide, eza, neovim AppImage).
2. chezmoi applies all the dot_* files.
3. `run_once_after_20-install-mise-tools.sh.tmpl`
   - Runs `mise install` to realize the runtimes declared in
     `~/.config/mise/config.toml`.

Re-run any time with `chezmoi apply`. Scripts only re-execute when their
content changes (chezmoi tracks them by SHA256).

## Runtime management: mise

We use [mise](https://mise.jdx.dev/dev-tools/) instead of `nvm`/`pyenv`/etc.

- Activation lives in `dot_config/zsh/config/mise.zsh`.
- Global tool versions are declared in `dot_config/mise/config.toml`
  (rendered to `~/.config/mise/config.toml`). Edit that file to add/remove
  runtimes; on the next `chezmoi apply` the bootstrap script will `mise
  install` to reconcile.
- Per-project pins: drop a `mise.toml` or `.tool-versions` in the project root.
- The `run_once_after_` script only re-runs when *its own* contents change.
  After editing `dot_config/mise/config.toml`, either run `mise install`
  manually or bump the `mise-config-revision:` comment in the script to
  force chezmoi to re-execute it.

## Conventions for editing this repo

- **Test template rendering** before committing:
  `chezmoi execute-template < some_file.tmpl`
  or `chezmoi cat ~/path/to/target`.
- **Dry-run an apply:** `chezmoi apply --dry-run --verbose`.
- **Diff against current $HOME:** `chezmoi diff`.
- **Re-run a script during testing:** delete its hash from
  `~/.config/chezmoi/chezmoistate.boltdb` (or
  `chezmoi state delete-bucket --bucket=scriptState`).
- Keep the package list in `run_once_before_10-install-packages.sh.tmpl`
  in sync with whatever the shell/nvim configs actually invoke. When you
  add a new CLI dependency to a config file, add it to that script too.
- Number scripts (`10-`, `20-`, ...) so insertion order is obvious; chezmoi
  runs `run_once_before_` scripts in lex order, then files, then
  `run_once_after_` scripts.

## Pi coding agent

[Pi](https://pi.dev) global config lives at `~/.pi/agent/` and is managed here
as `private_dot_pi/agent/` (chezmoi `private_` keeps the dir at mode `0700`,
appropriate since it sits next to credentials).

- **Settings:** `private_dot_pi/agent/settings.json.tmpl` → `~/.pi/agent/settings.json`.
  Edit this file to change model defaults, theme, retry/compaction, etc.
  Paths inside it resolve relative to `~/.pi/agent`.
- **Local resources:** drop custom extensions/skills/prompts/themes into the
  matching subdirectory; `settings.json` already lists each by name.
- **Reusable bundles:** prefer publishing as an npm/git package and adding it
  to `settings.json`'s `packages` array (see `docs/packages.md` shipped with
  the npm package) over vendoring lots of files here.
- **Not tracked:** `~/.pi/agent/auth.json` (credentials) and `~/.pi/agent/sessions/`
  (conversation history) are deliberately not in this repo. chezmoi only
  manages files that exist in source, so it won't touch them.
- **Project-scoped overrides** go in `<project>/.pi/settings.json` and should
  be committed to *that project's* repo, not this dotfiles repo.
- **Install:** `run_once_after_30-install-pi.sh.tmpl` does
  `mise exec node@lts -- npm install -g @earendil-works/pi-coding-agent`.
  Bump its `pi-revision:` comment to force a reinstall/upgrade on the next
  `chezmoi apply`.

## Known quirks

- `tmux.conf` at the repo root is **not** named with a `dot_` prefix, so
  chezmoi will not place it at `~/.tmux.conf`. If that's intentional (e.g.
  it's a reference copy), leave it; otherwise rename to `dot_tmux.conf`.
- `dot_zshenv` puts `$PATH=$PATH:$HOME/.local/bin:...`. Some installers
  (mise, chezmoi, starship on Linux) drop binaries in `~/.local/bin`, so
  shells started before the first `chezmoi apply` may not see them — open
  a new shell after bootstrap.
- The Ubuntu installer symlinks `fdfind`→`fd` and `batcat`→`bat` into
  `~/.local/bin` because Debian renames those binaries.
- On Ubuntu, neovim is installed from the upstream AppImage (apt's nvim is
  usually too old for the lua/lazy.nvim config in `exact_nvim/`).
