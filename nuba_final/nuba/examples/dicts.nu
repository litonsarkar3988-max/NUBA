# examples/dicts.nu - Dictionaries in Nuba

# Basic dict
let person = {
    "name": "Alice",
    "age": 30,
    "city": "New York"
}
print("Person:", person)
print("Name:", person["name"])
print("Age:", person["age"])

# Add / update
person["email"] = "alice@example.com"
person["age"] = 31
print("Updated person:", person)

# Keys, values, items
print("Keys:", keys(person))
print("Values:", values(person))
print("Items:", items(person))

# Check key existence
if has(person, "email") {
    print("Email found:", person["email"])
}

# Delete a key (set to null and check)
person["temp"] = "temporary"
person["temp"] = null
print("After temp removal:", person)

# Nested dict
let company = {
    "name": "Nuba Corp",
    "address": {
        "street": "123 Main St",
        "city":   "San Francisco",
        "zip":    "94102"
    },
    "employees": 42
}
print("Company:", company["name"])
print("City:", company["address"]["city"])

# Dict of lists
let grades = {
    "Alice": [90, 85, 92],
    "Bob":   [75, 80, 70],
    "Carol": [95, 98, 100]
}

for pair in items(grades) {
    let student = pair[0]
    let scores  = pair[1]
    let avg = sum(scores) / len(scores)
    print(student + " avg:", round(avg, 1))
}

# Word frequency counter
let text = "nuba is great nuba is fast nuba is fun"
let words = split(text, " ")
let freq = {}
for word in words {
    if has(freq, word) {
        freq[word] += 1
    } else {
        freq[word] = 1
    }
}
print("Word frequencies:", freq)

# Config pattern
let config = {
    "debug": false,
    "max_retries": 3,
    "timeout": 30,
    "host": "localhost",
    "port": 8080
}
fun get_config(key, default_val) {
    if has(config, key) {
        return config[key]
    }
    return default_val
}
print("host:", get_config("host", "unknown"))
print("port:", get_config("port", 80))
print("missing:", get_config("missing", "default"))
