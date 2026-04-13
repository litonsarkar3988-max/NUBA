# Web Concept: Ab Testing

print("=== Ab Testing ===")

# Ab Testing implementation concepts in Nuba

class AbtestingHandler {
    fun init(self) {
        self.config  = {}
        self.routes  = []
        self.middleware = []
        self.logs    = []
    }

    fun configure(self, key, value) {
        self.config[key] = value
        return self
    }

    fun add_middleware(self, fn) {
        push(self.middleware, fn)
        return self
    }

    fun add_route(self, method, path, handler) {
        push(self.routes, {"method":method,"path":path,"handler":handler})
        return self
    }

    fun handle_request(self, method, path, body) {
        push(self.logs, {"method":method,"path":path,"time":str(time())})

        # Run middleware
        let ctx = {"method":method,"path":path,"body":body,"status":200}
        for mw in self.middleware { mw(ctx) }

        # Find route
        for route in self.routes {
            if route["method"]==method and route["path"]==path {
                let result = route["handler"](ctx)
                print(format("[{0}] {1} {2} -> {3}",
                    ctx["status"], method, path, str(result)[:50]))
                return result
            }
        }
        ctx["status"] = 404
        print(format("[404] {0} {1} -> Not Found", method, path))
        return {"error":"Not Found"}
    }

    fun stats(self) {
        print("Routes:", len(self.routes))
        print("Requests:", len(self.logs))
        print("Config keys:", len(keys(self.config)))
    }
}

let server = new AbtestingHandler()
server.configure("host", "localhost")
      .configure("port", 8080)
      .configure("debug", true)

server.add_middleware(fun(ctx) -> print("  [MW] Request:", ctx["method"], ctx["path"]))
server.add_middleware(fun(ctx) -> { ctx["start_time"] = time() })

server.add_route("GET",  "/", fun(ctx) -> {"message":"Welcome to Ab Testing!"})
server.add_route("GET",  "/health", fun(ctx) -> {"status":"ok"})
server.add_route("POST", "/data",   fun(ctx) -> {"received":ctx["body"],"processed":true})

server.handle_request("GET",  "/", {})
server.handle_request("GET",  "/health", {})
server.handle_request("POST", "/data", {"value":42})
server.handle_request("GET",  "/unknown", {})
server.stats()
