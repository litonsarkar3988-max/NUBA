# Advanced: Trie Data Structure
class TrieNode {
    fun init(self) { self.children = {}; self.is_end = false }
}
class Trie {
    fun init(self) { self.root = new TrieNode() }
    fun insert(self, word) {
        let node = self.root
        for ch in word.chars() {
            if not has(node.children, ch) {
                node.children[ch] = new TrieNode()
            }
            node = node.children[ch]
        }
        node.is_end = true
    }
    fun search(self, word) {
        let node = self.root
        for ch in word.chars() {
            if not has(node.children, ch) { return false }
            node = node.children[ch]
        }
        return node.is_end
    }
    fun starts_with(self, prefix) {
        let node = self.root
        for ch in prefix.chars() {
            if not has(node.children, ch) { return false }
            node = node.children[ch]
        }
        return true
    }
    fun autocomplete(self, prefix) {
        let node = self.root
        for ch in prefix.chars() {
            if not has(node.children, ch) { return [] }
            node = node.children[ch]
        }
        let results = []
        fun collect(n, current) {
            if n.is_end { push(results, current) }
            for pair in items(n.children) {
                collect(pair[1], current + pair[0])
            }
        }
        collect(node, prefix)
        return results
    }
}
let trie = new Trie()
let words = ["apple","app","application","apply","apt","banana","band","bandana"]
for w in words { trie.insert(w) }
print("search 'app':", trie.search("app"))
print("search 'ap':", trie.search("ap"))
print("starts_with 'app':", trie.starts_with("app"))
print("autocomplete 'app':", trie.autocomplete("app"))
print("autocomplete 'ban':", trie.autocomplete("ban"))
