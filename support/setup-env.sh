#!/bin/bash

# export TOOLCHAIN_VERSION?
export PATH=/opt/sf2000-toolchain/bin/mips-mti-elf-:/bin:/usr/bin
export CROSS_COMPILE=/opt/sf2000-toolchain/bin/mips-mti-elf-
# alias update-toolchain="grep -rl mips32-mti-elf\/2019.09-03* * | xargs sed -i "" 's/mips32-mti-elf\/2019.09-03*/sf2000-toolchain/bin//g'"
