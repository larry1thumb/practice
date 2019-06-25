func fib(_ N: Int) -> Int {
    var a = 0
    var b = 1
    var c = 0
    
    for _ in 0..<N {
        c = a + b
        a = b
        b = c
    }
    return a
}

func recursiveFib(_ N: Int) -> Int {
    if N == 0 { return 0 }
    if N == 1 { return 1 }
    return recursiveFib(N - 1) + recursiveFib(N - 2)
}

func tailRecursionFib(_ N: Int, a: Int = 0, b: Int = 1) -> Int {
    if N == 0 { return a }
    if N == 1 { return b }
    
    return tailRecursionFib(N - 1, a: b, b: a + b)
}

fib(0)
fib(1)
fib(2)
fib(3)
fib(4)

recursiveFib(0)
recursiveFib(1)
recursiveFib(2)
recursiveFib(3)
recursiveFib(4)

tailRecursionFib(0)
tailRecursionFib(1)
tailRecursionFib(2)
tailRecursionFib(3)
tailRecursionFib(4)
