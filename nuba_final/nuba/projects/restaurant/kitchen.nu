# Restaurant: Kitchen Management System
class KitchenOrder {
    fun init(self, order_id, items, table_no, priority) {
        self.order_id = order_id
        self.items    = items
        self.table_no = table_no
        self.priority = priority
        self.status   = "QUEUED"
        self.start_time = null
        self.notes    = []
    }
    fun start(self, time) {
        self.status     = "PREPARING"
        self.start_time = time
        print(format("[{0}] Kitchen: Starting order #{1} (Table {2})",
            time, self.order_id, self.table_no))
    }
    fun complete(self, time) {
        self.status = "READY"
        print(format("[{0}] Kitchen: Order #{1} READY for pickup!", time, self.order_id))
    }
    fun add_note(self, note) { push(self.notes, note); return self }
}
class Kitchen {
    fun init(self, name, stations) {
        self.name     = name
        self.stations = stations
        self.queue    = []
        self.active   = []
        self.done     = []
    }
    fun receive(self, order) {
        push(self.queue, order)
        print("Kitchen received order #" + str(order.order_id))
        return self
    }
    fun process_next(self, current_time) {
        if len(self.queue) == 0 { print("No orders in queue"); return }
        let order = self.queue[0]
        self.queue = self.queue.slice(1, len(self.queue))
        order.start(current_time)
        push(self.active, order)
    }
    fun complete_order(self, order_id, current_time) {
        for i in 0..len(self.active) {
            if self.active[i].order_id == order_id {
                self.active[i].complete(current_time)
                push(self.done, self.active[i])
                self.active = filter(fun(o)->o.order_id!=order_id, self.active)
                return
            }
        }
    }
    fun status(self) {
        print(format("Kitchen '{0}' | Queued:{1} | Active:{2} | Done:{3}",
            self.name, len(self.queue), len(self.active), len(self.done)))
    }
}
let kitchen = new Kitchen("Main Kitchen", ["Grill","Fryer","Salad","Dessert"])
let o1 = new KitchenOrder(1, ["Pizza x2","Salad x1"], 3, "NORMAL")
let o2 = new KitchenOrder(2, ["Wings x1","Burger x2"], 5, "HIGH")
kitchen.receive(o1).receive(o2)
kitchen.process_next("12:05")
kitchen.process_next("12:07")
kitchen.complete_order(1, "12:30")
kitchen.status()
