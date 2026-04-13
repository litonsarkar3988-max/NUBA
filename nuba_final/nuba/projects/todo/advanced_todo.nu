# Project: Advanced Todo with Priorities and Tags
class Todo {
    fun init(self, id, title, priority, due_date) {
        self.id       = id
        self.title    = title
        self.priority = priority
        self.due_date = due_date
        self.done     = false
        self.tags     = []
        self.notes    = ""
    }
    fun tag(self, t) { push(self.tags, t); return self }
    fun note(self, n) { self.notes = n; return self }
    fun complete(self) { self.done = true; return self }
    fun display(self) {
        let status = "✓" if self.done else "○"
        let tags   = "[" + join(self.tags, ",") + "]" if len(self.tags)>0 else ""
        print(format("  {0} #{1} [{2}] {3} {4} due:{5}",
                     status, self.id, self.priority, self.title, tags, self.due_date))
        if len(self.notes) > 0 { print("      Note:", self.notes) }
    }
}
class TodoManager {
    fun init(self) { self.todos = []; self._id = 1 }
    fun add(self, title, priority, due_date) {
        let t = new Todo(self._id, title, priority, due_date)
        push(self.todos, t)
        self._id += 1
        return t
    }
    fun by_priority(self, p) {
        return filter(fun(t) -> t.priority == p, self.todos)
    }
    fun by_tag(self, tag) {
        return filter(fun(t) -> t.tags.contains(tag), self.todos)
    }
    fun pending(self) {
        return filter(fun(t) -> not t.done, self.todos)
    }
    fun show_all(self) {
        print("=== All Tasks ===")
        for t in self.todos { t.display() }
        let done  = len(filter(fun(t) -> t.done,      self.todos))
        let total = len(self.todos)
        print(format("Progress: {0}/{1} complete", done, total))
    }
}
let tm = new TodoManager()
tm.add("Design Nuba stdlib", "HIGH", "2024-02-01").tag("dev").tag("nuba")
tm.add("Write documentation", "MEDIUM", "2024-02-15").tag("docs")
tm.add("Add more examples", "LOW", "2024-03-01").tag("examples").note("50+ examples needed")
tm.add("Performance testing", "HIGH", "2024-02-10").tag("dev").tag("testing")
tm.add("Release v1.1", "HIGH", "2024-03-15").tag("release")
tm.todos[0].complete()
tm.todos[3].complete()
tm.show_all()
print()
print("HIGH priority tasks:")
for t in tm.by_priority("HIGH") { t.display() }
print()
print("dev tagged tasks:")
for t in tm.by_tag("dev") { t.display() }
