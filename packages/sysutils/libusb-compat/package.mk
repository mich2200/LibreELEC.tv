# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libusb-compat"
PKG_VERSION="0.1.8"
PKG_SHA256="698c76484f3dec1e0175067cbd1556c3021e94e7f2313ae3ea6a66d900e00827"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libusb/libusb-compat-0.1"
PKG_URL="https://github.com/libusb/libusb-compat-0.1/releases/download/v${PKG_VERSION}/${PKG_NAME}-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libusb"
PKG_LONGDESC="The libusb project's aim is to create a Library for use by user level applications to USB devices."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--disable-log \
                           --disable-debug-log \
                           --disable-examples-build"

post_configure_target() {
  libtool_remove_rpath libtool
}

post_makeinstall_target() {
  rm -rf ${INSTALL}/usr/bin
  sed -e "s:\(['= ]\)/usr:\\1${SYSROOT_PREFIX}/usr:g" -i ${SYSROOT_PREFIX}/usr/bin/libusb-config
}
