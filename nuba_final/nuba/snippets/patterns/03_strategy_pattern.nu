# Pattern: Strategy design pattern

fun sort_strategy(data,strategy){
    if strategy=="quick" {
        fun qs(a){
            if len(a)<=1 { return a }
            let p=a[0]
            return qs(filter(fun(x)->x<p,a.slice(1,len(a))))+[p]+qs(filter(fun(x)->x>=p,a.slice(1,len(a))))
        }
        return qs(data)
    } elif strategy=="builtin" {
        return sorted(data)
    } else {
        return data.copy()
    }
}
let data=[5,2,8,1,9,3]
print(sort_strategy(data,"quick"))
print(sort_strategy(data,"builtin"))
