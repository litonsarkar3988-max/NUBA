# Helper: Format with SI suffix

fun si(n){
    if n>=1000000000 { return str(round(n/1000000000,1))+"B" }
    elif n>=1000000 { return str(round(n/1000000,1))+"M" }
    elif n>=1000 { return str(round(n/1000,1))+"K" }
    return str(n)
}
for n in [999,1500,250000,1234567,9876543210] { print(si(n)) }
