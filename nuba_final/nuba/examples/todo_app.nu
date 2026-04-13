# examples/todo_app.nu - Todo application in Nuba

class TodoItem {
    fun init(self, id, title) {
        self.id       = id
        self.title    = title
        self.done     = false
        self.tags     = []
    }

    fun complete(self) {
        self.done = true
        return self
    }

    fun add_tag(self, tag) {
        push(self.tags, tag)
        return self
    }

    fun display(self) {
        let status = "✓" if self.done else "○"
        let tags = ""
        if len(self.tags) > 0 { tags = " [" + join(self.tags, ", ") + "]" }
        print(format("  {0} #{1}: {2}{3}", status, self.id, self.title, tags))
    }
}

class TodoList {
    fun init(self, name) {
        self.name  = name
        self.items = []
        self._next_id = 1
    }

    fun add(self, title) {
        let item = new TodoItem(self._next_id, title)
        push(self.items, item)
        self._next_id += 1
        return item
    }

    fun get(self, id) {
        for item in self.items {
            if item.id == id { return item }
        }
        return null
    }

    fun complete(self, id) {
        let item = self.get(id)
        if item == null {
            print("Item #" + str(id) + " not found")
            return
        }
        item.complete()
        print("Completed: " + item.title)
    }

    fun remove(self, id) {
        let new_items = filter(fun(t) -> t.id != id, self.items)
        self.items = new_items
        print("Removed item #" + str(id))
    }

    fun show(self) {
        print("\n=== " + self.name + " ===")
        let pending   = filter(fun(t) -> not t.done, self.items)
        let completed = filter(fun(t) -> t.done,     self.items)

        print("Pending (" + str(len(pending)) + "):")
        for item in pending { item.display() }

        print("Completed (" + str(len(completed)) + "):")
        for item in completed { item.display() }
    }

    fun stats(self) {
        let total = len(self.items)
        let done  = len(filter(fun(t) -> t.done, self.items))
        let pct   = 0
        if total > 0 { pct = round(done * 100 / total, 0) }
        print(format("\nProgress: {0}/{1} ({2}%)", done, total, pct))
    }
}

# Run the app
let todo = new TodoList("My Todo List")

let t1 = todo.add("Learn Nuba programming language")
let t2 = todo.add("Build a web application")
let t3 = todo.add("Write unit tests")
let t4 = todo.add("Read documentation")
let t5 = todo.add("Deploy to production")

t1.add_tag("learning").add_tag("nuba")
t2.add_tag("dev").add_tag("web")
t3.add_tag("dev").add_tag("quality")

todo.complete(1)
todo.complete(4)

todo.show()
todo.stats()

todo.remove(5)
todo.show()
todo.stats()
