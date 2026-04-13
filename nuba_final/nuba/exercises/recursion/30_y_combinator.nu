# Recursion Exercise: Y Combinator

fun solve_y_combinator(n) {
    if n <= 0 { return [] }
    if n == 1 { return [1] }
    let sub = solve_y_combinator(n - 1)
    push(sub, n)
    return sub
}

# Visualize recursion tree (depth limited)
fun rec_tree(n, depth, max_depth) {
    if depth > max_depth { return }
    let indent = "  ".repeat(depth)
    print(indent + "f(" + str(n) + ")")
    if n > 1 { rec_tree(n-1, depth+1, max_depth) }
}

print("=== Y Combinator ===")
print("Result for n=5:", solve_y_combinator(5))
print("\nRecursion tree (depth<=3):")
rec_tree(5, 0, 3)
