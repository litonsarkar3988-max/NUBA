# stdlib/grid: 2D grid utilities
fun make_grid(rows, cols, default_val) {
    let grid = []
    for i in 0..rows {
        let row = []
        for j in 0..cols { push(row, default_val) }
        push(grid, row)
    }
    return grid
}
fun grid_get(grid, r, c) { return grid[r][c] }
fun grid_set(grid, r, c, val) { grid[r][c] = val }
fun grid_rows(grid) { return len(grid) }
fun grid_cols(grid) { return len(grid[0]) if len(grid) > 0 else 0 }
fun grid_print(grid, sep) {
    for row in grid {
        print(join(map(fun(x) -> str(x), row), sep))
    }
}
fun grid_fill(grid, val) {
    for r in 0..grid_rows(grid) {
        for c in 0..grid_cols(grid) { grid[r][c] = val }
    }
}
fun grid_neighbors(grid, r, c, diagonal) {
    let neighbors = []
    let dirs = [[-1,0],[1,0],[0,-1],[0,1]]
    if diagonal { dirs = dirs + [[-1,-1],[-1,1],[1,-1],[1,1]] }
    for d in dirs {
        let nr = r + d[0]; let nc = c + d[1]
        if nr >= 0 and nr < grid_rows(grid) and nc >= 0 and nc < grid_cols(grid) {
            push(neighbors, [nr, nc])
        }
    }
    return neighbors
}
fun grid_rotate_90(grid) {
    let rows = grid_rows(grid); let cols = grid_cols(grid)
    let new_grid = make_grid(cols, rows, 0)
    for r in 0..rows {
        for c in 0..cols { new_grid[c][rows-1-r] = grid[r][c] }
    }
    return new_grid
}
