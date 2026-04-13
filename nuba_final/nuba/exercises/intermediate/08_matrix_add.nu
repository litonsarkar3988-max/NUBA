# Intermediate: Matrix Addition
fun matrix_add(a, b) {
    let rows = len(a)
    let cols = len(a[0])
    let result = []
    for i in 0..rows {
        let row = []
        for j in 0..cols {
            push(row, a[i][j] + b[i][j])
        }
        push(result, row)
    }
    return result
}
let A = [[1,2,3],[4,5,6],[7,8,9]]
let B = [[9,8,7],[6,5,4],[3,2,1]]
let C = matrix_add(A, B)
for row in C { print(row) }
