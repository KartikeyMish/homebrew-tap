cask "claude-cockpit" do
  version "1.6.0"
  # `make release` in claude-cockpit sets version and sha256 from the published
  # claude-cockpit-<version>.tar.gz.sha256 asset; all zeros means "not released yet".
  sha256 "4fe727ff77a41c8948b84b8d395c92ab6a7da451665cc4086c6993fa989ee686"

  url "https://github.com/KartikeyMish/claude-cockpit/releases/download/v#{version}/claude-cockpit-#{version}.tar.gz"
  name "claude-cockpit"
  desc "Tiered Claude Code agents, a session dashboard and a Ghostty profile"
  homepage "https://github.com/KartikeyMish/claude-cockpit"

  livecheck do
    url :url
    strategy :github_latest
  end

  # No `depends_on formula: "python@3.x"`, on purpose. ccx starts with
  # `#!/usr/bin/env python3`, and a versioned python@3.x keg puts `python3` only in
  # libexec/bin, which is not on PATH, so it would not satisfy the shebang. The
  # Command Line Tools, which Homebrew itself requires, always provide
  # /usr/bin/python3 (3.9 or newer), and ccx explains itself on anything older.
  binary "claude-cockpit-#{version}/bin/ccx"

  zap trash: "~/.config/ghostty/cockpit.conf"

  caveats <<~EOS
    To install the Claude Code plugin and the Ghostty profile, run:
      ccx setup

    Run it again after `brew upgrade --cask claude-cockpit`. To let Claude Code
    update the plugin by itself, open /plugin → Marketplaces → claude-cockpit
    and enable auto-update.

    ccx needs python3 3.9 or newer on PATH.
  EOS
end
