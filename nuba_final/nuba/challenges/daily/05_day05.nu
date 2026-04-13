# Daily Challenge 5: Rotate matrix 90 degrees

fun rotate90(m){
    let n=len(m); let r=[]
    for j in 0..n {
        let row=[]
        for i in (n-1)..(0-1) { push(row,m[i][j]) }
        push(r,row)
    }
    return r
}
let mat=[[1,2,3],[4,5,6],[7,8,9]]
for row in rotate90(mat) { print(row) }
