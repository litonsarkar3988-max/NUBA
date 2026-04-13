# One-liner: Group strings by length

let words=["hi","hello","hey","world","ok"]
let g={}
for w in words {
    let k=str(len(w))
    if not has(g,k){ g[k]=[] }
    push(g[k],w)
}
print(g)
