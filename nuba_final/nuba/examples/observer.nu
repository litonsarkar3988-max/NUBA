# examples/observer.nu - Observer pattern + reactive data in Nuba

class Observable {
    fun init(self, value) {
        self._value     = value
        self._observers = []
    }

    fun get(self) {
        return self._value
    }

    fun set(self, new_value) {
        let old = self._value
        self._value = new_value
        if old != new_value {
            self._notify(old, new_value)
        }
    }

    fun subscribe(self, fn) {
        push(self._observers, fn)
        return self
    }

    fun _notify(self, old_val, new_val) {
        for obs in self._observers {
            obs(old_val, new_val)
        }
    }
}

class Store {
    fun init(self, initial_state) {
        self.state    = initial_state
        self._subs    = []
        self._history = [initial_state]
    }

    fun get(self, key) {
        return self.state[key] if has(self.state, key) else null
    }

    fun update(self, patch) {
        for pair in items(patch) {
            self.state[pair[0]] = pair[1]
        }
        push(self._history, self.state.copy())
        self._notify()
    }

    fun subscribe(self, fn) {
        push(self._subs, fn)
    }

    fun _notify(self) {
        for fn in self._subs {
            fn(self.state)
        }
    }

    fun undo(self) {
        if len(self._history) <= 1 {
            print("Nothing to undo")
            return
        }
        pop(self._history)
        self.state = self._history[len(self._history) - 1].copy()
        self._notify()
    }
}

# Demo Observable
print("=== Observable ===")
let temperature = new Observable(20)

fun temp_logger(old, new_val) {
    print("Temperature changed:", old, "->", new_val, "C")
}
fun temp_alert(old, new_val) {
    if new_val > 35 { print("  Heat warning!") }
    if new_val < 0  { print("  Freezing!") }
}
temperature.subscribe(temp_logger)
temperature.subscribe(temp_alert)

temperature.set(25)
temperature.set(38)
temperature.set(-5)
temperature.set(22)

# Demo Store
print("\n=== Reactive Store ===")
let store = new Store({
    "user": "Guest",
    "score": 0,
    "level": 1
})

fun state_printer(s) {
    print(format("State: user={0} score={1} level={2}",
                 s["user"], s["score"], s["level"]))
}
store.subscribe(state_printer)

store.update({"user": "Alice", "score": 100})
store.update({"score": 250})
store.update({"level": 2, "score": 500})
print("Undo last change:")
store.undo()
