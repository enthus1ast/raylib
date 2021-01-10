# import draylib
import draymath
import nimterop/[build, cimport]
import os
static:
  cAddStdDir("c")
  cAddSearchDir(currentSourcePath.parentDir())
cDefine("PHYSAC_IMPLEMENTATION")
# cDefine("PHYSAC_STATIC")

{.experimental: "codeReordering".}

const pathHeader = cSearchPath("physac.h")
# cIncludeDir(currentSourcePath.parentDir())
# cImport(pathHeader, recurse = false, flags = "--prefix:_ --passC=-DPHYSAC_IMPLEMENTATION --passC=-DPHYSAC_STATIC --symOverride=defineEnum")
# cImport(pathHeader, recurse = true, flags = "--prefix:_ --passC=-DPHYSAC_IMPLEMENTATION --passC=-DPHYSAC_STATIC --passC=static --passL=libpthread --symOverride=defineEnum --typeMap=pthread_t=int")
# cImport(pathHeader, recurse = false, flags = "--prefix:_ --passC=-DPHYSAC_IMPLEMENTATION --passC=-DPHYSAC_STATIC --symOverride=defineEnum --typeMap=pthread_t=int")
# cCompile(cSearchPath("raylib.h")) #, recurse = false, flags = "--prefix:_ --symOverride='defineEnum'" )
import draylib
cImport(pathHeader, recurse = false, flags = "--prefix:_ --passC=-DPHYSAC_IMPLEMENTATION --symOverride='defineEnum' --typeMap=pthread_t=uint32")
