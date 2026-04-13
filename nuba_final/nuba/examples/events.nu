# examples/events.nu - Event emitter pattern in Nuba

class EventEmitter {
    fun init(self) {
        self._listeners = {}
    }

    fun on(self, event, fn) {
        if not has(self._listeners, event) {
            self._listeners[event] = []
        }
        push(self._listeners[event], fn)
        return self
    }

    fun off(self, event) {
        self._listeners[event] = []
        return self
    }

    fun emit(self, event, data) {
        if not has(self._listeners, event) { return self }
        for listener in self._listeners[event] {
            listener(data)
        }
        return self
    }

    fun once(self, event, fn) {
        let fired = false
        fun wrapper(data) {
            if not fired {
                fired = true
                fn(data)
            }
        }
        self.on(event, wrapper)
        return self
    }
}

# Demo
let emitter = new EventEmitter()

fun on_data1(d)    { print("Received data:", d) }
fun on_data2(d)    { print("Also got:", d) }
fun on_error(e)    { print("ERROR:", e) }
fun on_connect(d)  { print("Connected! (only once):", d) }
emitter.on("data", on_data1)
emitter.on("data", on_data2)
emitter.on("error", on_error)
emitter.once("connect", on_connect)

emitter.emit("data", "hello")
emitter.emit("data", "world")
emitter.emit("connect", "server:8080")
emitter.emit("connect", "server:8080")   # 'once' won't fire again
emitter.emit("error", "Connection refused")

# Chat-like application
print("\n--- Chat Room Simulation ---")

class ChatRoom {
    fun init(self, name) {
        self.name = name
        self.events = new EventEmitter()
        self.users = []
        self.messages = []
    }

    fun join(self, username) {
        push(self.users, username)
        self.events.emit("join", username)
        return self
    }

    fun leave(self, username) {
        self.users = filter(fun(u) -> u != username, self.users)
        self.events.emit("leave", username)
        return self
    }

    fun send(self, username, msg) {
        let message = {"from": username, "text": msg}
        push(self.messages, message)
        self.events.emit("message", message)
        return self
    }

    fun on(self, event, fn) {
        self.events.on(event, fn)
        return self
    }
}

let room = new ChatRoom("general")

fun room_join(u) { print("[+]", u, "joined") }
room.on("join", room_join)
fun room_leave(u) { print("[-]", u, "left") }
room.on("leave", room_leave)
fun room_msg(m) { print("[" + m["from"] + "]:", m["text"]) }
room.on("message", room_msg)

room.join("Alice")
room.join("Bob")
room.send("Alice", "Hello everyone!")
room.send("Bob", "Hey Alice!")
room.leave("Bob")
room.send("Alice", "Bye Bob!")

print("Total messages:", len(room.messages))
print("Online users:", room.users)
