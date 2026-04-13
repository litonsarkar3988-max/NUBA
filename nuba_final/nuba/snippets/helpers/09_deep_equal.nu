# Helper: Deep equality check

fun deep_equal(a,b){
    if type(a)!=type(b) { return false }
    if isList(a) {
        if len(a)!=len(b) { return false }
        for i in 0..len(a) { if not deep_equal(a[i],b[i]) { return false } }
        return true
    }
    if isDict(a) {
        if len(keys(a))!=len(keys(b)) { return false }
        for pair in items(a) {
            if not has(b,pair[0]) { return false }
            if not deep_equal(pair[1],b[pair[0]]) { return false }
        }
        return true
    }
    return a==b
}
print(deep_equal([1,[2,3]],[1,[2,3]]))
print(deep_equal([1,[2,3]],[1,[2,4]]))
