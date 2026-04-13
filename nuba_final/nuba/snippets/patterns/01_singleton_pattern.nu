# Pattern: Singleton design pattern

let _db_instance=null
fun get_db(){
    if _db_instance==null {
        _db_instance={"host":"localhost","port":5432,"connected":false}
        _db_instance["connected"]=true
        print("DB connection created")
    } else {
        print("Returning existing connection")
    }
    return _db_instance
}
let db1=get_db()
let db2=get_db()
print("Same instance:",db1["host"]==db2["host"])
