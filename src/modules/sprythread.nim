import spryvm, sprymath, spryos, spryio
import threadpool

# Spry threading
proc spawnDo(node: Blok) {.gcsafe.} =
  let spry = newInterpreter()
  spry.addMath()
  spry.addOS()
  spry.addIO()
  discard node.evalRootDo(spry)

proc addThread*(spry: Interpreter) =
  nimPrim("spawn", false):
    spawn spawnDo(Blok(evalArg(spry)))
