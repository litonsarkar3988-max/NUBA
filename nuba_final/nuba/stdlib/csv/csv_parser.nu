# stdlib/csv: CSV Parser and Writer
fun parse_csv(text, delimiter, has_header) {
    let lines = split(trim(text), "\n")
    let result = []
    let headers = []
    let start = 0
    if has_header and len(lines) > 0 {
        headers = split(lines[0], delimiter)
        headers = map(fun(h)->trim(h), headers)
        start = 1
    }
    for i in start..len(lines) {
        let line = trim(lines[i])
        if len(line) == 0 { continue }
        let values = split(line, delimiter)
        values = map(fun(v)->trim(v), values)
        if has_header {
            let row = {}
            for j in 0..len(headers) {
                row[headers[j]] = values[j] if j < len(values) else ""
            }
            push(result, row)
        } else {
            push(result, values)
        }
    }
    return result
}
fun to_csv(data, headers, delimiter) {
    let lines = [join(headers, delimiter)]
    for row in data {
        let values = map(fun(h)->str(row[h] if has(row,h) else ""), headers)
        push(lines, join(values, delimiter))
    }
    return join(lines, "\n")
}
fun csv_stats(data, numeric_col) {
    let vals = map(fun(r)->float(r[numeric_col]), data)
    return {
        "count": len(vals),
        "sum":   round(sum(vals),2),
        "avg":   round(sum(vals)/len(vals),2),
        "min":   min(vals),
        "max":   max(vals)
    }
}

let csv_data = "name,age,salary,department
Alice,30,75000,Engineering
Bob,25,60000,Marketing
Carol,35,90000,Engineering
Dave,28,65000,HR
Eve,32,80000,Engineering"

let employees = parse_csv(csv_data, ",", true)
print("Parsed CSV:", len(employees), "employees")
for emp in employees { print(" ", emp["name"], "-", emp["department"], "$"+emp["salary"]) }
let stats = csv_stats(employees, "salary")
print("Salary stats:", stats)
