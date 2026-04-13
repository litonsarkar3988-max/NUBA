# DevOps: Paved Roads

print("=== Paved Roads ===")

# DevOps pipeline simulation

class Pipeline {
    fun init(self, name) {
        self.name   = name
        self.stages = []
        self.status = "idle"
        self.runs   = []
    }

    fun add_stage(self, stage_name, fn) {
        push(self.stages, {"name":stage_name,"fn":fn,"status":"pending"})
        return self
    }

    fun run(self) {
        self.status = "running"
        let run_id = len(self.runs) + 1
        let run = {"id":run_id,"stages":[],"start":time(),"status":"running"}
        print(format("Pipeline '{0}' Run #{1} started", self.name, run_id))

        for stage in self.stages {
            print("  Stage:", stage["name"], "...")
            try {
                let result = stage["fn"]()
                stage["status"] = "passed"
                push(run["stages"], {"stage":stage["name"],"status":"passed","result":str(result)[:50]})
                print("    ✓ Passed")
            } catch (err) {
                stage["status"] = "failed"
                push(run["stages"], {"stage":stage["name"],"status":"failed","error":err})
                print("    ✗ Failed:", err)
                run["status"] = "failed"
                self.status = "failed"
                push(self.runs, run)
                return run
            }
        }

        run["status"] = "success"
        run["duration"] = round(time() - run["start"], 2)
        self.status = "success"
        push(self.runs, run)
        print(format("Pipeline completed in {0}s", run["duration"]))
        return run
    }

    fun report(self) {
        print("=== Pipeline Report:", self.name, "===")
        print("Total runs:", len(self.runs))
        let passed = len(filter(fun(r)->r["status"]=="success", self.runs))
        print("Success rate:", round(passed*100/max([1,len(self.runs)]),1), "%")
    }
}

# Demo for Paved Roads
let ci = new Pipeline("Paved Roads Pipeline")
ci.add_stage("Checkout",   fun() -> {"code":"checked out","branch":"main"})
ci.add_stage("Build",      fun() -> {"artifacts":3,"size":"15MB"})
ci.add_stage("Unit Tests", fun() -> {"passed":142,"failed":0,"coverage":"87%"})
ci.add_stage("Lint",       fun() -> {"warnings":2,"errors":0})
ci.add_stage("Security",   fun() -> {"vulnerabilities":0,"grade":"A"})
ci.add_stage("Package",    fun() -> {"image":"app:latest","pushed":true})
ci.add_stage("Deploy",     fun() -> {"environment":"staging","replicas":3})

let result = ci.run()
print("\nRun result:", result["status"])
ci.report()
