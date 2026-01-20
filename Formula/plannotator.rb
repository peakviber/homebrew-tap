class Plannotator < Formula
  desc "Visual plan annotation and code review tool for AI coding agents"
  homepage "https://plannotator.ai/"
  version "0.6.7"
  license "BSL-1.1"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/backnotprop/plannotator/releases/download/v#{version}/plannotator-darwin-arm64"
      sha256 "9d1964de806853cfdb3c17fd429a5bc5665a7c0994211597f58c5b673d3601b6"
    end

    on_intel do
      url "https://github.com/backnotprop/plannotator/releases/download/v#{version}/plannotator-darwin-x64"
      sha256 "708af1e1e054ab90d161d1f40826acf53173c2954e4780bfff02e4d9e46b6790"
    end
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "plannotator"
  end

  def caveats
    <<~EOS
      To set up Claude Code/OpenCode integrations, manually create the slash commands:

      For Claude Code:
        mkdir -p ~/.claude/commands
        cat > ~/.claude/commands/plannotator-review.md << 'EOF'
        ---
        description: Open interactive code review for current changes
        allowed-tools: Bash(plannotator:*)
        ---

        ## Code Review Feedback

        !`plannotator review`

        ## Your task

        Address the code review feedback above.
        EOF

      For OpenCode:
        mkdir -p ~/.config/opencode/command
        # Create ~/.config/opencode/command/plannotator-review.md

      See https://github.com/backnotprop/plannotator for details.
    EOS
  end

  test do
    assert_predicate bin/"plannotator", :executable?
  end
end
