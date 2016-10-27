(* at this point, basis is booting, once callFromCHandler
   is set, the following SML code will execute via
   the trampoline in posix thread 0. If you do not
   see the print output, then the trampoline isnt working *)
   open OS.Process
   open MLton.Thread
val a = 9320
val _ = print "test2 was running and is going to sleep\n"

(*val _ = MLton.PrimThread.push("test again")*)

fun fib n =
  if n < 3 then 
    1
  else
    fib (n-1) + fib (n-2)

fun printfib n = print ( Int.toString (fib (n)) ^ "\n ************** \n" )

val _ = MLton.Thread.spawn (fn () => printfib (10))

val _ = MLton.Thread.spawn(fn () => print "test again function 2 from spawn \n ******* \n" )


fun inf_sleep t= OS.Process.sleep t

fun pause () = (inf_sleep (Time.fromSeconds 2)
                ; pause ())
val _ = pause ()


