cask "1code" do
  arch arm: "arm64", intel: ""

  version "0.0.24"
  sha256 arm:   "a52b281303078fedb516f78c41f5190feba589644559f938034da20b26c7d0c9",
         intel: "d2cba0db75f40bcf5468359b90ce3ebbcef00fbc50cdc1617d8acc92e895fa6b"

  url "https://cdn.21st.dev/releases/desktop/1Code-#{version}#{"-" + arch unless arch.empty?}.dmg",
      verified: "cdn.21st.dev/releases/desktop/"
  name "1Code"
  desc "Better UI app for running code agents in parallel"
  homepage "https://1code.dev/"

  livecheck do
    url "https://cdn.21st.dev/releases/desktop/latest-mac.yml"
    regex(/version:\s*(\d+(?:\.\d+)+)/i)
  end

  depends_on macos: ">= :monterey"

  app "1Code.app"

  zap trash: [
    "~/Library/Application Support/1Code",
    "~/Library/Preferences/dev.21st.agents.plist",
  ]
end
