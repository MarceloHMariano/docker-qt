#!/bin/sh
set -e

DOC_DIR="/usr/share/doc/packages"
QT_DOC_DIR="$DOC_DIR/qt5"

CACHE="/tmp"

ARCH="noarch"
REPO="KDE:Unstable:Qt"

if [ ! -d "$QT_DOC_DIR" ]; then
  zypper --pkg-cache-dir="$CACHE" download libqt5-qtdoc-qch

  if [ -d "$CACHE/$REPO/$ARCH" ]; then
    pushd "$CACHE/$REPO/$ARCH" >/dev/null

    rpm2cpio *.rpm | cpio -idm
    cp -r "${PWD}${DOC_DIR}/"* "$DOC_DIR"

    popd >/dev/null
    rm -rf "$CACHE/$REPO"
  fi
fi