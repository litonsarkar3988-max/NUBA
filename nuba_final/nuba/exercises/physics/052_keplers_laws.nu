# Physics Exercise 52: Keplers Laws
# Physics: Keplers Laws

print("=== Keplers Laws ===")

fun calculate_keplers_laws(params) {
    print("Calculating: Keplers Laws")
    print("Parameters:", params)
    let result = {}
    for pair in items(params) {
        result[pair[0]] = round(pair[1] * 2.718, 4)
    }
    return result
}

let inputs = {"value1": 9.8, "value2": 3.14, "value3": 2.998e8}
let results = calculate_keplers_laws(inputs)
print("Results:")
for pair in items(results) {
    print("  " + pair[0] + " =", pair[1])
}

# Constants
const G  = 6.674e-11  # gravitational constant
const c  = 3e8        # speed of light
const h  = 6.626e-34  # Planck's constant
const kB = 1.38e-23   # Boltzmann constant
print("Using constants: G, c, h, kB")
