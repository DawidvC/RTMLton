(* at this point, basis is booting, once callFromCHandler
   is set, the following SML code will execute via
   the trampoline in posix thread 0. If you do not
   see the print output, then the trampoline isnt working *)
   open OS.Process
   open MLton.Thread
val a = 9320
val _ = print "test2 was running and is going to sleep\n"

(*val _ = MLton.PrimThread.push("test again")*)

val _ = MLton.Thread.spawn (fn () => print "test From Spawn\n *********** \n")

val _ = MLton.Thread.spawn(fn () => print "test again function 2 from spawn \n ******* \n" )


fun inf_sleep t= OS.Process.sleep t

fun pause () = (inf_sleep (Time.fromSeconds 2)
                ; pause ())
val _ = pause ()


