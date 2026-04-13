# Probability: Kolmogorov Smirnov

print("=== Kolmogorov Smirnov ===")

# Probability calculations and simulations

fun factorial_p(n) {
    if n <= 1 { return 1 }
    return n * factorial_p(n-1)
}

fun binomial_prob(n, k, p) {
    let c = factorial_p(n) / (factorial_p(k) * factorial_p(n-k))
    return round(c * p**k * (1-p)**(n-k), 6)
}

fun poisson_prob(k, lambda_val) {
    return round((2.718 ** (-lambda_val)) * (lambda_val ** k) / factorial_p(k), 6)
}

fun normal_pdf(x, mu, sigma) {
    let z = (x - mu) / sigma
    return round((1/(sigma * sqrt(2*PI))) * (2.718 ** (-0.5*z*z)), 6)
}

fun simulate_bernoulli(p, n) {
    let successes = 0
    for i in 0..n {
        if random() < p { successes += 1 }
    }
    return round(successes / n, 4)
}

fun monte_carlo_pi(n) {
    let inside = 0
    for i in 0..n {
        let x = random() * 2 - 1
        let y = random() * 2 - 1
        if x*x + y*y <= 1 { inside += 1 }
    }
    return round(4 * inside / n, 6)
}

fun expected_value(values, probs) {
    return round(sum(map(fun(p)->p[0]*p[1], zip(values, probs))), 4)
}

fun variance_rv(values, probs) {
    let mu = expected_value(values, probs)
    let var = sum(map(fun(p)->(p[0]-mu)**2 * p[1], zip(values, probs)))
    return round(var, 4)
}

# Demo for Kolmogorov Smirnov
print("Binomial P(X=3) n=10, p=0.3:", binomial_prob(10, 3, 0.3))
print("Poisson P(X=2) lambda=3:", poisson_prob(2, 3.0))
print("Normal PDF at x=0 (std normal):", normal_pdf(0, 0, 1))

print("\nSimulation results:")
print("Bernoulli(p=0.6, n=10000):", simulate_bernoulli(0.6, 10000))
print("Monte Carlo Pi (n=10000):", monte_carlo_pi(10000))

let dice_values = [1, 2, 3, 4, 5, 6]
let dice_probs  = [1/6, 1/6, 1/6, 1/6, 1/6, 1/6]
print("\nFair die E[X]:", expected_value(dice_values, dice_probs))
print("Fair die Var[X]:", variance_rv(dice_values, dice_probs))
