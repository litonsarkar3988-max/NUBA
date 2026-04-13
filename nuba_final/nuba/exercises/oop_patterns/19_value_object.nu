# OOP Pattern: Value Object
# Pattern #19 in the advanced OOP patterns series

class ValueobjectBase {
    fun init(self, config) {
        self.config    = config
        self.state     = "initialized"
        self.observers = []
        self.log       = []
    }

    fun subscribe(self, fn) {
        push(self.observers, fn)
        return self
    }

    fun notify(self, event, data) {
        for obs in self.observers { obs(event, data) }
    }

    fun execute(self, command, args) {
        push(self.log, {"cmd":command,"args":args})
        let result = self._do(command, args)
        self.notify(command, result)
        return result
    }

    fun _do(self, command, args) {
        print(format("Executing [0] with {1}", command, args))
        return {"command":command,"status":"ok","result":args}
    }

    fun history(self) {
        print("=== Command History ===")
        for entry in self.log {
            print(format("  {0}: {1}", entry["cmd"], entry["args"]))
        }
    }
}

class ValueobjectImpl(ValueobjectBase) {
    fun init(self) {
        super.init({"pattern":"value_object","version":"1.0"})
    }
    fun run(self) {
        print("Running: Value Object")
        self.execute("setup",   {"step":1})
        self.execute("process", {"step":2})
        self.execute("cleanup", {"step":3})
        return self
    }
}

let impl = new ValueobjectImpl()
impl.subscribe(fun(e,d)->print("  [event]",e,":",d["status"]))
impl.run()
impl.history()
