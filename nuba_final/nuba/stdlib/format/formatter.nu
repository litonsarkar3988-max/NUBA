# stdlib/format: Advanced formatting utilities
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
fun center(s, width) {
    s = str(s)
    let pad = width - len(s)
    let left = floor(pad / 2)
    let right = pad - left
    return " ".repeat(left) + s + " ".repeat(right)
}
fun fmt_number(n, decimals) {
    return str(round(n, decimals))
}
fun fmt_currency(amount, symbol) {
    return symbol + str(round(amount, 2))
}
fun fmt_percent(ratio) {
    return str(round(ratio * 100, 1)) + "%"
}
fun fmt_table(headers, rows) {
    let widths = map(fun(h) -> len(h), headers)
    for row in rows {
        for i in 0..len(row) {
            let w = len(str(row[i]))
            if w > widths[i] { widths[i] = w }
        }
    }
    fun fmt_row(cells) {
        let parts = []
        for i in 0..len(cells) {
            push(parts, pad_right(str(cells[i]), widths[i]+2, " "))
        }
        return "| " + join(parts, "| ") + "|"
    }
    let sep = "+-" + join(map(fun(w) -> "-".repeat(w+2), widths), "+-") + "-+"
    print(sep)
    print(fmt_row(headers))
    print(sep)
    for row in rows { print(fmt_row(row)) }
    print(sep)
}
