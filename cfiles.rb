class Cfiles < Formula
  desc "ncurses file manager written in C"
  homepage "https://github.com/mananapr/cfiles"
  url "https://github.com/mananapr/cfiles/archive/v1.8.tar.gz"
  sha256 "c5f8111df59496aafd817af0b7c7dcf7177bc4baa84b03ddf0912ef69f4be8f6"
  revision 2

  depends_on "fzf"
  depends_on "pkg-config"
  depends_on "atool" => :optional
  depends_on "mediainfo" => :optional

  def install
    inreplace "config.h" do |s|
        s.gsub! "xdg-open", "open"
        s.gsub! "/usr/share/cfiles/scripts/displayimg_uberzug", "#{bin}/displayimg_uberzug"
        s.gsub! "/usr/share/cfiles/scripts/clearimg_uberzug", "#{bin}/clearimg_uberzug"
    end
    inreplace "Makefile" do |s|
        s.gsub! "gcc", "cc"
        s.gsub! "ncursesw", "ncurses"
    end

    system "make"

    bin.install "scripts/displayimg_uberzug"
    bin.install "scripts/displayimg"
    bin.install "scripts/clearimg_uberzug"
    bin.install "scripts/clearimg"
    bin.install "cfiles"
    man1.install "cfiles.1"
  end
end
