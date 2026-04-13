# examples/binary_tree.nu - Binary Search Tree in Nuba

class TreeNode {
    fun init(self, val) {
        self.val   = val
        self.left  = null
        self.right = null
    }
}

class BST {
    fun init(self) {
        self.root = null
    }

    fun insert(self, val) {
        self.root = self._insert(self.root, val)
    }

    fun _insert(self, node, val) {
        if node == null { return new TreeNode(val) }
        if val < node.val { node.left  = self._insert(node.left,  val) }
        elif val > node.val { node.right = self._insert(node.right, val) }
        return node
    }

    fun contains(self, val) {
        let curr = self.root
        while curr != null {
            if val == curr.val { return true }
            elif val < curr.val { curr = curr.left }
            else { curr = curr.right }
        }
        return false
    }

    fun inorder(self) {
        let result = []
        self._inorder(self.root, result)
        return result
    }

    fun _inorder(self, node, result) {
        if node == null { return }
        self._inorder(node.left, result)
        push(result, node.val)
        self._inorder(node.right, result)
    }

    fun preorder(self) {
        let result = []
        self._preorder(self.root, result)
        return result
    }

    fun _preorder(self, node, result) {
        if node == null { return }
        push(result, node.val)
        self._preorder(node.left, result)
        self._preorder(node.right, result)
    }

    fun height(self) {
        return self._height(self.root)
    }

    fun _height(self, node) {
        if node == null { return 0 }
        let lh = self._height(node.left)
        let rh = self._height(node.right)
        return 1 + max([lh, rh])
    }

    fun min_val(self) {
        let curr = self.root
        while curr.left != null { curr = curr.left }
        return curr.val
    }

    fun max_val(self) {
        let curr = self.root
        while curr.right != null { curr = curr.right }
        return curr.val
    }
}

let bst = new BST()
let values = [50, 30, 70, 20, 40, 60, 80, 10, 25]
for v in values { bst.insert(v) }

print("Inorder (sorted):", bst.inorder())
print("Preorder:", bst.preorder())
print("Height:", bst.height())
print("Min:", bst.min_val())
print("Max:", bst.max_val())
print("Contains 40:", bst.contains(40))
print("Contains 99:", bst.contains(99))
