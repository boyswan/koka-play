module data

pub struct person
  age : int
  name : string
  realname : string = name



pub fun show-name( p : person) : string
  show(p.name)


pub fun foo(): person
  val brian = Person( 29, "Brian" )
  brian

// // Calculate the `n`'th fibnacci number.
// fun fibonacci(n : int) : div int
//   fib(n, 0, 1)

// fun fib(n : int, x1 : int, x2 : int) : div int
//   if n<=0 then x1 else fib(n - 1, x2, x1+x2)

// pub fun examplex()
//   fibonacci(100).println

// pub fun example2()
//   fibonacci(1000).println

 