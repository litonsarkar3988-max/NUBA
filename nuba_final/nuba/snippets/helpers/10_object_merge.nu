# Helper: Merge two dicts

fun merge(a,b){
    let result={}
    for pair in items(a) { result[pair[0]]=pair[1] }
    for pair in items(b) { result[pair[0]]=pair[1] }
    return result
}
let defaults={"debug":false,"host":"localhost","port":8080}
let config={"port":3000,"db":"postgres"}
print(merge(defaults,config))
