# Daily Challenge 4: Generate Pascal triangle

fun pascal(n){
    let tri=[[1]]
    for i in 1..n {
        let prev=tri[i-1]
        let row=[1]
        for j in 1..len(prev) { push(row,prev[j-1]+prev[j]) }
        push(row,1)
        push(tri,row)
    }
    return tri
}
for row in pascal(6) { print(row) }
