# Restaurant: Menu System
class MenuItem {
    fun init(self, id, name, category, price, prep_time, vegetarian) {
        self.id          = id
        self.name        = name
        self.category    = category
        self.price       = price
        self.prep_time   = prep_time
        self.vegetarian  = vegetarian
        self.available   = true
        self.rating      = 0
        self.order_count = 0
    }
    fun display(self) {
        let veg = "🌱" if self.vegetarian else "🍖"
        let avail = "" if self.available else " [UNAVAILABLE]"
        print(format("  [{0}] {1} {2} - ${3} ({4} min){5}",
            self.id, veg, self.name, self.price, self.prep_time, avail))
    }
}
class Menu {
    fun init(self) { self.items = {}; self.categories = {} }
    fun add(self, item) {
        self.items[item.id] = item
        if not has(self.categories, item.category) { self.categories[item.category] = [] }
        push(self.categories[item.category], item.id)
        return self
    }
    fun get(self, id) {
        if not has(self.items, id) { throw "Item not found: " + id }
        return self.items[id]
    }
    fun by_category(self, cat) {
        if not has(self.categories, cat) { return [] }
        return map(fun(id)->self.items[id], self.categories[cat])
    }
    fun vegetarian_only(self) {
        return filter(fun(i)->i.vegetarian and i.available, values(self.items))
    }
    fun under_price(self, max_price) {
        return filter(fun(i)->i.price<=max_price and i.available, values(self.items))
    }
    fun display_all(self) {
        print("=== Restaurant Menu ===")
        for cat in keys(self.categories) {
            print("\n" + cat + ":")
            for item in self.by_category(cat) { item.display() }
        }
    }
}
let menu = new Menu()
menu.add(new MenuItem("A01","Caesar Salad","Appetizer",8.99,10,true))
menu.add(new MenuItem("A02","Chicken Wings","Appetizer",12.99,20,false))
menu.add(new MenuItem("M01","Margherita Pizza","Main",14.99,25,true))
menu.add(new MenuItem("M02","Grilled Salmon","Main",22.99,30,false))
menu.add(new MenuItem("M03","Pasta Carbonara","Main",16.99,20,false))
menu.add(new MenuItem("D01","Chocolate Cake","Dessert",6.99,5,true))
menu.add(new MenuItem("D02","Ice Cream","Dessert",4.99,2,true))
menu.display_all()
print("\nVegetarian options:")
for item in menu.vegetarian_only() { item.display() }
