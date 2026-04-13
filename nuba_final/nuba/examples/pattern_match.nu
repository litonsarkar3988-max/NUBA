# examples/pattern_match.nu - Pattern matching in Nuba

# Basic match
fun describe_number(n) {
    match n {
        case 0 -> { return "zero" }
        case 1 -> { return "one" }
        case 2 -> { return "two" }
        case _ -> { return "many (" + str(n) + ")" }
    }
}

for i in 0..5 {
    print(i, "->", describe_number(i))
}

# Match on strings
fun http_status(code) {
    match code {
        case 200 -> { return "OK" }
        case 201 -> { return "Created" }
        case 400 -> { return "Bad Request" }
        case 401 -> { return "Unauthorized" }
        case 403 -> { return "Forbidden" }
        case 404 -> { return "Not Found" }
        case 500 -> { return "Internal Server Error" }
        case _ -> { return "Unknown status" }
    }
}

let codes = [200, 201, 404, 500, 418]
for code in codes {
    print(code, "->", http_status(code))
}

# Match with computation
fun day_type(day) {
    match day {
        case "Saturday" -> { return "weekend" }
        case "Sunday"   -> { return "weekend" }
        case "Monday"   -> { return "weekday" }
        case "Tuesday"  -> { return "weekday" }
        case "Wednesday"-> { return "weekday" }
        case "Thursday" -> { return "weekday" }
        case "Friday"   -> { return "weekday" }
        case _          -> { return "unknown day" }
    }
}

let days = ["Monday", "Saturday", "Wednesday", "Sunday", "Holiday"]
for day in days {
    print(day, "is a", day_type(day))
}

# State machine using match
class TrafficLight {
    fun init(self) {
        self.state = "red"
    }

    fun next(self) {
        match self.state {
            case "red"    -> { self.state = "green" }
            case "green"  -> { self.state = "yellow" }
            case "yellow" -> { self.state = "red" }
            case _        -> { self.state = "red" }
        }
        return self.state
    }

    fun action(self) {
        match self.state {
            case "red"    -> { return "STOP" }
            case "yellow" -> { return "CAUTION" }
            case "green"  -> { return "GO" }
            case _        -> { return "UNKNOWN" }
        }
    }
}

let light = new TrafficLight()
print("\nTraffic light simulation:")
for i in 0..7 {
    print(light.state, "->", light.action())
    light.next()
}
