# examples/string_builder.nu - String builder and template engine in Nuba

class StringBuilder {
    fun init(self) {
        self._parts = []
    }

    fun append(self, text) {
        push(self._parts, str(text))
        return self
    }

    fun append_line(self, text) {
        push(self._parts, str(text) + "\n")
        return self
    }

    fun prepend(self, text) {
        self._parts = [str(text)] + self._parts
        return self
    }

    fun build(self) {
        return join(self._parts, "")
    }

    fun length(self) {
        return len(self.build())
    }

    fun clear(self) {
        self._parts = []
        return self
    }
}

class Template {
    fun init(self, template_str) {
        self._template = template_str
        self._vars     = {}
    }

    fun set(self, key, value) {
        self._vars[key] = str(value)
        return self
    }

    fun render(self) {
        let result = self._template
        for pair in items(self._vars) {
            result = replace(result, "{{" + pair[0] + "}}", pair[1])
        }
        return result
    }
}

# Demo StringBuilder
print("=== String Builder ===")
let sb = new StringBuilder()
sb.append("Hello")
  .append(", ")
  .append("World")
  .append("!")
print(sb.build())

let html = new StringBuilder()
html.append_line("<!DOCTYPE html>")
    .append_line("<html>")
    .append_line("  <head><title>Nuba Page</title></head>")
    .append_line("  <body>")
    .append_line("    <h1>Hello from Nuba!</h1>")
    .append_line("  </body>")
    .append_line("</html>")
print(html.build())
print("HTML length:", html.length(), "chars")

# Demo Template
print("=== Template Engine ===")
let email_template = new Template(
    "Dear {{name}},\n\n" +
    "Thank you for your order #{{order_id}}.\n" +
    "Your {{item}} will be shipped to {{address}}.\n\n" +
    "Total: ${{total}}\n\n" +
    "Best regards,\nNuba Shop"
)

email_template
    .set("name", "Alice")
    .set("order_id", "ORD-2024-001")
    .set("item", "Nuba Programming Book")
    .set("address", "123 Main St, San Francisco")
    .set("total", "49.99")

print(email_template.render())

# HTML generator using StringBuilder + Template
print("=== HTML Table Generator ===")
fun make_html_table(headers, rows) {
    let sb = new StringBuilder()
    sb.append_line("<table border='1'>")
    sb.append("  <tr>")
    for h in headers {
        sb.append("<th>").append(h).append("</th>")
    }
    sb.append_line("</tr>")
    for row in rows {
        sb.append("  <tr>")
        for cell in row {
            sb.append("<td>").append(cell).append("</td>")
        }
        sb.append_line("</tr>")
    }
    sb.append_line("</table>")
    return sb.build()
}

let headers = ["Name", "Dept", "Salary"]
let data = [
    ["Alice", "Engineering", "$95,000"],
    ["Bob",   "Marketing",   "$72,000"],
    ["Carol", "Engineering", "$105,000"]
]
print(make_html_table(headers, data))
