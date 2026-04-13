# Intermediate: Valid Parentheses
fun is_valid(s) {
    let stack = []
    let pairs = {"(": ")", "[": "]", "{": "}"}
    for ch in s.chars() {
        if has(pairs, ch) { push(stack, pairs[ch]) }
        elif len(stack) == 0 or stack[len(stack)-1] != ch { return false }
        else { pop(stack) }
    }
    return len(stack) == 0
}
for s in ["()", "()[]{}", "(]", "([)]", "{[]}"] {
    print(s, "->", is_valid(s))
}
