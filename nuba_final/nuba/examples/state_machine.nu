# examples/state_machine.nu - Finite State Machine in Nuba

class StateMachine {
    fun init(self, initial) {
        self.state       = initial
        self.transitions = {}
        self.actions     = {}
        self.history     = [initial]
    }

    fun add_transition(self, from_state, event, to_state) {
        let key = from_state + ":" + event
        self.transitions[key] = to_state
        return self
    }

    fun on_enter(self, state, fn) {
        self.actions[state] = fn
        return self
    }

    fun trigger(self, event) {
        let key = self.state + ":" + event
        if not has(self.transitions, key) {
            print("Invalid transition:", self.state, "->", event)
            return false
        }
        let next = self.transitions[key]
        self.state = next
        push(self.history, next)
        if has(self.actions, next) {
            self.actions[next]()
        }
        return true
    }

    fun can(self, event) {
        return has(self.transitions, self.state + ":" + event)
    }

    fun show(self) {
        print("State:", self.state, "| History:", self.history)
    }
}

# Order processing state machine
let order = new StateMachine("pending")

order.add_transition("pending",    "confirm",  "confirmed")
order.add_transition("confirmed",  "pay",      "paid")
order.add_transition("paid",       "ship",     "shipped")
order.add_transition("shipped",    "deliver",  "delivered")
order.add_transition("pending",    "cancel",   "cancelled")
order.add_transition("confirmed",  "cancel",   "cancelled")

fun on_confirmed()  { print("  -> Order confirmed!") }
fun on_paid()       { print("  -> Payment received!") }
fun on_shipped()    { print("  -> Order is on its way!") }
fun on_delivered()  { print("  -> Order delivered!") }
fun on_cancelled()  { print("  -> Order cancelled.") }
order.on_enter("confirmed",  on_confirmed)
order.on_enter("paid",       on_paid)
order.on_enter("shipped",    on_shipped)
order.on_enter("delivered",  on_delivered)
order.on_enter("cancelled",  on_cancelled)

print("Order State Machine")
print("──────────────────")
order.show()
order.trigger("confirm")
order.show()
order.trigger("pay")
order.show()
order.trigger("ship")
order.show()
order.trigger("deliver")
order.show()

# Turnstile example
print("\nTurnstile State Machine")
print("───────────────────────")

let ts = new StateMachine("locked")
ts.add_transition("locked",   "coin",  "unlocked")
ts.add_transition("unlocked", "push",  "locked")
ts.add_transition("unlocked", "coin",  "unlocked")
ts.add_transition("locked",   "push",  "locked")

fun ts_unlocked() { print("  -> Click! Ready to pass.") }
fun ts_locked()   { print("  -> Thud! Insert coin.") }
ts.on_enter("unlocked", ts_unlocked)
ts.on_enter("locked",   ts_locked)

ts.trigger("coin")
ts.trigger("push")
ts.trigger("push")
ts.trigger("coin")
ts.trigger("coin")
ts.trigger("push")
ts.show()
