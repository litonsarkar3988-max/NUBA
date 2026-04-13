# Intermediate: Matrix Multiplication
fun mat_mul(a, b) {
    let rows_a = len(a)
    let cols_a = len(a[0])
    let cols_b = len(b[0])
    let result = []
    for i in 0..rows_a {
        let row = []
        for j in 0..cols_b {
            let s = 0
            for k in 0..cols_a { s += a[i][k] * b[k][j] }
            push(row, s)
        }
        push(result, row)
    }
    return result
}
let A = [[1,2],[3,4]]
let B = [[5,6],[7,8]]
for row in mat_mul(A, B) { print(row) }
