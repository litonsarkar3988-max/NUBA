# Project: Chat Room System
class Message {
    fun init(self, sender, content, timestamp) {
        self.sender    = sender
        self.content   = content
        self.timestamp = timestamp
    }
    fun display(self) {
        print(format("[{0}] {1}: {2}", self.timestamp, self.sender, self.content))
    }
}
class ChatRoom {
    fun init(self, name) {
        self.name     = name
        self.members  = []
        self.messages = []
        self.banned   = []
    }
    fun join(self, user) {
        if self.banned.contains(user) { throw user + " is banned" }
        if not self.members.contains(user) {
            push(self.members, user)
            self.broadcast("System", user + " joined the room")
        }
    }
    fun leave(self, user) {
        self.members = filter(fun(u) -> u != user, self.members)
        self.broadcast("System", user + " left the room")
    }
    fun ban(self, user) {
        push(self.banned, user)
        self.leave(user)
    }
    fun send(self, sender, content) {
        if not self.members.contains(sender) { throw sender + " is not in room" }
        let msg = new Message(sender, content, str(len(self.messages)+1))
        push(self.messages, msg)
        msg.display()
    }
    fun broadcast(self, sender, content) {
        let msg = new Message(sender, content, str(len(self.messages)+1))
        push(self.messages, msg)
        msg.display()
    }
    fun history(self, n) {
        let start = len(self.messages) - n
        if start < 0 { start = 0 }
        print("--- Last", n, "messages ---")
        for msg in self.messages.slice(start, len(self.messages)) { msg.display() }
    }
    fun stats(self) {
        print(format("Room: {0} | Members: {1} | Messages: {2}",
                     self.name, self.members, len(self.messages)))
    }
}
let room = new ChatRoom("general")
room.join("Alice")
room.join("Bob")
room.join("Carol")
room.send("Alice", "Hello everyone!")
room.send("Bob", "Hey Alice!")
room.send("Carol", "How's it going?")
room.send("Alice", "Great! Working on Nuba projects")
room.send("Bob", "Nuba is awesome!")
room.leave("Carol")
room.stats()
print()
room.history(3)
