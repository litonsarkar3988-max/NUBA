# One-liner: Min and max with index

let lst=[5,2,8,1,9,3]
let min_i=0; let max_i=0
for i in 0..len(lst) {
    if lst[i]<lst[min_i] { min_i=i }
    if lst[i]>lst[max_i] { max_i=i }
}
print("Min:",lst[min_i],"at",min_i)
print("Max:",lst[max_i],"at",max_i)
