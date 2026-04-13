# Helper: Generate UUID v4 style

fun uuid(){
    fun rh(n){
        let hex="0123456789abcdef"
        let r=""
        for i in 0..n { r+=substr(hex,randint(0,15),randint(0,15)+1) }
        return r
    }
    return rh(8)+"-"+rh(4)+"-4"+rh(3)+"-"+rh(4)+"-"+rh(12)
}
for i in 0..3 { print(uuid()) }
