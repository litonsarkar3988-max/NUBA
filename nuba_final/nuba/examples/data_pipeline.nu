# examples/data_pipeline.nu - Data transformation pipeline in Nuba

# Simulated dataset: employee records
let employees = [
    {"name": "Alice",   "dept": "Engineering", "salary": 95000, "years": 5},
    {"name": "Bob",     "dept": "Marketing",   "salary": 72000, "years": 3},
    {"name": "Carol",   "dept": "Engineering", "salary": 105000,"years": 8},
    {"name": "Dave",    "dept": "HR",          "salary": 68000, "years": 2},
    {"name": "Eve",     "dept": "Engineering", "salary": 88000, "years": 4},
    {"name": "Frank",   "dept": "Marketing",   "salary": 78000, "years": 6},
    {"name": "Grace",   "dept": "HR",          "salary": 71000, "years": 4},
    {"name": "Hank",    "dept": "Engineering", "salary": 115000,"years": 10},
    {"name": "Iris",    "dept": "Marketing",   "salary": 82000, "years": 7},
    {"name": "Jack",    "dept": "HR",          "salary": 65000, "years": 1}
]

print("=== Employee Data Pipeline ===")
print("Total employees:", len(employees))

# 1. Filter: only Engineering
let engineers = filter(fun(e) -> e["dept"] == "Engineering", employees)
print("\nEngineers:", len(engineers))
for e in engineers {
    print(" ", e["name"], "-", e["salary"])
}

# 2. Sort by salary descending (custom sort for dicts)
fun sort_by_salary(lst) {
    let n = len(lst)
    for i in 0..n {
        for j in 0..(n - i - 1) {
            if lst[j]["salary"] < lst[j+1]["salary"] {
                let tmp = lst[j]
                lst[j] = lst[j+1]
                lst[j+1] = tmp
            }
        }
    }
    return lst
}
let ranked = sort_by_salary(employees.copy())
print("\nTop 3 earners:")
for i in 0..3 {
    print(" ", i+1, ".", ranked[i]["name"], "-", ranked[i]["salary"])
}

# 3. Group by department
fun group_by_dept(lst) {
    let groups = {}
    for e in lst {
        let dept = e["dept"]
        if not has(groups, dept) { groups[dept] = [] }
        push(groups[dept], e)
    }
    return groups
}

let by_dept = group_by_dept(employees)
print("\n--- Department Summary ---")
for pair in items(by_dept) {
    let dept = pair[0]
    let members = pair[1]
    let salaries = map(fun(e) -> e["salary"], members)
    let avg = sum(salaries) / len(salaries)
    let total_yrs = sum(map(fun(e) -> e["years"], members))
    print(format("{0}: {1} people | avg salary: ${2} | total exp: {3} yrs",
                 dept, len(members), round(avg, 0), total_yrs))
}

# 4. Apply raise to senior employees
fun apply_raise(employees_list, min_years, pct) {
    fun raise_one(e) {
        let updated = e.copy()
        if e["years"] >= min_years {
            updated["salary"] = round(e["salary"] * (1 + pct / 100), 0)
        }
        return updated
    }
    return map(raise_one, employees_list)
}

let after_raise = apply_raise(employees, 5, 10)
print("\n--- After 10% raise for 5+ year employees ---")
for i in 0..len(employees) {
    let before = employees[i]
    let after  = after_raise[i]
    if before["salary"] != after["salary"] {
        print(format("  {0}: ${1} → ${2}",
                     before["name"], before["salary"], after["salary"]))
    }
}

# 5. Statistics
let all_salaries = map(fun(e) -> e["salary"], employees)
print("\n--- Overall Stats ---")
print("Min salary: $" + str(min(all_salaries)))
print("Max salary: $" + str(max(all_salaries)))
print("Avg salary: $" + str(round(sum(all_salaries) / len(all_salaries), 0)))
print("Total payroll: $" + str(sum(all_salaries)))
