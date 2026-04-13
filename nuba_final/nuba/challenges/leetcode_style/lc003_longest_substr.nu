# LeetCode Style: Longest Substring No Repeat

fun length_longest(s){
    let seen={}; let start=0; let best=0
    let chars=s.chars()
    for i in 0..len(chars) {
        if has(seen,chars[i]) and seen[chars[i]]>=start { start=seen[chars[i]]+1 }
        seen[chars[i]]=i
        if i-start+1>best { best=i-start+1 }
    }
    return best
}
print(length_longest("abcabcbb"))
print(length_longest("bbbbb"))
