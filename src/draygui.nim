import nimterop/[build, cimport]
import draylib
cImport("./raygui.h", recurse = false, flags = "--prefix:_ --passC=-DRAYGUI_IMPLEMENTATION --symOverride=defineEnum" ) # This works
