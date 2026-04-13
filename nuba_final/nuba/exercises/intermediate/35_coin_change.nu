# Intermediate: Coin Change
fun coin_change(coins, amount) {
    let dp = []
    for i in 0..(amount+1) { push(dp, amount + 1) }
    dp[0] = 0
    for i in 1..(amount+1) {
        for c in coins {
            if c <= i and dp[i-c] + 1 < dp[i] {
                dp[i] = dp[i-c] + 1
            }
        }
    }
    if dp[amount] > amount { return -1 }
    return dp[amount]
}
print(coin_change([1,5,6,9], 11))
print(coin_change([2], 3))
