# Advanced: AVL Tree (Self-Balancing BST)
class AVLNode {
    fun init(self, val) {
        self.val = val; self.left = null; self.right = null; self.height = 1
    }
}
class AVLTree {
    fun init(self) { self.root = null }
    fun height(self, node) { return 0 if node == null else node.height }
    fun balance_factor(self, node) {
        return 0 if node == null else self.height(node.left) - self.height(node.right)
    }
    fun update_height(self, node) {
        node.height = 1 + max([self.height(node.left), self.height(node.right)])
    }
    fun rotate_right(self, y) {
        let x = y.left; let T2 = x.right
        x.right = y; y.left = T2
        self.update_height(y); self.update_height(x)
        return x
    }
    fun rotate_left(self, x) {
        let y = x.right; let T2 = y.left
        y.left = x; x.right = T2
        self.update_height(x); self.update_height(y)
        return y
    }
    fun insert_node(self, node, val) {
        if node == null { return new AVLNode(val) }
        if val < node.val { node.left = self.insert_node(node.left, val) }
        elif val > node.val { node.right = self.insert_node(node.right, val) }
        else { return node }
        self.update_height(node)
        let bf = self.balance_factor(node)
        if bf > 1 and val < node.left.val { return self.rotate_right(node) }
        if bf < -1 and val > node.right.val { return self.rotate_left(node) }
        if bf > 1 and val > node.left.val {
            node.left = self.rotate_left(node.left)
            return self.rotate_right(node)
        }
        if bf < -1 and val < node.right.val {
            node.right = self.rotate_right(node.right)
            return self.rotate_left(node)
        }
        return node
    }
    fun insert(self, val) { self.root = self.insert_node(self.root, val) }
    fun inorder(self) {
        let result = []
        fun traverse(node) {
            if node == null { return }
            traverse(node.left)
            push(result, node.val)
            traverse(node.right)
        }
        traverse(self.root)
        return result
    }
}
let avl = new AVLTree()
for v in [10, 20, 30, 40, 50, 25] { avl.insert(v) }
print("AVL Inorder:", avl.inorder())
print("Root:", avl.root.val)
