# Statistics: Sampling Distribution

print("=== Sampling Distribution ===")

fun mean(data) { return sum(data) / len(data) }

fun variance(data) {
    let m = mean(data)
    let diffs = map(fun(x) -> (x-m)*(x-m), data)
    return sum(diffs) / len(data)
}

fun std_dev(data) { return sqrt(variance(data)) }

fun median(data) {
    let s = sorted(data)
    let n = len(s)
    if n % 2 == 0 { return (s[n/2 - 1] + s[n/2]) / 2 }
    return s[floor(n/2)]
}

fun mode(data) {
    let freq = {}
    for x in data {
        let k = str(x)
        if has(freq,k) { freq[k] += 1 } else { freq[k] = 1 }
    }
    let max_freq = max(values(freq))
    let modes = []
    for pair in items(freq) {
        if pair[1] == max_freq { push(modes, pair[0]) }
    }
    return modes
}

fun zscore(x, mu, sigma) { return round((x - mu) / sigma, 4) }

fun percentile(data, p) {
    let s = sorted(data)
    let idx = floor(p / 100 * (len(s) - 1))
    return s[idx]
}

fun iqr(data) {
    return percentile(data, 75) - percentile(data, 25)
}

fun correlation(x, y) {
    let mx = mean(x); let my = mean(y)
    let num = sum(map(fun(p) -> (p[0]-mx)*(p[1]-my), zip(x,y)))
    let denom = sqrt(sum(map(fun(a)->(a-mx)**2,x)) * sum(map(fun(b)->(b-my)**2,y)))
    return round(num/denom, 4)
}

# Demo
let data = [2,4,4,4,5,5,7,9,10,12,15]
print("Data:", data)
print("Mean:", mean(data))
print("Median:", median(data))
print("Mode:", mode(data))
print("Std Dev:", round(std_dev(data), 4))
print("IQR:", iqr(data))
print("P25:", percentile(data, 25))
print("P75:", percentile(data, 75))
let x = [1,2,3,4,5]; let y = [2,4,5,4,5]
print("Correlation:", correlation(x, y))
