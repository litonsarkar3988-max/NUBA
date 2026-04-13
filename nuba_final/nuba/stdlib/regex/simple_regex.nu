# stdlib/regex: Simple pattern matching utilities
# (simplified regex without full regex engine)

fun match_wildcard(pattern, text) {
    # Supports * (any sequence) and ? (any single char)
    let pi = 0; let ti = 0
    let pc = pattern.chars(); let tc = text.chars()
    let star_i = -1; let match_i = 0
    while ti < len(tc) {
        if pi < len(pc) and (pc[pi] == "?" or pc[pi] == tc[ti]) {
            pi += 1; ti += 1
        } elif pi < len(pc) and pc[pi] == "*" {
            star_i = pi; match_i = ti; pi += 1
        } elif star_i != -1 {
            pi = star_i + 1; match_i += 1; ti = match_i
        } else { return false }
    }
    while pi < len(pc) and pc[pi] == "*" { pi += 1 }
    return pi == len(pc)
}
fun starts_with_pattern(text, prefix) { return startswith(text, prefix) }
fun ends_with_pattern(text, suffix)   { return endswith(text, suffix) }
fun contains_pattern(text, sub)       { return contains(text, sub) }

fun extract_between(text, start_marker, end_marker) {
    let si = indexOf(text, start_marker)
    if si == -1 { return [] }
    let rest = substr(text, si+len(start_marker), len(text))
    let ei = indexOf(rest, end_marker)
    if ei == -1 { return [] }
    return [substr(rest, 0, ei)]
}

fun replace_all(text, pattern, replacement) {
    let result = ""
    let i = 0
    let plen = len(pattern)
    while i < len(text) {
        if i+plen <= len(text) and substr(text,i,i+plen) == pattern {
            result += replacement
            i += plen
        } else {
            result += substr(text, i, i+1)
            i += 1
        }
    }
    return result
}

let tests = ["hello.nu","world.py","nuba.nu","test.txt","main.nu"]
print("Files matching *.nu:")
for f in tests { if match_wildcard("*.nu", f) { print(" ", f) } }
print("Files matching *a*:")
for f in tests { if match_wildcard("*a*", f) { print(" ", f) } }
let html = "<title>Nuba Language</title>"
print("Extracted:", extract_between(html, "<title>", "</title>"))
print(replace_all("Hello World World", "World", "Nuba"))
