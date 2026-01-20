cask "agentastic" do
  version "0.5.3"
  sha256 "9e7812ea669ddbbd5e1445843b246cefc161bb44edfb46f3fea41bdbfbcd0bc0"

  url "https://releases.agentastic.ai/agentasticdev/Agentastic.dev-#{version}.dmg",
      verified: "releases.agentastic.ai/agentasticdev/"
  name "Agentastic.dev"
  desc "AI agent IDE for building, testing, and deploying AI agents"
  homepage "https://www.agentastic.dev/"

  livecheck do
    url "https://releases.agentastic.ai/agentasticdev/"
    regex(/Agentastic\.dev[._-]v?(\d+(?:\.\d+)+)\.dmg/i)
  end

  depends_on macos: ">= :monterey"

  app "Agentastic.dev.app"

  zap trash: [
    "~/Library/Application Scripts/dev.agentastic.Agentastic.OpenWithCodeEdit",
    "~/Library/Application Support/Agentastic.dev",
    "~/Library/Containers/dev.agentastic.Agentastic.OpenWithCodeEdit",
    "~/Library/Group Containers/dev.agentastic.Agentastic.shared",
    "~/Library/Preferences/dev.agentastic.Agentastic.plist",
  ]
end
