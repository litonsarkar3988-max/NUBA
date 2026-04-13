# Helper: Format seconds to duration string

fun format_dur(secs){
    let h=floor(secs/3600)
    let m=floor((secs%3600)/60)
    let s=secs%60
    fun pad(n){ let s=str(n); return "0"+s if len(s)<2 else s }
    return pad(h)+":"+pad(m)+":"+pad(s)
}
for s in [0,59,3661,86399] { print(format_dur(s)) }
