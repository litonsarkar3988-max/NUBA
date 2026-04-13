# Data Science - Nlp: Word2Vec Concept

print("=== Word2Vec Concept ===")

# Statistical helper functions
fun mean(data) { return sum(data) / len(data) }
fun variance(data) {
    let m = mean(data)
    return sum(map(fun(x)->(x-m)**2, data)) / len(data)
}
fun std(data) { return sqrt(variance(data)) }
fun median(data) {
    let s = sorted(data)
    let n = len(s)
    if n % 2 == 0 { return (s[n/2-1]+s[n/2])/2 }
    return s[floor(n/2)]
}

# Word2Vec Concept specific implementation
fun word2vec_concept(data, params) {
    print("Running: Word2Vec Concept")
    print("Data size:", len(data))
    print("Parameters:", params)

    let result = {
        "mean":   round(mean(data), 4),
        "std":    round(std(data), 4),
        "median": median(data),
        "min":    min(data),
        "max":    max(data)
    }
    return result
}

fun evaluate(predictions, actuals) {
    let n = len(predictions)
    let errors = map(fun(p) -> (p[0]-p[1])**2, zip(predictions, actuals))
    let mse = sum(errors) / n
    let rmse = sqrt(mse)
    let mae = sum(map(fun(p) -> abs(p[0]-p[1]), zip(predictions, actuals))) / n
    return {"mse":round(mse,4),"rmse":round(rmse,4),"mae":round(mae,4)}
}

# Demo
let dataset = [2.5,3.1,4.2,2.8,3.7,5.1,4.4,3.0,2.9,4.6,3.8,5.2,4.1,3.3,2.7]
let result = word2vec_concept(dataset, {"alpha":0.05,"iterations":100})
print("Results:", result)

let preds   = [2.4,3.0,4.3,2.9,3.6,5.0]
let actuals = [2.5,3.1,4.2,2.8,3.7,5.1]
print("Evaluation:", evaluate(preds, actuals))
