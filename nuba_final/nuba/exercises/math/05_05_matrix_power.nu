# Math Exercise: Matrix Power

fun mat_mul_mod(a, b, mod) {
    let n = len(a); let result = []
    for i in 0..n {
        let row = []
        for j in 0..n {
            let s = 0
            for k in 0..n { s = (s + a[i][k] * b[k][j]) % mod }
            push(row, s)
        }
        push(result, row)
    }
    return result
}
fun mat_pow(m, p, mod) {
    let n = len(m); let result = []
    for i in 0..n {
        let row = []
        for j in 0..n { push(row, 1 if i==j else 0) }
        push(result, row)
    }
    while p > 0 {
        if p % 2 == 1 { result = mat_mul_mod(result, m, mod) }
        m = mat_mul_mod(m, m, mod)
        p = floor(p/2)
    }
    return result
}
# Fibonacci via matrix power
let fib_mat = [[1,1],[1,0]]
let result = mat_pow(fib_mat, 10, 1000000007)
print("fib(10) via matrix:", result[0][1])
