cask "craft-agents" do
  arch arm: "arm64", intel: "x64"

  version "0.2.21"
  sha256 arm:   "a715f7795562b8be8da5f44cfb1098f2c44e812b5cef4e1a8967a76a11ed72df",
         intel: "ccc18b958be943ca30cee8fd76d87aa56502d17be1d3d343643ece18f670ccd7"

  url "https://github.com/lukilabs/craft-agents-oss/releases/download/v#{version}/Craft-Agents-#{version}-mac-#{arch}.dmg",
      verified: "github.com/lukilabs/craft-agents-oss/"
  name "Craft Agents"
  desc "Desktop client for AI coding agents with multitasking and session sharing"
  homepage "https://agents.craft.do/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "Craft Agents.app"

  zap trash: [
    "~/Library/Application Support/Craft Agents",
    "~/Library/Preferences/com.lukilabs.craft-agents.plist",
  ]
end
