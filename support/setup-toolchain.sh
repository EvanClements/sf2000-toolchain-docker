#! /bin/sh

# Set variables to assist with setting up the toolchain
TOOLCHAIN_VERSION="2019.09-03"
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

# This will identify the path the toolchain was originally installed to
if [ -d "$TOOLCHAIN_PATH/mips-mti-elf/$TOOLCHAIN_VERSION" ]; then
	OLDPATH="$TOOLCHAIN_PATH/mips-mti-elf"
 elif [ -d "$TOOLCHAIN_PATH/mips32-mti-elf/$TOOLCHAIN_VERSION" ]; then
	OLDPATH="$TOOLCHAIN_PATH/mips32-mti-elf"
fi

# This will move the toolchain to /opt/sf2000-toolchain to simplify the toolchain
# making it so that no matter what the toolchain version is, the rest of the container and SDK
# doesn't need to be changed
# mv "$OLDPATH/$TOOLCHAIN_VERSION" "$TOOLCHAIN_PATH/sf2000-toolchain"

# Clean up, clean up, everybody clean up
# rm -rf "$OLDPATH"
rm -rf "./$TOOLCHAIN_TAR"
