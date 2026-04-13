# stdlib/io.nu - I/O utilities for Nuba

fun read_lines(path) {
    let content = readFile(path)
    return split(content, "\n")
}

fun write_lines(path, lines) {
    let content = join(lines, "\n")
    writeFile(path, content)
}

fun read_json(path) {
    let content = readFile(path)
    return jsonParse(content)
}

fun write_json(path, data) {
    let content = jsonStringify(data)
    writeFile(path, content)
}

fun read_csv(path) {
    let lines = read_lines(path)
    if len(lines) == 0 { return [] }
    let headers = split(lines[0], ",")
    let rows = []
    for i in 1..len(lines) {
        if trim(lines[i]) == "" { continue }
        let values = split(lines[i], ",")
        let row = {}
        let j = 0
        for h in headers {
            row[trim(h)] = trim(values[j] if j < len(values) else "")
            j += 1
        }
        push(rows, row)
    }
    return rows
}

fun prompt(msg) {
    return input(msg)
}

fun confirm(msg) {
    let answer = lower(trim(input(msg + " (y/n): ")))
    return answer == "y" or answer == "yes"
}

fun print_table(rows) {
    if len(rows) == 0 { print("(empty)"); return }
    let cols = keys(rows[0])
    let widths = {}
    for col in cols {
        widths[col] = len(col)
    }
    for row in rows {
        for col in cols {
            let v = str(row[col] if has(row, col) else "")
            if len(v) > widths[col] { widths[col] = len(v) }
        }
    }
    # header
    let header = ""
    let sep    = ""
    for col in cols {
        let w = widths[col]
        header += col + " " * (w - len(col) + 2)
        sep    += "-" * (w + 2)
    }
    print(header)
    print(sep)
    for row in rows {
        let line = ""
        for col in cols {
            let v = str(row[col] if has(row, col) else "")
            let w = widths[col]
            line += v + " " * (w - len(v) + 2)
        }
        print(line)
    }
}
