class Cfiles < Formula
  desc "ncurses file manager written in C"
  homepage "https://github.com/mananapr/cfiles"
  url "https://github.com/mananapr/cfiles/archive/v1.6.1.tar.gz"
  sha256 "d96e3322350910b30ffcac025d643e5b90f3432e6395fb39cd06dc048149591f"
  revision 2

  depends_on "fzf"
  depends_on "atool" => :optional
  depends_on "mediainfo" => :optional

  def install
    inreplace "config.h" do |s|
        s.gsub! "xdg-open", "open"
        s.gsub! "/usr/local/bin/displayimg_uberzug", "#{bin}/displayimg_uberzug"
        s.gsub! "/usr/local/bin/clearimg_uberzug", "#{bin}/clearimg_uberzug"
    end
    inreplace "Makefile" do |s|
        s.gsub! "gcc", "cc"
        s.gsub! "-lncursesw", "-lncurses"
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
