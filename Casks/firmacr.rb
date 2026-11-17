cask "firmacr" do
  version "1.3.1"
  sha256 "a15f141b9f0b33e56ec64ec3d19f7623b684214de721c238bf444994f468eb49"

  url "https://github.com/purabytes-hq/firma-cr-releases/releases/download/v#{version}/FirmaCR.dmg"
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
