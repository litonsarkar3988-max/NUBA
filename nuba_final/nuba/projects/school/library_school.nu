# School: Library System
class Book {
    fun init(self, isbn, title, author, copies) {
        self.isbn      = isbn
        self.title     = title
        self.author    = author
        self.copies    = copies
        self.available = copies
    }
    fun borrow(self) {
        if self.available == 0 { throw "No copies of '" + self.title + "' available" }
        self.available -= 1
    }
    fun return_book(self) { self.available += 1 }
    fun info(self) {
        return format("[{0}] '{1}' by {2} ({3}/{4})",
            self.isbn, self.title, self.author, self.available, self.copies)
    }
}
class SchoolLibrary {
    fun init(self) { self.books={}; self.loans=[] }
    fun add_book(self, book) { self.books[book.isbn] = book }
    fun borrow(self, student_id, isbn, due_date) {
        if not has(self.books, isbn) { throw "Book not found" }
        self.books[isbn].borrow()
        push(self.loans, {"student":student_id,"isbn":isbn,"due":due_date,"returned":false})
        print(student_id, "borrowed:", self.books[isbn].title, "| Due:", due_date)
    }
    fun return_book(self, student_id, isbn) {
        self.books[isbn].return_book()
        for loan in self.loans {
            if loan["student"]==student_id and loan["isbn"]==isbn and not loan["returned"] {
                loan["returned"] = true
                break
            }
        }
        print(student_id, "returned:", self.books[isbn].title)
    }
    fun catalog(self) {
        print("=== Library Catalog ===")
        for pair in items(self.books) { print(" ", pair[1].info()) }
    }
}
let lib = new SchoolLibrary()
lib.add_book(new Book("978-1","Algebra Basics","Dr. Math",5))
lib.add_book(new Book("978-2","World History","Prof. Past",3))
lib.add_book(new Book("978-3","Python Programming","Jane Coder",4))
lib.borrow("S001","978-1","2024-02-15")
lib.borrow("S002","978-2","2024-02-20")
lib.return_book("S001","978-1")
lib.catalog()
