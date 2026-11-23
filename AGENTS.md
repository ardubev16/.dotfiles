# AGENTS.md

Personal dotfiles managed with Nix flakes + Home Manager, laid out per [numtide/blueprint](https://github.com/numtide/blueprint). Hosts are non-NixOS (Fedora); system packages come from `dnf`, user packages from Nix.

## Layout

- `flake.nix` — inputs only; blueprint discovers everything else.
- `hosts/<host>/users/<user>.nix` — Home Manager config per user@host (`home-manager switch --flake .#<user>@<host>`).
  - `odin` — personal PC (laptop, often docked to two external monitors), `global.gui = true`.
  - `work` — work machine, CLI only.
- `modules/home/` — shared Home Manager modules exported as `inputs.self.homeModules.*`:
  - `baseUser.nix` — imported by every user; pulls in `applications/` and `desktops/`.
  - `options/` — `global.*` options (`notNixOS`, `gui`).
  - `toolsets/` — opt-in package bundles (`global.toolsets.<name> = true`).
  - `theme.nix` — Stylix theming.
- `applications/` — CLI app configs (editor, git, shell, tmux, terminal). `applications/editor/nvim` is a git submodule.
- `desktops/` — desktop environments, all gated on `global.gui`:
  - `hyprland/` + `noctalia/` — **current setup on odin**: Hyprland (Lua config, `hypr/hyprland.lua`) with the Noctalia v5 shell (`config.toml`). Both are dnf packages; their config files are out-of-store symlinks, so edits apply without a Home Manager switch (`hyprctl reload`, `noctalia msg config-reload`).
  - `gnome/` — GNOME settings/extensions (not the current desktop on odin).
- `kmonad/` — keyboard remapping config per host.
- `99-legacy/` — old pre-Nix configs (i3, zsh, vim); reference only, not wired in.
- `install.sh` — bootstrap (Nix + first Home Manager switch).

## Notes

- Noctalia: validate with `noctalia config validate`; inspect effective values with `noctalia config export full`. GUI-made overrides live in `~/.local/state/noctalia/settings.toml`, not in the repo.
- Pre-commit hooks are in `.pre-commit-config.yaml` (run with `prek`).
