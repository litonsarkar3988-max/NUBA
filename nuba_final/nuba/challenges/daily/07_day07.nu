# Daily Challenge 7: Count islands in grid

fun count_islands(grid){
    let rows=len(grid); let cols=len(grid[0])
    let visited=[]
    for i in 0..rows { push(visited,[]) ; for j in 0..cols { push(visited[i],false) } }
    fun dfs(r,c){
        if r<0 or r>=rows or c<0 or c>=cols { return }
        if visited[r][c] or grid[r][c]==0 { return }
        visited[r][c]=true
        dfs(r+1,c); dfs(r-1,c); dfs(r,c+1); dfs(r,c-1)
    }
    let count=0
    for r in 0..rows { for c in 0..cols {
        if grid[r][c]==1 and not visited[r][c] { dfs(r,c); count+=1 }
    }}
    return count
}
let grid=[[1,1,0,0],[1,0,0,1],[0,0,1,1],[0,0,1,0]]
print("Islands:",count_islands(grid))
