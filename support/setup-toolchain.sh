#! /bin/sh

TOOLCHAIN_VERSION="2020.06-01"
TOOLCHAIN_TAR="Codescape.GNU.Tools.Package.$TOOLCHAIN_VERSION.for.MIPS.MTI.Bare.Metal.CentOS-6.x86_64.tar.gz"
TOOLCHAIN_PATH=/opt
TOOLCHAIN_URL="https://codescape.mips.com/components/toolchain/$TOOLCHAIN_VERSION/$TOOLCHAIN_TAR"

mkdir -p "$TOOLCHAIN_PATH"
if [ -f "./$TOOLCHAIN_TAR" ]; then
	cp "./$TOOLCHAIN_TAR" "$TOOLCHAIN_PATH"
	cd "$TOOLCHAIN_PATH"
	echo "extracting local toolchain"
else
	cd "$TOOLCHAIN_PATH"
	wget "$TOOLCHAIN_URL"
	echo "extracting remote toolchain $TOOLCHAIN_TAR"
fi
tar xf "./$TOOLCHAIN_TAR"
rm -rf "./$TOOLCHAIN_TAR"

export TC_VERSION=$TOOLCHAIN_VERSION
