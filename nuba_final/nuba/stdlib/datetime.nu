# stdlib/datetime.nu - Date/time utilities for Nuba
# Uses Nuba's time() built-in and wraps common patterns

fun now_timestamp() {
    return time()
}

fun elapsed_since(start) {
    return time() - start
}

fun benchmark(fn, label) {
    let start = time()
    fn()
    let elapsed = time() - start
    print(label + " took", round(elapsed * 1000, 2), "ms")
}

fun seconds_to_hms(total_secs) {
    let s = int(total_secs)
    let h = floor(s / 3600)
    let m = floor((s % 3600) / 60)
    let sec = s % 60
    return {"hours": h, "minutes": m, "seconds": sec}
}

fun format_hms(total_secs) {
    let t = seconds_to_hms(total_secs)
    fun pad2(n) {
        let s = str(n)
        if len(s) < 2 { return "0" + s }
        return s
    }
    return pad2(t["hours"]) + ":" + pad2(t["minutes"]) + ":" + pad2(t["seconds"])
}

fun sleep_ms(ms) {
    sleep(ms / 1000)
}

fun repeat_every(fn, times) {
    for i in 0..times {
        fn(i)
    }
}
