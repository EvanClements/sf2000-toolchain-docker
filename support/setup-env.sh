#!/bin/bash

# export TOOLCHAIN_VERSION?
export PATH=/opt/sf2000-toolchain/bin/mips-mti-elf-:/bin:/usr/bin
export CROSS_COMPILE=/opt/sf2000-toolchain/bin/mips-mti-elf-
export update-toolchain="grep -rli "mips32-mti-elf\/2019.09-03-2" * | xargs -i@ sed -i "" 's/mips32-mti-elf\/2019.09-03-2/sf2000-toolchain/g' @"
