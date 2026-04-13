# stdlib/validate: Input validation helpers
fun is_email(s) {
    let parts = split(s, "@")
    if len(parts) != 2 { return false }
    if len(parts[0]) == 0 or len(parts[1]) == 0 { return false }
    let domain_parts = split(parts[1], ".")
    return len(domain_parts) >= 2
}
fun is_url(s) {
    return startswith(s, "http://") or startswith(s, "https://")
}
fun is_phone(s) {
    let digits = filter(fun(ch) -> ch >= "0" and ch <= "9", s.chars())
    return len(digits) >= 10 and len(digits) <= 15
}
fun is_between(n, lo, hi) { return n >= lo and n <= hi }
fun not_empty(s) { return len(trim(s)) > 0 }
fun min_length(s, n) { return len(s) >= n }
fun max_length(s, n) { return len(s) <= n }
fun matches_pattern(s, chars_allowed) {
    for ch in s.chars() {
        if not contains(chars_allowed, ch) { return false }
    }
    return true
}
fun is_alphanumeric(s) {
    let allowed = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return matches_pattern(s, allowed)
}
fun is_numeric_str(s) {
    return matches_pattern(trim(s), "0123456789.-")
}
