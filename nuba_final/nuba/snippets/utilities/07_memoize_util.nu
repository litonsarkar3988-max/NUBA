# Utility: Memoization utility

fun memoize(fn){
    let cache={}
    fun memoized(n){
        if has(cache,n) { return cache[n] }
        let r=fn(n)
        cache[n]=r
        return r
    }
    return memoized
}
fun fib(n){ if n<=1 { return n }; return fib(n-1)+fib(n-2) }
let fast_fib=memoize(fib)
print(fast_fib(30))
