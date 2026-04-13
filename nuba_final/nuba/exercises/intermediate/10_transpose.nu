# Intermediate: Matrix Transpose
fun transpose(matrix) {
    let rows = len(matrix)
    let cols = len(matrix[0])
    let result = []
    for j in 0..cols {
        let row = []
        for i in 0..rows { push(row, matrix[i][j]) }
        push(result, row)
    }
    return result
}
let m = [[1,2,3],[4,5,6]]
for row in transpose(m) { print(row) }
