# Intermediate: Best Time to Buy and Sell Stock
fun max_profit(prices) {
    let min_price = prices[0]
    let max_prof  = 0
    for p in prices {
        if p < min_price { min_price = p }
        elif p - min_price > max_prof { max_prof = p - min_price }
    }
    return max_prof
}
print(max_profit([7,1,5,3,6,4]))
print(max_profit([7,6,4,3,1]))
