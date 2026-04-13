# One-liner: Zip two lists to dict

let k=["a","b","c"]
let v=[1,2,3]
let d={}
for p in zip(k,v) { d[p[0]]=p[1] }
print(d)
