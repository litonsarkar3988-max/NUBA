# Linear Algebra: Reduced Row Echelon

print("=== Reduced Row Echelon ===")

fun vec_add(a, b) { return map(fun(p)->p[0]+p[1], zip(a,b)) }
fun vec_sub(a, b) { return map(fun(p)->p[0]-p[1], zip(a,b)) }
fun vec_scale(v, s) { return map(fun(x)->x*s, v) }
fun dot(a, b) { return sum(map(fun(p)->p[0]*p[1], zip(a,b))) }
fun norm(v) { return sqrt(sum(map(fun(x)->x*x, v))) }
fun normalize(v) { let n=norm(v); return map(fun(x)->round(x/n,6),v) }

fun mat_add(A, B) {
    let result = []
    for i in 0..len(A) {
        let row = []
        for j in 0..len(A[0]) { push(row, A[i][j]+B[i][j]) }
        push(result, row)
    }
    return result
}

fun mat_mul(A, B) {
    let m=len(A); let n=len(B[0]); let k=len(B)
    let result = []
    for i in 0..m {
        let row = []
        for j in 0..n {
            let s = 0
            for p in 0..k { s += A[i][p]*B[p][j] }
            push(row, s)
        }
        push(result, row)
    }
    return result
}

fun transpose(M) {
    let rows=len(M); let cols=len(M[0]); let result=[]
    for j in 0..cols {
        let row=[]
        for i in 0..rows { push(row, M[i][j]) }
        push(result, row)
    }
    return result
}

fun det2(M) { return M[0][0]*M[1][1] - M[0][1]*M[1][0] }

# Demo for Reduced Row Echelon
let v1=[1,2,3]; let v2=[4,5,6]
print("v1:", v1, "v2:", v2)
print("v1+v2:", vec_add(v1,v2))
print("dot(v1,v2):", dot(v1,v2))
print("norm(v1):", round(norm(v1),4))
print("normalize(v1):", normalize(v1))
let A=[[1,2],[3,4]]; let B=[[5,6],[7,8]]
print("A:", A)
print("B:", B)
print("A+B:", mat_add(A,B))
print("A*B:", mat_mul(A,B))
print("A^T:", transpose(A))
print("det(A):", det2(A))
