# Advanced: Segment Tree (Range Sum Query)
class SegmentTree {
    fun init(self, arr) {
        self.n    = len(arr)
        self.tree = []
        for i in 0..(4 * self.n) { push(self.tree, 0) }
        self.build(arr, 0, 0, self.n - 1)
    }
    fun build(self, arr, node, start, end_val) {
        if start == end_val {
            self.tree[node] = arr[start]
        } else {
            let mid = floor((start + end_val) / 2)
            self.build(arr, 2*node+1, start, mid)
            self.build(arr, 2*node+2, mid+1, end_val)
            self.tree[node] = self.tree[2*node+1] + self.tree[2*node+2]
        }
    }
    fun query(self, node, start, end_val, l, r) {
        if r < start or end_val < l { return 0 }
        if l <= start and end_val <= r { return self.tree[node] }
        let mid = floor((start + end_val) / 2)
        return self.query(2*node+1, start, mid, l, r) +
               self.query(2*node+2, mid+1, end_val, l, r)
    }
    fun range_sum(self, l, r) {
        return self.query(0, 0, self.n-1, l, r)
    }
    fun update(self, node, start, end_val, idx, val) {
        if start == end_val {
            self.tree[node] = val
        } else {
            let mid = floor((start + end_val) / 2)
            if idx <= mid { self.update(2*node+1, start, mid, idx, val) }
            else          { self.update(2*node+2, mid+1, end_val, idx, val) }
            self.tree[node] = self.tree[2*node+1] + self.tree[2*node+2]
        }
    }
    fun point_update(self, idx, val) {
        self.update(0, 0, self.n-1, idx, val)
    }
}
let arr = [1, 3, 5, 7, 9, 11]
let st = new SegmentTree(arr)
print("Sum [1,3]:", st.range_sum(1, 3))
print("Sum [0,5]:", st.range_sum(0, 5))
st.point_update(1, 10)
print("After update, Sum [1,3]:", st.range_sum(1, 3))
