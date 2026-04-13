# Cloud Computing: Stackdriver

print("=== Stackdriver ===")

# Cloud infrastructure simulation

class CloudResource {
    fun init(self, resource_id, resource_type, region, config) {
        self.id       = resource_id
        self.type     = resource_type
        self.region   = region
        self.config   = config
        self.status   = "creating"
        self.tags     = {}
        self.metrics  = {"cpu":0,"memory":0,"requests":0}
        self.created_at = time()
    }

    fun start(self) {
        self.status = "running"
        print(format("{0} ({1}) started in {2}", self.id, self.type, self.region))
        return self
    }

    fun stop(self) {
        self.status = "stopped"
        print(self.id, "stopped")
        return self
    }

    fun scale(self, instances) {
        self.config["instances"] = instances
        print(self.id, "scaled to", instances, "instances")
        return self
    }

    fun add_tag(self, key, value) {
        self.tags[key] = value
        return self
    }

    fun update_metrics(self) {
        self.metrics["cpu"]      = round(random() * 100, 1)
        self.metrics["memory"]   = round(random() * 100, 1)
        self.metrics["requests"] = randint(100, 10000)
        return self
    }

    def cost_per_hour(self) {
        let base_costs = {"compute":0.1,"storage":0.02,"database":0.15,"cache":0.08}
        return base_costs[self.type] if has(base_costs, self.type) else 0.05
    }

    fun info(self) {
        print(format("Resource: {0} | Type: {1} | Status: {2} | Region: {3}",
            self.id, self.type, self.status, self.region))
        print(format("  CPU: {0}% | Memory: {1}% | Requests: {2}",
            self.metrics["cpu"], self.metrics["memory"], self.metrics["requests"]))
    }
}

class CloudInfrastructure {
    fun init(self, name) {
        self.name      = name
        self.resources = {}
        self.cost      = 0
    }

    fun provision(self, res_id, res_type, region, config) {
        let r = new CloudResource(res_id, res_type, region, config)
        r.start()
        self.resources[res_id] = r
        return r
    }

    fun decommission(self, res_id) {
        if has(self.resources, res_id) {
            self.resources[res_id].stop()
        }
    }

    fun total_cost_per_hour(self) {
        let total = 0
        for pair in items(self.resources) {
            if pair[1].status == "running" {
                total += pair[1].cost_per_hour()
            }
        }
        return round(total, 4)
    }

    fun health_check(self) {
        print("=== Infrastructure Health ===")
        for pair in items(self.resources) {
            pair[1].update_metrics()
            pair[1].info()
        }
        print("Total cost/hour: $" + str(self.total_cost_per_hour()))
    }
}

# Demo for Stackdriver
let infra = new CloudInfrastructure("Stackdriver Infra")
infra.provision("web-1",   "compute",  "us-east-1", {"instances":3,"type":"t3.medium"})
infra.provision("db-1",    "database", "us-east-1", {"type":"db.r5.large","multi_az":true})
infra.provision("cache-1", "cache",    "us-east-1", {"type":"cache.r5.large","nodes":2})
infra.provision("stor-1",  "storage",  "us-east-1", {"capacity_gb":500,"class":"standard"})

infra.resources["web-1"].scale(5)
infra.health_check()
