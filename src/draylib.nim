import nimterop/[build, cimport]
import os

{.passl: "libraylibdll.a".} # TODO?

type cuchar = uint8 # mapping of more sane type # TODO?
static:
  cAddStdDir("c")
  cAddSearchDir(currentSourcePath.parentDir())
const pathHeader = cSearchPath("raylib.h")
cImport(pathHeader, recurse = false, flags = "--prefix:_" ) # typeMap? TODO


proc `+`*(vecA, vecB: Vector2): Vector2 =
  return Vector2(x: vecA.x + vecB.x, y: vecA.y + vecB.y)

proc `-`*(vecA, vecB: Vector2): Vector2 =
  return Vector2(x: vecA.x - vecB.x, y: vecA.y - vecB.y)

## Some colors that could not be automatically converted
const LIGHTGRAY* = Color(r:200, g: 200, b: 200, a: 255)
const GRAY* = Color(r:130, g: 130, b: 130, a: 255)
const DARKGRAY* = Color(r:80, g: 80, b: 80, a: 255)
const YELLOW* = Color(r:253, g: 249, b: 0, a: 255)
const GOLD* = Color(r:255, g: 203, b: 0, a: 255)
const ORANGE* = Color(r:255, g: 161, b: 0, a: 255)
const PINK* = Color(r:255, g: 109, b: 194, a: 255)
const RED* = Color(r:230, g: 41, b: 55, a: 255)
const MAROON* = Color(r:190, g: 33, b: 55, a: 255)
const GREEN* = Color(r:0, g: 228, b: 48, a: 255)
const LIME* = Color(r:0, g: 158, b: 47, a: 255)
const DARKGREEN* = Color(r:0, g: 117, b: 44, a: 255)
const SKYBLUE* = Color(r:102, g: 191, b: 255, a: 255)
const BLUE* = Color(r:0, g: 121, b: 241, a: 255)
const DARKBLUE* = Color(r:0, g: 82, b: 172, a: 255)
const PURPLE* = Color(r:200, g: 122, b: 255, a: 255)
const VIOLET* = Color(r:135, g: 60, b: 190, a: 255)
const DARKPURPLE* = Color(r:112, g: 31, b: 126, a: 255)
const BEIGE* = Color(r:211, g: 176, b: 131, a: 255)
const BROWN* = Color(r:127, g: 106, b: 79, a: 255)
const DARKBROWN* = Color(r:76, g: 63, b: 47, a: 255)
const WHITE* = Color(r:255, g: 255, b: 255, a: 255)
const BLACK* = Color(r:0, g: 0, b: 0, a: 255)
const BLANK* = Color(r:0, g: 0, b: 0, a: 0)
const MAGENTA* = Color(r:255, g: 0, b: 255, a: 255)
const RAYWHITE* = Color(r:245, g: 245, b: 245, a: 255)