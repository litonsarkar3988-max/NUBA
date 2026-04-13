# Mini Project Tutorial: Markdown Generator

print("=== Markdown Generator ===")

class MarkdownDoc {
    fun init(self, title) {
        self.title    = title
        self.sections = []
    }
    fun h1(self, text) { push(self.sections, "# " + text); return self }
    fun h2(self, text) { push(self.sections, "## " + text); return self }
    fun h3(self, text) { push(self.sections, "### " + text); return self }
    fun para(self, text) { push(self.sections, text + "\n"); return self }
    fun bold(self, text) { return "**" + text + "**" }
    fun italic(self, text) { return "*" + text + "*" }
    fun code_block(self, code, lang) {
        push(self.sections, "```" + lang)
        push(self.sections, code)
        push(self.sections, "```")
        return self
    }
    fun bullet_list(self, items) {
        for item in items { push(self.sections, "- " + item) }
        return self
    }
    fun numbered_list(self, items) {
        for i in 0..len(items) {
            push(self.sections, str(i+1) + ". " + items[i])
        }
        return self
    }
    fun table(self, headers, rows) {
        push(self.sections, "| " + join(headers, " | ") + " |")
        push(self.sections, "| " + join(map(fun(h)->"---",headers), " | ") + " |")
        for row in rows {
            push(self.sections, "| " + join(map(fun(c)->str(c),row), " | ") + " |")
        }
        return self
    }
    fun render(self) {
        return join(self.sections, "\n")
    }
}

let doc = new MarkdownDoc("Nuba Language Guide")
doc.h1("Nuba Programming Language")
doc.para("Nuba is a modern, expressive programming language built in Python.")
doc.h2("Features")
doc.bullet_list(["Dynamic typing","First-class functions","Classes & Inheritance","Pattern Matching","70+ builtins"])
doc.h2("Quick Start")
doc.code_block('print("Hello, Nuba!")', "nuba")
doc.h2("Data Types")
doc.table(["Type","Example","Notes"],
    [["int","42","Integer"],["float","3.14","Floating point"],
     ["string",'"hello"',"Text"],["list","[1,2,3]","Array"],
     ["dict",'{"a":1}',"Hash map"]])
print(doc.render())
