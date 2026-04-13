# Helper: Format bytes to human readable

fun format_bytes(bytes){
    let units=["B","KB","MB","GB","TB"]
    let i=0
    let b=float(bytes)
    while b>=1024 and i<len(units)-1 { b=b/1024; i+=1 }
    return str(round(b,2))+" "+units[i]
}
for b in [512,1536,1048576,1073741824] { print(format_bytes(b)) }
