import data


// effect val ask : int

// effect my-handlers
//   fun print-name( name : string ) : ()
//   ctl finish( msg : string ) : a


// pub fun foo(msg : string) : console string
//   with handler
//     fun print-name(m) { println(m) }
//     ctl finish(m) { "error: " ++ m }
//   if msg == "bob" then { finish(msg) }
//   print-name(msg)
//   msg
  


effect val limit : int
effect ctl finish( msg : string ) : a
effect fun emit( msg : string ) : ()
effect fun combine( vals : list<string> ) : string

val join-underscore= handler
  fun combine(vals) vals.reverse.join("_")

val join-hyphen = handler
  fun combine(vals) vals.reverse.join("-")

fun emit-collect( action : () -> <emit,combine,finish,limit|e> () ) : <combine,finish,limit|e> string
  var lines := []
  var count := 0
  with handler
    return(x) combine(lines)
    fun emit(msg) {
      count := count + 1
      lines := Cons(msg,lines)
      if count >= limit then {
        finish(combine(lines))
      }
    }
  action()
 

fun baz(): string
  with val limit = 3
  with handler 
    ctl finish(x) { "finished: " ++ x }
  with join-hyphen
  with emit-collect
  emit("who")
  emit("are")
  emit("you")
  emit("who")
  emit("are")
  emit("you")


pub fun main()
  val f = baz()
  println(f)
  // println()
  // val output = foo("jim")
  // println("name is: " ++ output)
 

// // Calculate the `n`'th fibnacci number.
// fun fibonacci(n : int) : div int
//   fib(n, 0, 1)

// fun fib(n : int, x1 : int, x2 : int) : div int
//   if n<=0 then x1 else fib(n - 1, x2, x1+x2)

// pub fun examplex()
//   fibonacci(100).println

// pub fun example2()
//   fibonacci(1000).println

 