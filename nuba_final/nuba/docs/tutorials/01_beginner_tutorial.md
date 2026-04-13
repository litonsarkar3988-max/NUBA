# Beginner Tutorial: Build a Contact Book in Nuba

In this tutorial we'll build a simple contact book.

## Step 1: Create a Contact

```nuba
let contact = {
    "name": "Alice Smith",
    "phone": "555-1234",
    "email": "alice@example.com"
}
print(contact["name"])
```

## Step 2: Contact List

```nuba
let contacts = []

fun add_contact(name, phone, email) {
    push(contacts, {
        "name": name,
        "phone": phone,
        "email": email
    })
}

add_contact("Alice", "555-1234", "alice@example.com")
add_contact("Bob",   "555-5678", "bob@example.com")
```

## Step 3: Search Contacts

```nuba
fun search(query) {
    return filter(
        fun(c) -> contains(lower(c["name"]), lower(query)),
        contacts
    )
}

for c in search("ali") {
    print(c["name"], "-", c["phone"])
}
```

## Step 4: Full Contact Book Class

```nuba
class ContactBook {
    fun init(self) { self.contacts = [] }

    fun add(self, name, phone, email) {
        push(self.contacts, {"name":name,"phone":phone,"email":email})
    }

    fun find(self, query) {
        return filter(
            fun(c) -> contains(lower(c["name"]), lower(query)),
            self.contacts
        )
    }

    fun list_all(self) {
        for c in self.contacts {
            print(format("{0} | {1} | {2}", c["name"], c["phone"], c["email"]))
        }
    }

    fun count(self) { return len(self.contacts) }
}

let book = new ContactBook()
book.add("Alice Smith", "555-1234", "alice@ex.com")
book.add("Bob Jones",   "555-5678", "bob@ex.com")
book.add("Alice Cooper","555-9012", "cooper@ex.com")
book.list_all()
print("\nSearch 'alice':")
for c in book.find("alice") { print(" ", c["name"]) }
```
