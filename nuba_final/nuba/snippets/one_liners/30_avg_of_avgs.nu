# One-liner: Average of group averages

let groups=[[1,2,3],[4,5],[6,7,8,9]]
let avgs=map(fun(g)->sum(g)/len(g),groups)
print("Avg of avgs:",round(sum(avgs)/len(avgs),2))
