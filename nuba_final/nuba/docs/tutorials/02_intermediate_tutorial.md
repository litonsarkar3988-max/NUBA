# Intermediate Tutorial: Build a Task Scheduler

## Overview
We'll build a cron-like task scheduler that manages and runs tasks.

## Step 1: Task Definition

```nuba
class Task {
    fun init(self, name, fn, interval_seconds) {
        self.name     = name
        self.fn       = fn
        self.interval = interval_seconds
        self.last_run = 0
        self.run_count = 0
        self.enabled  = true
    }

    fun should_run(self, current_time) {
        return self.enabled and (current_time - self.last_run) >= self.interval
    }

    fun execute(self, current_time) {
        self.fn()
        self.last_run  = current_time
        self.run_count += 1
    }
}
```

## Step 2: Scheduler

```nuba
class Scheduler {
    fun init(self) { self.tasks = [] }

    fun add(self, task) { push(self.tasks, task) }

    fun tick(self, current_time) {
        for task in self.tasks {
            if task.should_run(current_time) {
                print("[" + str(current_time) + "s] Running:", task.name)
                task.execute(current_time)
            }
        }
    }

    fun run_for(self, duration, tick_interval) {
        let t = 0
        while t <= duration {
            self.tick(t)
            t += tick_interval
        }
    }

    fun stats(self) {
        for task in self.tasks {
            print(format("{0}: ran {1} times", task.name, task.run_count))
        }
    }
}
```

## Step 3: Run It

```nuba
let scheduler = new Scheduler()

scheduler.add(new Task("Heartbeat", fun() -> print("  ♥ alive"), 5))
scheduler.add(new Task("Cleanup",   fun() -> print("  🗑 cleaning"), 10))
scheduler.add(new Task("Backup",    fun() -> print("  💾 backing up"), 15))

scheduler.run_for(30, 1)
print("\n--- Stats ---")
scheduler.stats()
```
