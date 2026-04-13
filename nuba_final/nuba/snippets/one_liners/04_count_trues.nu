# One-liner: Count truthy values

let lst = [1,0,true,false,null,"hi",""]
let c = len(filter(fun(x)->bool(x), lst))
print(c)
