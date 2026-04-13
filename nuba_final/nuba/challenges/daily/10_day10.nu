# Daily Challenge 10: Word ladder length

fun word_ladder(begin,end_word,word_list){
    let word_set={}
    for w in word_list { word_set[w]=true }
    if not has(word_set,end_word) { return 0 }
    let queue=[[begin,1]]
    let visited={}
    visited[begin]=true
    while len(queue)>0 {
        let cur=queue[0][0]; let steps=queue[0][1]
        queue=queue.slice(1,len(queue))
        if cur==end_word { return steps }
        for i in 0..len(cur) {
            for c in "abcdefghijklmnopqrstuvwxyz".chars() {
                let next=substr(cur,0,i)+c+substr(cur,i+1,len(cur))
                if has(word_set,next) and not has(visited,next) {
                    visited[next]=true
                    push(queue,[next,steps+1])
                }
            }
        }
    }
    return 0
}
print(word_ladder("hit","cog",["hot","dot","dog","lot","log","cog"]))
