# LeetCode Style: Valid Parentheses

fun valid_parens(s){
    let stack=[]
    let map={"(":")","[":"]","{":"}"}    
    for ch in s.chars() {
        if has(map,ch) { push(stack,map[ch]) }
        elif len(stack)==0 or pop(stack)!=ch { return false }
    }
    return len(stack)==0
}
for s in ["()","()[]{}","(]",'([)]',"{[]}"]: print(s,valid_parens(s))
