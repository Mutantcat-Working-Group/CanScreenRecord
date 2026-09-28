cask "canscreenrecord" do
  # Version and checksums are placeholders until the first CanScreenRecord
  # release is published from this repository.
  arch arm: "arm64", intel: "x64"

  version "1.0.20260928"
  sha256 arm:   "0000000000000000000000000000000000000000000000000000000000000000",
         intel: "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/Mutantcat-Working-Group/CanScreenRecord/releases/download/v#{version}/CanScreenRecord-#{arch}.dmg"
  name "CanScreenRecord"
  desc "Open-source screen recorder and editor"
  homepage "https://github.com/Mutantcat-Working-Group/CanScreenRecord"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "CanScreenRecord.app"

  zap trash: [
    "~/Library/Application Support/CanScreenRecord",
    "~/Library/Preferences/org.mutantcat.canscreenrecord.plist",
    "~/Library/Saved Application State/org.mutantcat.canscreenrecord.savedState",
  ]
end
