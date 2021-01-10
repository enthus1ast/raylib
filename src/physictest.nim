import draylib
import draygui
import dphysac
# include dphysac

const screenWidth = 800
const screenHeight = 450
SetConfigFlags(uint32 FLAG_WINDOW_RESIZABLE)
SetTargetFPS(60)
InitWindow screenWidth, screenHeight, "gui example"



# var foo: seq[PhysicsBody] = @[] ##### <---------------------------------------- This creates c errors (the order of #include's is wrong, no idea how to fix this)

var otherColor = false

InitPhysics();
# // Create floor rectangle physics body
var floor: PhysicsBody = CreatePhysicsBodyRectangle(Vector2(x: screenWidth/2, y: screenHeight), 500.cfloat, 100.cfloat, 10.cfloat)
floor.enabled = false   #;         // Disable body state to convert it to static (no dynamics, but collisions)

# // Create obstacle circle physics body
var circle: PhysicsBody = CreatePhysicsBodyCircle(Vector2(x: screenWidth/2, y: screenHeight/2), 45, 10)
circle.enabled = false #;        // Disable body state to convert it to static (no dynamics, but collisions)


while not WindowShouldClose():    #  Detect window close button or ESC key

  RunPhysicsStep();


  ##  Physics body creation inputs


  if IsMouseButtonPressed(cint MOUSE_LEFT_BUTTON):
    # bodies.add CreatePhysicsBodyPolygon(GetMousePosition(), GetRandomValue(20, 80).cfloat, GetRandomValue(3, 8).cint, 10.cfloat)
    var foo = CreatePhysicsBodyPolygon(GetMousePosition(), GetRandomValue(20, 80).cfloat, GetRandomValue(3, 8).cint, 10.cfloat)
  # elif IsMouseButtonPressed(cint MOUSE_RIGHT_BUTTON):
  #   CreatePhysicsBodyCircle(GetMousePosition(), GetRandomValue(10, 45), 10)

  BeginDrawing()
  if otherColor:
    ClearBackground WHITE
  else:
    ClearBackground RED

  otherColor = GuiCheckBox(Rectangle(x: 25, y: 108, width: 15, height: 15), "OtherColor", otherColor);

  if (GuiButton(Rectangle(x: 25, y: 108 + 15 + 50, width: 50, height: 50), "quit")):
    quit()

  ###
  var bodiesCount = GetPhysicsBodiesCount()
  var i: cint = 0
  echo bodiesCount
  while i < bodiesCount:
    var body: PhysicsBody = GetPhysicsBody(i)
    if body != nil:
      var vertexCount: cint = GetPhysicsShapeVerticesCount(i)
      var j: cint = 0
      while j < vertexCount:
        ##  Get physics bodies shape vertices to draw lines
        ##  Note: GetPhysicsShapeVertex() already calculates rotation transformations
        var vertexA: Vector2 = GetPhysicsShapeVertex(body, j)
        var jj: cint = (if ((j + 1) < vertexCount): (j + 1) else: 0)
        ##  Get next vertex or first to close the shape
        var vertexB: Vector2 = GetPhysicsShapeVertex(body, jj)
        DrawLineV(vertexA, vertexB, GREEN)
        ##  Draw a line between two vertex positions
        inc(j)
    inc(i)


  DrawFPS(0, 0)
  EndDrawing()
