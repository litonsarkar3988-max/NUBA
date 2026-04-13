# stdlib/collections.nu - Collection utilities for Nuba

fun flatten(lst) {
    let result = []
    for item in lst {
        if isList(item) {
            let inner = flatten(item)
            for x in inner { push(result, x) }
        } else {
            push(result, item)
        }
    }
    return result
}

fun unique(lst) {
    let seen = {}
    let result = []
    for item in lst {
        let key = str(item)
        if not has(seen, key) {
            seen[key] = true
            push(result, item)
        }
    }
    return result
}

fun group_by(lst, key_fn) {
    let groups = {}
    for item in lst {
        let k = str(key_fn(item))
        if not has(groups, k) { groups[k] = [] }
        push(groups[k], item)
    }
    return groups
}

fun chunk(lst, size) {
    let result = []
    let i = 0
    while i < len(lst) {
        push(result, lst.slice(i, i + size))
        i += size
    }
    return result
}

fun take(lst, n) {
    return lst.slice(0, n)
}

fun drop(lst, n) {
    return lst.slice(n, len(lst))
}

fun zip_with(lst1, lst2, fn) {
    let result = []
    let n = min([len(lst1), len(lst2)])
    let i = 0
    while i < n {
        push(result, fn(lst1[i], lst2[i]))
        i += 1
    }
    return result
}

fun count_by(lst, pred) {
    let count = 0
    for item in lst {
        if pred(item) { count += 1 }
    }
    return count
}

fun find(lst, pred) {
    for item in lst {
        if pred(item) { return item }
    }
    return null
}

fun all(lst, pred) {
    for item in lst {
        if not pred(item) { return false }
    }
    return true
}

fun any_item(lst, pred) {
    for item in lst {
        if pred(item) { return true }
    }
    return false
}

fun partition(lst, pred) {
    let yes = []
    let no  = []
    for item in lst {
        if pred(item) { push(yes, item) }
        else          { push(no,  item) }
    }
    return [yes, no]
}

fun frequencies(lst) {
    let freq = {}
    for item in lst {
        let k = str(item)
        if has(freq, k) { freq[k] += 1 }
        else            { freq[k] = 1  }
    }
    return freq
}

fun interleave(lst1, lst2) {
    let result = []
    let n = min([len(lst1), len(lst2)])
    let i = 0
    while i < n {
        push(result, lst1[i])
        push(result, lst2[i])
        i += 1
    }
    return result
}
