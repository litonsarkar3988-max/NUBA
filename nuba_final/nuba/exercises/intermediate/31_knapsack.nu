# Intermediate: 0/1 Knapsack
fun knapsack(weights, values, capacity) {
    let n = len(weights)
    let dp = []
    for i in 0..(n+1) {
        let row = []
        for j in 0..(capacity+1) { push(row, 0) }
        push(dp, row)
    }
    for i in 1..(n+1) {
        for w in 0..(capacity+1) {
            if weights[i-1] <= w {
                let with_item    = values[i-1] + dp[i-1][w - weights[i-1]]
                let without_item = dp[i-1][w]
                dp[i][w] = max([with_item, without_item])
            } else {
                dp[i][w] = dp[i-1][w]
            }
        }
    }
    return dp[n][capacity]
}
let weights = [1, 3, 4, 5]
let values  = [1, 4, 5, 7]
print("Max value:", knapsack(weights, values, 7))
