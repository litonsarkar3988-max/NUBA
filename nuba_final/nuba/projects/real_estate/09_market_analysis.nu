# Project: Real Estate - Market Analysis Module

print("=== Real Estate: Market Analysis ===")

class Marketanalysis {
    fun init(self) {
        self.records  = []
        self.active   = true
        self.log      = []
        self.settings = {"auto_save":true,"notifications":true}
    }

    fun create(self, data) {
        let id = len(self.records) + 1
        let record = {"id":id,"created_at":str(time())}
        for pair in items(data) { record[pair[0]] = pair[1] }
        push(self.records, record)
        self._log("CREATE", id)
        return record
    }

    fun find(self, id) {
        for r in self.records {
            if r["id"] == id { return r }
        }
        return null
    }

    fun update(self, id, data) {
        let record = self.find(id)
        if record == null { throw "Record " + str(id) + " not found" }
        for pair in items(data) { record[pair[0]] = pair[1] }
        self._log("UPDATE", id)
        return record
    }

    fun delete(self, id) {
        self.records = filter(fun(r)->r["id"]!=id, self.records)
        self._log("DELETE", id)
    }

    fun list_all(self) { return self.records }
    fun count(self)    { return len(self.records) }

    fun search(self, field, value) {
        return filter(fun(r)->has(r,field) and r[field]==value, self.records)
    }

    fun _log(self, action, id) {
        push(self.log, {"action":action,"id":id,"time":str(time())})
    }

    fun report(self) {
        print(format("{0} Module Report", "Market Analysis"))
        print("Total records:", self.count())
        print("Recent actions:", len(self.log))
    }
}

let module = new Marketanalysis()

# Test CRUD operations
let r1 = module.create({"name":"Sample 1","status":"active","priority":1})
let r2 = module.create({"name":"Sample 2","status":"pending","priority":2})
let r3 = module.create({"name":"Sample 3","status":"active","priority":3})

print("Created:", r1["name"], r2["name"], r3["name"])
module.update(2, {"status":"completed"})
let found = module.find(1)
print("Found:", found["name"] if found != null else "not found")
let active = module.search("status","active")
print("Active records:", len(active))
module.delete(3)
module.report()
