# One-liner: Unique elements sorted

let lst=[3,1,4,1,5,9,2,6,5,3]
let u={}
for x in lst { u[str(x)]=x }
print(sorted(values(u)))
