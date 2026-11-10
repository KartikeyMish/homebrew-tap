# KartikeyMish/homebrew-tap

Homebrew casks by Kartikey Mishra.

| Cask | What it is |
|---|---|
| [`claude-cockpit`](Casks/claude-cockpit.rb) | [claude-cockpit](https://github.com/KartikeyMish/claude-cockpit): an orchestrated Claude Code setup with tiered agents, the `ccx` session dashboard and a Ghostty profile |

## Install

```bash
brew install --cask kartikeymish/tap/claude-cockpit
ccx setup
```

The fully qualified name taps this repository and trusts only this cask, so you don't need `brew tap` or `brew trust` first. `ccx setup` connects Claude Code to the plugin's release channel and installs the Ghostty profile. It is safe to run again at any time.

claude-cockpit is a cask rather than a formula, so it installs even when your Command Line Tools are out of date. `ccx` runs on the first `python3` on your PATH (3.9 or newer); macOS provides one with the Command Line Tools.

## Upgrade

```bash
brew upgrade --cask claude-cockpit
ccx setup
```

`ccx setup` refreshes the Claude Code plugin and the Ghostty profile after an upgrade. The plugin can also update on its own: in Claude Code, open `/plugin` → Marketplaces → claude-cockpit and enable auto-update.

## Uninstall

```bash
claude plugin uninstall orchestrator@claude-cockpit
claude plugin marketplace remove claude-cockpit   # also deletes the plugin's saved data
brew uninstall --cask claude-cockpit              # add --zap to delete ~/.config/ghostty/cockpit.conf too
```

`ccx setup` added two lines starting with `# claude-cockpit profile` to `~/.config/ghostty/config`. The include is optional, so it is harmless once the profile is gone, but you can delete both lines.

## How releases get here

Each claude-cockpit release (`make release VERSION=x.y.z` in that repository) publishes a GitHub Release with `claude-cockpit-x.y.z.tar.gz` and its `.sha256`, then commits the new `version` and `sha256` to [`Casks/claude-cockpit.rb`](Casks/claude-cockpit.rb). `brew livecheck` follows the latest GitHub release.

## License

[MIT](LICENSE)
