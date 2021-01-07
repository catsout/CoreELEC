PKG_NAME="hostapd"
PKG_VERSION="2.7"
PKG_SHA256="21b0dda3cc3abe75849437f6b9746da461f88f0ea49dd621216936f87440a141"
PKG_LICENSE="GPL"
PKG_SITE="https://w1.fi/hostpad/"
PKG_URL="https://w1.fi/releases/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libnl openssl"
PKG_LONGDESC="hostapd is a user space daemon for access point and authentication servers."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+lto-parallel"
PKG_MAKE_OPTS_TARGET="-C hostapd V=1 LIBDIR=/usr/lib BINDIR=/usr/bin"
PKG_MAKEINSTALL_OPTS_TARGET="-C hostapd V=1 LIBDIR=/usr/lib BINDIR=/usr/bin"

configure_target() {
  LDFLAGS="$LDFLAGS -lpthread -lm"

  cp $PKG_DIR/config/makefile.config hostapd/.config
}
