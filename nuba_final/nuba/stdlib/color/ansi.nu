# stdlib/color: ANSI terminal colors
const RESET  = "\033[0m"
const BOLD   = "\033[1m"
const DIM    = "\033[2m"
const RED    = "\033[31m"
const GREEN  = "\033[32m"
const YELLOW = "\033[33m"
const BLUE   = "\033[34m"
const MAGENTA= "\033[35m"
const CYAN   = "\033[36m"
const WHITE  = "\033[37m"
const BG_RED    = "\033[41m"
const BG_GREEN  = "\033[42m"
const BG_YELLOW = "\033[43m"
const BG_BLUE   = "\033[44m"

fun colorize(text, color) { return color + text + RESET }
fun red(t)     { return colorize(t, RED) }
fun green(t)   { return colorize(t, GREEN) }
fun yellow(t)  { return colorize(t, YELLOW) }
fun blue(t)    { return colorize(t, BLUE) }
fun cyan(t)    { return colorize(t, CYAN) }
fun bold(t)    { return BOLD + t + RESET }
fun success(t) { return green("✓ " + t) }
fun error(t)   { return red("✗ " + t) }
fun warn(t)    { return yellow("⚠ " + t) }
fun info(t)    { return cyan("ℹ " + t) }
