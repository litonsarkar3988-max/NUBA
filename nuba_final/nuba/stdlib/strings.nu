# stdlib/strings.nu - String utilities for Nuba

fun pad_left(s, width, ch) {
    s = str(s)
    while len(s) < width { s = ch + s }
    return s
}

fun pad_right(s, width, ch) {
    s = str(s)
    while len(s) < width { s = s + ch }
    return s
}

fun center(s, width, ch) {
    s = str(s)
    let total = width - len(s)
    let left  = floor(total / 2)
    let right = total - left
    let i = 0
    while i < left  { s = ch + s; i += 1 }
    let j = 0
    while j < right { s = s + ch; j += 1 }
    return s
}

fun is_alpha(s) {
    for ch in split(s, "") {
        let c = ord(ch)
        if not ((c >= 65 and c <= 90) or (c >= 97 and c <= 122)) {
            return false
        }
    }
    return len(s) > 0
}

fun is_digit_str(s) {
    for ch in split(s, "") {
        let c = ord(ch)
        if not (c >= 48 and c <= 57) { return false }
    }
    return len(s) > 0
}

fun is_alnum(s) {
    return is_alpha(s) or is_digit_str(s)
}

fun count_occurrences(text, sub) {
    let count = 0
    let idx = indexOf(text, sub)
    while idx != -1 {
        count += 1
        text = substr(text, idx + len(sub), len(text))
        idx = indexOf(text, sub)
    }
    return count
}

fun title_case(s) {
    let words = split(s, " ")
    let result = map(fun(w) -> upper(substr(w, 0, 1)) + lower(substr(w, 1, len(w))), words)
    return join(result, " ")
}

fun snake_to_camel(s) {
    let parts = split(s, "_")
    let first = parts[0]
    let rest  = map(fun(w) -> upper(substr(w, 0, 1)) + substr(w, 1, len(w)), parts.slice(1, len(parts)))
    return first + join(rest, "")
}

fun camel_to_snake(s) {
    let result = ""
    for ch in split(s, "") {
        let c = ord(ch)
        if c >= 65 and c <= 90 {
            if len(result) > 0 { result += "_" }
            result += lower(ch)
        } else {
            result += ch
        }
    }
    return result
}

fun truncate(s, max_len, suffix) {
    if len(s) <= max_len { return s }
    return substr(s, 0, max_len - len(suffix)) + suffix
}
