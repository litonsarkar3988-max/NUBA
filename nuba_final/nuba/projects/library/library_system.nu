# Project: Library Management System
class Book {
    fun init(self, isbn, title, author, copies) {
        self.isbn      = isbn
        self.title     = title
        self.author    = author
        self.copies    = copies
        self.available = copies
    }
    fun checkout(self) {
        if self.available == 0 { throw "No copies available for: " + self.title }
        self.available -= 1
    }
    fun return_book(self) {
        if self.available >= self.copies { throw "All copies already returned" }
        self.available += 1
    }
    fun info(self) {
        return format("[{0}] '{1}' by {2} ({3}/{4} available)",
                      self.isbn, self.title, self.author, self.available, self.copies)
    }
}
class Library {
    fun init(self, name) {
        self.name    = name
        self.books   = {}
        self.members = {}
        self.loans   = []
    }
    fun add_book(self, book) {
        self.books[book.isbn] = book
        print("Added:", book.info())
    }
    fun register_member(self, id, name) {
        self.members[id] = {"name": name, "loans": []}
        print("Registered member:", name, "("+id+")")
    }
    fun checkout(self, member_id, isbn) {
        if not has(self.books, isbn) { throw "Book not found: " + isbn }
        if not has(self.members, member_id) { throw "Member not found: " + member_id }
        self.books[isbn].checkout()
        push(self.loans, {"member": member_id, "isbn": isbn})
        push(self.members[member_id]["loans"], isbn)
        print(self.members[member_id]["name"], "checked out:", self.books[isbn].title)
    }
    fun return_book(self, member_id, isbn) {
        self.books[isbn].return_book()
        self.loans = filter(fun(l) -> not (l["member"]==member_id and l["isbn"]==isbn), self.loans)
        print(self.members[member_id]["name"], "returned:", self.books[isbn].title)
    }
    fun catalog(self) {
        print("=== " + self.name + " Catalog ===")
        for pair in items(self.books) { print(" ", pair[1].info()) }
    }
}
let lib = new Library("Nuba Public Library")
lib.add_book(new Book("978-001", "Nuba Programming", "Jane Doe", 3))
lib.add_book(new Book("978-002", "Data Structures", "John Smith", 2))
lib.add_book(new Book("978-003", "Algorithms", "Alice Brown", 1))
lib.register_member("M001", "Alice")
lib.register_member("M002", "Bob")
lib.checkout("M001", "978-001")
lib.checkout("M002", "978-002")
lib.checkout("M001", "978-003")
print()
lib.catalog()
print()
lib.return_book("M001", "978-001")
lib.catalog()
