class cfiles < Formula
  desc "ncurses file manager written in C"
  homepage "https://github.com/mananapr/cfiles"
  url "https://github.com/mananapr/cfiles/archive/v1.2.tar.gz"
  sha256 "2f3b8a2a5673621ee04c63ff70ec2942afd1fe8a6c1435373f503071a6980d2c"
  revision 1

  depends_on "ncurses"
  depends_on "fzf"
  depends_on "make"

  def install
    inreplace "config.h", "xdg-open", "open"
    inreplace "Makefile", "gcc", "cc"
    inreplace "Makefile", "-lncursesw", "-lncurses"

    system "make"

    system "install","-Dm755","scripts/displayimg","/usr/local/bin/displayimg"
    system "install","-Dm755","scripts/clearimg","/usr/local/bin/clearimg"
    system "install","-Dm755","scripts/displayimg_uberzug","/usr/local/bin/displayimg_uberzug"
    system "install","-Dm755","scripts/clearimg_uberzug","/usr/local/bin/clearimg_uberzug"

    bin.install "cfiles"
    man1.install "cfiles.1"
  end
end
