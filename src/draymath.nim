import nimterop/[build, cimport]
import os
import draylib
static:
  cAddStdDir("c")
  cAddSearchDir(currentSourcePath.parentDir())
# cDefine("PHYSAC_IMPLEMENTATION")
# cDefine("PHYSAC_STATIC")


#

const pathHeader = cSearchPath("raymath.h")
# cIncludeDir(currentSourcePath.parentDir())
# cImport(pathHeader, recurse = true, flags = "--prefix:_ --passC=-DRAYMATH_IMPLEMENTATION --passC=-DRAYMATH_HEADER_ONLY --symOverride=defineEnum")
# cImport(pathHeader, recurse = true, flags = "--prefix:_ --passC=-DRAYMATH_IMPLEMENTATION --passC=-DRAYMATH_STANDALONE --symOverride=defineEnum")
cImport(pathHeader, recurse = false, flags = "--prefix:_ --passC=-DRAYMATH_IMPLEMENTATION  --symOverride=defineEnum")
# cImport(pathHeader, recurse = false, flags = "--prefix:_ --passC=-DPHYSAC_IMPLEMENTATION --passC=-DPHYSAC_STATIC --symOverride=defineEnum")
