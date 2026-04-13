# Economics: Commodity Markets

print("=== Commodity Markets ===")

fun price_elasticity(pct_change_qty, pct_change_price) {
    return round(pct_change_qty / pct_change_price, 4)
}

fun consumer_surplus(willingness_to_pay, market_price, quantity) {
    return round(0.5 * (willingness_to_pay - market_price) * quantity, 2)
}

fun gdp_expenditure(consumption, investment, govt, exports, imports) {
    return round(consumption + investment + govt + exports - imports, 2)
}

fun compound_growth(initial, rate, periods) {
    return round(initial * (1 + rate) ** periods, 2)
}

fun inflation_adjusted(nominal, inflation_rate, years) {
    return round(nominal / (1 + inflation_rate) ** years, 2)
}

fun gini_coefficient(incomes) {
    let n = len(incomes)
    let sorted_inc = sorted(incomes)
    let cumulative = []
    let s = 0
    for inc in sorted_inc { s += inc; push(cumulative, s) }
    let total = s
    let area_under = sum(map(fun(c) -> c/total, cumulative)) / n
    return round(1 - 2 * area_under, 4)
}

# Demo for Commodity Markets
print("Price elasticity (-20% qty, +10% price):", price_elasticity(-20, 10))
print("Consumer surplus (WTP=100, P=60, Q=40):", consumer_surplus(100, 60, 40))
print("GDP (C=500, I=200, G=150, X=100, M=80):", gdp_expenditure(500,200,150,100,80))
print("Compound growth ($1000, 5%, 10y):", compound_growth(1000, 0.05, 10))
let incomes = [10, 20, 30, 40, 100, 150, 200]
print("Gini coefficient:", gini_coefficient(incomes))
