# examples/linked_list.nu - Linked List implementation in Nuba

class Node {
    fun init(self, data) {
        self.data = data
        self.next = null
    }
}

class LinkedList {
    fun init(self) {
        self.head = null
        self.size = 0
    }

    fun append(self, data) {
        let node = new Node(data)
        if self.head == null {
            self.head = node
        } else {
            let curr = self.head
            while curr.next != null { curr = curr.next }
            curr.next = node
        }
        self.size += 1
    }

    fun prepend(self, data) {
        let node = new Node(data)
        node.next = self.head
        self.head = node
        self.size += 1
    }

    fun delete(self, data) {
        if self.head == null { return }
        if self.head.data == data {
            self.head = self.head.next
            self.size -= 1
            return
        }
        let curr = self.head
        while curr.next != null {
            if curr.next.data == data {
                curr.next = curr.next.next
                self.size -= 1
                return
            }
            curr = curr.next
        }
    }

    fun contains(self, data) {
        let curr = self.head
        while curr != null {
            if curr.data == data { return true }
            curr = curr.next
        }
        return false
    }

    fun to_list(self) {
        let result = []
        let curr = self.head
        while curr != null {
            push(result, curr.data)
            curr = curr.next
        }
        return result
    }

    fun reverse(self) {
        let prev = null
        let curr = self.head
        while curr != null {
            let next = curr.next
            curr.next = prev
            prev = curr
            curr = next
        }
        self.head = prev
    }

    fun print_list(self) {
        print("LinkedList:", self.to_list(), "| size:", self.size)
    }
}

let ll = new LinkedList()
ll.append(1)
ll.append(2)
ll.append(3)
ll.prepend(0)
ll.print_list()

print("Contains 2:", ll.contains(2))
print("Contains 9:", ll.contains(9))

ll.delete(2)
ll.print_list()

ll.reverse()
ll.print_list()
