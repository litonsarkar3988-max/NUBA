# One-liner: Transpose a matrix

fun T(m){
    let rows=len(m); let cols=len(m[0]); let r=[]
    for j in 0..cols{
        let row=[]
        for i in 0..rows { push(row,m[i][j]) }
        push(r,row)
    }
    return r
}
print(T([[1,2,3],[4,5,6]]))
