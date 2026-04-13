# Advanced: Memoization DP Examples

let memo = {}
fun fib(n) {
    if n <= 1 { return n }
    if has(memo, n) { return memo[n] }
    let result = fib(n-1) + fib(n-2)
    memo[n] = result
    return result
}
for i in [10,20,30,40] { print("fib("+str(i)+") =", fib(i)) }

let memo2 = {}
fun count_paths(m, n) {
    if m==1 or n==1 { return 1 }
    let key = str(m)+","+str(n)
    if has(memo2, key) { return memo2[key] }
    let result = count_paths(m-1,n) + count_paths(m,n-1)
    memo2[key] = result
    return result
}
print("Paths in 4x4 grid:", count_paths(4,4))
