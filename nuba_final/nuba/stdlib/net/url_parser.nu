# stdlib/net: URL Parser
fun parse_url(url) {
    let result = {"scheme":"","host":"","path":"","query":"","fragment":""}
    let rest = url
    # scheme
    if contains(rest,"://") {
        let idx = indexOf(rest,"://")
        result["scheme"] = substr(rest,0,idx)
        rest = substr(rest,idx+3,len(rest))
    }
    # fragment
    if contains(rest,"#") {
        let idx = indexOf(rest,"#")
        result["fragment"] = substr(rest,idx+1,len(rest))
        rest = substr(rest,0,idx)
    }
    # query
    if contains(rest,"?") {
        let idx = indexOf(rest,"?")
        result["query"] = substr(rest,idx+1,len(rest))
        rest = substr(rest,0,idx)
    }
    # path
    if contains(rest,"/") {
        let idx = indexOf(rest,"/")
        result["host"] = substr(rest,0,idx)
        result["path"] = substr(rest,idx,len(rest))
    } else {
        result["host"] = rest
    }
    return result
}
fun parse_query_string(qs) {
    let params = {}
    for pair in split(qs,"&") {
        let parts = split(pair,"=")
        if len(parts) == 2 { params[parts[0]] = parts[1] }
    }
    return params
}
fun build_url(scheme, host, path, params) {
    let url = scheme + "://" + host + path
    if len(params) > 0 {
        let pairs = []
        for pair in items(params) { push(pairs, pair[0]+"="+str(pair[1])) }
        url += "?" + join(pairs,"&")
    }
    return url
}

let parsed = parse_url("https://api.example.com/v1/users?page=1&limit=20#top")
print("URL Components:")
for pair in items(parsed) { print(" ", pair[0]+":", pair[1]) }
let qparams = parse_query_string(parsed["query"])
print("Query params:", qparams)
let new_url = build_url("https","api.example.com","/v1/products",{"page":2,"limit":10})
print("Built URL:", new_url)
