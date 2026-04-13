# Intermediate: Flood Fill Algorithm
fun flood_fill(grid, r, c, old_color, new_color) {
    if r < 0 or r >= len(grid) { return }
    if c < 0 or c >= len(grid[0]) { return }
    if grid[r][c] != old_color { return }
    if old_color == new_color { return }
    grid[r][c] = new_color
    flood_fill(grid, r+1, c, old_color, new_color)
    flood_fill(grid, r-1, c, old_color, new_color)
    flood_fill(grid, r, c+1, old_color, new_color)
    flood_fill(grid, r, c-1, old_color, new_color)
}
let grid = [[1,1,1],[1,1,0],[1,0,1]]
flood_fill(grid, 1, 1, 1, 2)
for row in grid { print(row) }
