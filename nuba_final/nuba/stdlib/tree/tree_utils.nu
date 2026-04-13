# stdlib/tree: Binary tree utilities
class TreeNode {
    fun init(self, val) {
        self.val = val; self.left = null; self.right = null
    }
}
fun tree_insert(root, val) {
    if root == null { return new TreeNode(val) }
    if val < root.val { root.left = tree_insert(root.left, val) }
    elif val > root.val { root.right = tree_insert(root.right, val) }
    return root
}
fun tree_inorder(root) {
    if root == null { return [] }
    return tree_inorder(root.left) + [root.val] + tree_inorder(root.right)
}
fun tree_preorder(root) {
    if root == null { return [] }
    return [root.val] + tree_preorder(root.left) + tree_preorder(root.right)
}
fun tree_postorder(root) {
    if root == null { return [] }
    return tree_postorder(root.left) + tree_postorder(root.right) + [root.val]
}
fun tree_height(root) {
    if root == null { return 0 }
    return 1 + max([tree_height(root.left), tree_height(root.right)])
}
fun tree_count(root) {
    if root == null { return 0 }
    return 1 + tree_count(root.left) + tree_count(root.right)
}
fun tree_search(root, val) {
    if root == null { return false }
    if root.val == val { return true }
    if val < root.val { return tree_search(root.left, val) }
    return tree_search(root.right, val)
}
fun tree_min(root) {
    while root.left != null { root = root.left }
    return root.val
}
fun tree_max(root) {
    while root.right != null { root = root.right }
    return root.val
}
fun tree_level_order(root) {
    if root == null { return [] }
    let result = []; let queue = [root]
    while len(queue) > 0 {
        let node = queue[0]; queue = queue.slice(1, len(queue))
        push(result, node.val)
        if node.left != null { push(queue, node.left) }
        if node.right != null { push(queue, node.right) }
    }
    return result
}
