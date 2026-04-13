# OS Concepts: Exokernel

print("=== Exokernel ===")

class OSSimulator {
    fun init(self) {
        self.processes = []
        self.memory    = []
        self.clock     = 0
        self.events    = []
    }

    fun create_process(self, pid, name, burst_time, priority, arrival) {
        let p = {"pid":pid,"name":name,"burst":burst_time,"priority":priority,
                  "arrival":arrival,"state":"ready","wait_time":0,"turnaround":0}
        push(self.processes, p)
        return p
    }

    fun schedule_fcfs(self) {
        let sorted_p = sorted(self.processes, false)
        let current_time = 0
        let results = []
        for p in sorted_p {
            if current_time < p["arrival"] { current_time = p["arrival"] }
            p["wait_time"]   = current_time - p["arrival"]
            p["turnaround"]  = p["wait_time"] + p["burst"]
            current_time    += p["burst"]
            push(results, p)
        }
        return results
    }

    fun schedule_rr(self, quantum) {
        let queue = self.processes.copy()
        let current_time = 0
        let results = []
        let remaining = {}
        for p in queue { remaining[str(p["pid"])] = p["burst"] }
        while len(queue) > 0 {
            let p = queue[0]
            queue = queue.slice(1, len(queue))
            let exec = min([quantum, remaining[str(p["pid"])]])
            remaining[str(p["pid"])] -= exec
            current_time += exec
            if remaining[str(p["pid"])] == 0 {
                p["turnaround"] = current_time - p["arrival"]
                push(results, p)
            } else {
                push(queue, p)
            }
        }
        return results
    }

    fun memory_usage(self) {
        return {"total":1024,"used":len(self.processes)*64,"free":1024-len(self.processes)*64}
    }

    fun stats(self) {
        print("OS Simulation: Exokernel")
        print("Processes:", len(self.processes))
        print("Clock:", self.clock)
        let mem = self.memory_usage()
        print("Memory: " + str(mem["used"]) + "/" + str(mem["total"]) + " MB")
    }
}

let os_sim = new OSSimulator()
os_sim.create_process(1, "init",    1, 0, 0)
os_sim.create_process(2, "shell",   3, 5, 1)
os_sim.create_process(3, "editor",  5, 3, 2)
os_sim.create_process(4, "compiler",8, 2, 3)
os_sim.create_process(5, "browser", 6, 4, 4)

print("FCFS Scheduling:")
let fcfs = os_sim.schedule_fcfs()
for p in fcfs {
    print(format("  PID={0} {1}: wait={2} turnaround={3}",
        p["pid"], p["name"], p["wait_time"], p["turnaround"]))
}

print("\nRound Robin (quantum=2):")
let rr = os_sim.schedule_rr(2)
for p in rr {
    print(format("  PID={0} {1}: turnaround={2}", p["pid"], p["name"], p["turnaround"]))
}
os_sim.stats()
