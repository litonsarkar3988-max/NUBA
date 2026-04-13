# Helper: Deep clone a structure

fun deep_clone(obj){
    if isList(obj) { return map(fun(x)->deep_clone(x),obj) }
    if isDict(obj) {
        let c={}
        for pair in items(obj) { c[pair[0]]=deep_clone(pair[1]) }
        return c
    }
    return obj
}
let original={"a":1,"b":[1,2,3],"c":{"d":4}}
let clone=deep_clone(original)
clone["a"]=999
push(clone["b"],999)
print("Original:",original)
print("Clone:",clone)
