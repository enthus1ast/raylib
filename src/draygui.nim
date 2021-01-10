import nimterop/[build, cimport]
import os
import draylib
static:
  cAddStdDir("c")
  cAddSearchDir(currentSourcePath.parentDir())
const pathHeader = cSearchPath("raygui.h")
cImport(pathHeader, recurse = false, flags = "--prefix:_ --passC=-DRAYGUI_IMPLEMENTATION --symOverride=defineEnum")
