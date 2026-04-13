# Intermediate: Print Spiral Order of Matrix
let matrix = [[1,2,3],[4,5,6],[7,8,9]]
let result = []
let top=0; let bottom=2; let left=0; let right=2
while top<=bottom and left<=right {
    for i in left..(right+1) { push(result, matrix[top][i]) }
    top += 1
    for i in top..(bottom+1) { push(result, matrix[i][right]) }
    right -= 1
    if top <= bottom {
        let i = right
        while i >= left { push(result, matrix[bottom][i]); i -= 1 }
        bottom -= 1
    }
    if left <= right {
        let i = bottom
        while i >= top { push(result, matrix[i][left]); i -= 1 }
        left += 1
    }
}
print("Spiral:", result)
