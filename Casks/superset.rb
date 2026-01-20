cask "superset" do
  version "0.0.58"
  sha256 "6d096ec325b9e91ff4b2c7db7e2f502986914dd50c2d73843c7055dc02ba21cf"

  url "https://github.com/superset-sh/superset/releases/download/desktop-v#{version}/Superset-#{version}-arm64.dmg",
      verified: "github.com/superset-sh/superset/"
  name "Superset"
  desc "AI-native development environment with real-time collaboration"
  homepage "https://www.superset.sh/"

  livecheck do
    url :url
    regex(/^desktop-v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on macos: ">= :monterey"
  depends_on arch: :arm64

  app "Superset.app"

  zap trash: [
    "~/Library/Application Support/Superset",
    "~/Library/Preferences/com.superset.desktop.plist",
  ]
end
