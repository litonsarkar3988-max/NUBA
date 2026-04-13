# Utility: Debounce simulation

# Simulates debounce: only process last event in batch
fun process_events(events, window_size){
    let result=[]
    let i=0
    while i<len(events) {
        let batch=events.slice(i,min([i+window_size,len(events)]))
        push(result,batch[len(batch)-1])
        i+=window_size
    }
    return result
}
let events=["click","click","click","hover","hover","submit"]
print(process_events(events,2))
