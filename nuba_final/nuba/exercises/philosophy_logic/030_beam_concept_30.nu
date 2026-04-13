# Philosophy Logic: Beam Concept

print("=== Philosophy Logic ===")
print("Topic: Beam Concept")

class BeamconceptDemo {
    fun init(self) {
        self.data    = []
        self.results = []
        print("Initialized beam concept demo")
    }
    
    fun run(self, input) {
        push(self.data, input)
        let result = self._process(input)
        push(self.results, result)
        return result
    }
    
    fun _process(self, x) {
        if isList(x) {
            return map(fun(v)->v*2, x)
        } elif isDict(x) {
            return {"processed":true,"keys":len(keys(x))}
        } elif isString(x) {
            return upper(x)
        }
        return x * 2
    }
    
    fun summary(self) {
        print("Processed:", len(self.results), "items")
    }
}

let demo = new BeamconceptDemo()
demo.run([1,2,3,4,5])
demo.run({"a":1,"b":2,"c":3})
demo.run("hello nuba")
demo.run(42)
demo.summary()
