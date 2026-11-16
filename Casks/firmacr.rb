cask "firmacr" do
  version "1.3.0"
  sha256 "98b00d79bd9050271b98bd47b9ae7a1bc17367438e0a43359c6aa6c0645df2cf"

  url "https://github.com/aloaiza-dev/firma-cr-releases/releases/download/v#{version}/FirmaCR.dmg"
  name "FirmaCR"
  desc "Sign and verify PDFs with a Costa Rican digital-signature card"
  homepage "https://firmacr.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "FirmaCR.app"

  zap trash: [
    "~/Library/Application Support/FirmaCR",
    "~/Library/Caches/cr.firma.FirmaCR",
    "~/Library/HTTPStorages/cr.firma.FirmaCR",
    "~/Library/Preferences/cr.firma.FirmaCR.plist",
  ]

  caveats <<~EOS
    To sign, FirmaCR needs the card driver from the BCCR installer for Mac:
      https://www.soportefirmadigital.com/
  EOS
end
