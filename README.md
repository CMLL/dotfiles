# dotfiles
Collection of dotfiles

STOW install for the window-manager packages (`herbstluftwm/`, `i3*`, ...).

`nvim/` and `zed/` are deployed by mise's `[dotfiles]` entries in `mise.toml`:
each is symlinked whole into `$XDG_CONFIG_HOME` (default `~/.config`).

```sh
mise trust        # once, in this directory
mise dot status   # show entry state, change nothing
mise dot diff     # show what apply would change
mise dot apply    # create the symlinks
```

A target that already exists and is not the expected symlink aborts the entire
apply — nothing is linked until it is resolved. `mise dot apply --force`
replaces such a target **without keeping a backup**, so move it aside yourself
first.

Add a package with another `[dotfiles."~/.config/<name>"]` entry in `mise.toml`.

Because `zed/` is linked whole, Zed writes its runtime state (`themes/`,
`prompts/`, `conversations/`, ...) directly into this repo; `zed/.gitignore`
keeps that untracked.
