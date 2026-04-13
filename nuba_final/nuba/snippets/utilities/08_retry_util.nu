# Utility: Retry with backoff

let attempt_num=0
fun flaky(x){
    attempt_num+=1
    if attempt_num<3 { throw "Transient error" }
    return x*100
}
fun retry(fn,x,max_tries){
    for i in 0..max_tries {
        try { return fn(x) }
        catch(e) { print("Attempt",i+1,"failed:",e) }
    }
    throw "Max retries exceeded"
}
print(retry(flaky,5,5))
