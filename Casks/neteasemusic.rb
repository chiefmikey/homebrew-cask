cask "neteasemusic" do
  version "2.3.9_880"
  sha256 "9eb9de2e8a90bfe89ecf7c980bad34cfaecbbcef37a159291e8277a42c5d616e"

  url "https://d1.music.126.net/dmusic/NeteaseMusic_#{version}_web.dmg",
      verified:   "d1.music.126.net/",
      user_agent: :fake
  name "NetEase cloud music"
  name "网易云音乐"
  desc "Music streaming platform"
  homepage "https://music.163.com/"

  # The Sparkle feed uses non-English pubDates, which are not parsed correctly
  # by the `:sparkle` strategy. As a workaround, the version is just extracted
  # from the XML using a regex pattern on the download URLs.
  livecheck do
    url "https://music.163.com/api/osx/download/latest"
    strategy :header_match
    regex(/NeteaseMusic[._-]v?(\d+(?:[._]\d+)+)_web/i)
  end

  depends_on macos: ">= :sierra"

  app "NeteaseMusic.app"

  uninstall quit: "com.netease.163music"

  zap trash: [
    "~/Library/Application Support/com.netease.163music",
    "~/Library/Caches/com.netease.163music",
    "~/Library/Containers/com.netease.163music",
    "~/Library/Cookies/com.netease.163music.binarycookies",
    "~/Library/Preferences/com.netease.163music.plist",
    "~/Library/Saved Application State/com.netease.163music.savedState",
  ]
end
