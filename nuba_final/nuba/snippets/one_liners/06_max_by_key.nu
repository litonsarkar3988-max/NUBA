# One-liner: Max element by key

let items=[{"n":"a","v":3},{"n":"b","v":7},{"n":"c","v":1}]
let mx=items[0]
for i in items { if i["v"]>mx["v"] { mx=i } }
print(mx)
