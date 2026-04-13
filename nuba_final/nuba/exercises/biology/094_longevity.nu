# Biology: Longevity

print("=== Longevity ===")

# Longevity simulation and calculations

fun hardy_weinberg(p) {
    let q = 1 - p
    return {
        "AA": round(p*p, 4),
        "Aa": round(2*p*q, 4),
        "aa": round(q*q, 4),
        "p":  round(p, 4),
        "q":  round(q, 4)
    }
}

fun population_growth(n0, r, t) {
    return round(n0 * (2.718 ** (r * t)), 2)
}

fun carrying_capacity_growth(n0, r, t, k) {
    let e_rt = 2.718 ** (r * t)
    return round(k * n0 * e_rt / (k + n0 * (e_rt - 1)), 2)
}

fun punnett_square_prob(parent1, parent2) {
    let offspring = []
    for a in parent1 {
        for b in parent2 {
            push(offspring, a + b)
        }
    }
    return offspring
}

# Demo for Longevity
print("Hardy-Weinberg (p=0.6):", hardy_weinberg(0.6))
print("Population growth (N0=100, r=0.1, t=10):", population_growth(100, 0.1, 10))
print("Punnett Aa x Aa:", punnett_square_prob(["A","a"],["A","a"]))
print("Logistic growth (K=1000):", carrying_capacity_growth(10, 0.5, 5, 1000))
