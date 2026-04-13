# Helper: Truncate text to word count

fun truncate_words(text,n,suffix){
    let words=split(text," ")
    if len(words)<=n { return text }
    return join(words.slice(0,n)," ")+suffix
}
print(truncate_words("The quick brown fox jumps over the lazy dog",5,"..."))
