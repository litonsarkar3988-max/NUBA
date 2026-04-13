# Calculus: Inflection Points

print("=== Inflection Points ===")

# Numerical calculus utilities

fun derivative(f, x, h) {
    return (f(x + h) - f(x - h)) / (2 * h)
}

fun second_derivative(f, x, h) {
    return (f(x+h) - 2*f(x) + f(x-h)) / (h*h)
}

fun integral_trap(f, a, b, n) {
    let h = (b - a) / n
    let s = f(a) + f(b)
    for i in 1..n {
        s += 2 * f(a + i * h)
    }
    return round(s * h / 2, 8)
}

fun integral_simpson(f, a, b, n) {
    if n % 2 != 0 { n += 1 }
    let h = (b - a) / n
    let s = f(a) + f(b)
    for i in 1..n {
        let x = a + i * h
        s += (4 if i % 2 != 0 else 2) * f(x)
    }
    return round(s * h / 3, 8)
}

fun find_root_bisection(f, a, b, tol) {
    let fa = f(a); let fb = f(b)
    if fa * fb > 0 { throw "No root in interval" }
    let c = a
    while (b - a) / 2 > tol {
        c = (a + b) / 2
        let fc = f(c)
        if fc == 0 { break }
        if fa * fc < 0 { b = c; fb = fc }
        else { a = c; fa = fc }
    }
    return round(c, 8)
}

fun gradient_descent_1d(f, x0, lr, epochs) {
    let x = x0
    let h = 0.0001
    for i in 0..epochs {
        let grad = derivative(f, x, h)
        x -= lr * grad
    }
    return round(x, 6)
}

# Demo functions
fun f1(x) { return x*x - 4 }      # x^2 - 4
fun f2(x) { return sin(x) }         # sin(x)
fun f3(x) { return x*x*x - x }      # x^3 - x

print("Inflection Points Examples:")
print("f(x) = x^2 - 4")
print("  f'(2) =", round(derivative(f1, 2.0, 0.0001), 4))
print("  f''(2) =", round(second_derivative(f1, 2.0, 0.0001), 4))
print("  Root:", find_root_bisection(f1, 0.0, 4.0, 0.0001))

print("Integral of sin(x) from 0 to PI:")
print("  Trapezoidal (n=100):", integral_trap(f2, 0, PI, 100))
print("  Simpson (n=100):", integral_simpson(f2, 0, PI, 100))

print("Minimize f(x) = x^3 - x:")
let min_x = gradient_descent_1d(f3, 0.5, 0.01, 200)
print("  Min at x =", min_x, "f(x) =", round(f3(min_x), 6))
