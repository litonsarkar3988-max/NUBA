# Pattern: Observer design pattern

class EventEmitter {
    fun init(self) { self.listeners={} }
    fun on(self,e,fn) {
        if not has(self.listeners,e) { self.listeners[e]=[] }
        push(self.listeners[e],fn)
    }
    fun emit(self,e,data) {
        if has(self.listeners,e) { for fn in self.listeners[e] { fn(data) } }
    }
}
let ee=new EventEmitter()
ee.on("data",fun(d)->print("Handler 1:",d))
ee.on("data",fun(d)->print("Handler 2:",d*2))
ee.emit("data",42)
