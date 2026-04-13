# Utility: Function composition

fun compose(fns){
    return fun(x)->{
        let result=x
        let i=len(fns)-1
        while i>=0 { result=fns[i](result); i-=1 }
        return result
    }
}
let transform=compose([fun(x)->x+1, fun(x)->x*2, fun(x)->x-3])
print(transform(10))
