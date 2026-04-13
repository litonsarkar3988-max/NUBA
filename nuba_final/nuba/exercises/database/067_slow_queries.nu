# Database: Slow Queries

print("=== Slow Queries ===")

# Simulate database operations for Slow Queries

class Database {
    fun init(self, name) {
        self.name   = name
        self.tables = {}
        self.indexes = {}
        self.log    = []
    }

    fun create_table(self, table_name, columns) {
        self.tables[table_name] = {"columns":columns,"rows":[],"indexes":{}}
        print("Created table:", table_name)
        return self
    }

    fun insert(self, table_name, data) {
        if not has(self.tables, table_name) { throw "Table not found: " + table_name }
        let table = self.tables[table_name]
        let id = len(table["rows"]) + 1
        let row = {"id":id}
        for pair in items(data) { row[pair[0]] = pair[1] }
        push(table["rows"], row)
        push(self.log, "INSERT into " + table_name)
        return id
    }

    fun select(self, table_name, where_fn) {
        if not has(self.tables, table_name) { throw "Table not found" }
        let rows = self.tables[table_name]["rows"]
        if where_fn == null { return rows }
        return filter(where_fn, rows)
    }

    fun update_rows(self, table_name, where_fn, update_data) {
        if not has(self.tables, table_name) { throw "Table not found" }
        let updated = 0
        for row in self.tables[table_name]["rows"] {
            if where_fn == null or where_fn(row) {
                for pair in items(update_data) { row[pair[0]] = pair[1] }
                updated += 1
            }
        }
        push(self.log, "UPDATE " + str(updated) + " rows in " + table_name)
        return updated
    }

    fun delete_rows(self, table_name, where_fn) {
        if not has(self.tables, table_name) { throw "Table not found" }
        let before = len(self.tables[table_name]["rows"])
        self.tables[table_name]["rows"] = filter(fun(r)->not where_fn(r), self.tables[table_name]["rows"])
        let deleted = before - len(self.tables[table_name]["rows"])
        push(self.log, "DELETE " + str(deleted) + " from " + table_name)
        return deleted
    }

    fun stats(self) {
        print("Database:", self.name)
        for pair in items(self.tables) {
            print(format("  Table {0}: {1} rows", pair[0], len(pair[1]["rows"])))
        }
        print("Operations:", len(self.log))
    }
}

let db = new Database("slow_queries_db")
db.create_table("users", ["id","name","email","age","active"])
db.create_table("orders", ["id","user_id","product","amount","status"])

for i in 1..6 {
    db.insert("users", {"name":"User"+str(i),"email":"user"+str(i)+"@test.com","age":20+i*5,"active":i%2==0})
}
for i in 1..4 {
    db.insert("orders", {"user_id":i,"product":"Product"+str(i),"amount":i*29.99,"status":"completed"})
}

let active_users = db.select("users", fun(r)->r["active"])
print("Active users:", len(active_users))
let updated = db.update_rows("users", fun(r)->r["age"]>30, {"premium":true})
print("Updated to premium:", updated)
let deleted = db.delete_rows("orders", fun(r)->r["amount"]<50)
print("Deleted cheap orders:", deleted)
db.stats()
