# Daily Challenge 3: Check balanced brackets

fun balanced(s){
    let stack=[]
    let pairs={"(":")","[":"]","{":"}"}    
    for ch in s.chars() {
        if has(pairs,ch) { push(stack,pairs[ch]) }
        elif len(stack)==0 or pop(stack)!=ch { return false }
    }
    return len(stack)==0
}
print(balanced("({[]})"))
print(balanced("([)]"))
