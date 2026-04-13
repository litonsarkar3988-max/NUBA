# Helper: Smart title case

let small=["a","an","the","and","but","or","for","in","on","at","to","of"]
fun title_smart(s){
    let words=split(s," ")
    let result=[]
    for i in 0..len(words) {
        let w=words[i]
        if i==0 or not small.contains(lower(w)) {
            push(result,upper(substr(w,0,1))+lower(substr(w,1,len(w))))
        } else {
            push(result,lower(w))
        }
    }
    return join(result," ")
}
print(title_smart("the quick brown fox and the lazy dog"))
