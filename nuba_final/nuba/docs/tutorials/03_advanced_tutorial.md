# Advanced Tutorial: Build a Mini Interpreter

In this tutorial we'll build a simple expression interpreter.

## Concepts Covered
- Lexing (tokenization)
- Parsing (building AST)
- Evaluation (tree walking)
- Variables and scope
- Functions

## Step 1: Tokenizer

```nuba
fun tokenize(expr) {
    let tokens = []
    let i = 0
    let s = trim(expr)
    while i < len(s) {
        let ch = substr(s, i, i+1)
        if ch == " " { i += 1; continue }
        if ch >= "0" and ch <= "9" {
            let num = ""
            while i < len(s) and substr(s,i,i+1) >= "0" and substr(s,i,i+1) <= "9" {
                num += substr(s,i,i+1); i += 1
            }
            push(tokens, {"type":"NUM","val":int(num)})
        } elif ch == "+" { push(tokens, {"type":"PLUS","val":"+"}); i += 1 }
        elif ch == "-" { push(tokens, {"type":"MINUS","val":"-"}); i += 1 }
        elif ch == "*" { push(tokens, {"type":"STAR","val":"*"}); i += 1 }
        elif ch == "/" { push(tokens, {"type":"SLASH","val":"/"}); i += 1 }
        elif ch == "(" { push(tokens, {"type":"LPAREN","val":"("}); i += 1 }
        elif ch == ")" { push(tokens, {"type":"RPAREN","val":")"}); i += 1 }
        else { i += 1 }
    }
    push(tokens, {"type":"EOF","val":null})
    return tokens
}
```

## Step 2: Parser + Evaluator

```nuba
class MiniInterp {
    fun init(self) { self.pos = 0; self.tokens = [] }
    fun parse_eval(self, expr) {
        self.tokens = tokenize(expr)
        self.pos = 0
        return self.expr()
    }
    fun cur(self) { return self.tokens[self.pos] }
    fun eat(self)  { let t = self.tokens[self.pos]; self.pos += 1; return t }
    fun expr(self) {
        let val = self.term()
        while self.cur()["type"] == "PLUS" or self.cur()["type"] == "MINUS" {
            if self.cur()["type"] == "PLUS" { self.eat(); val += self.term() }
            else { self.eat(); val -= self.term() }
        }
        return val
    }
    fun term(self) {
        let val = self.factor()
        while self.cur()["type"] == "STAR" or self.cur()["type"] == "SLASH" {
            if self.cur()["type"] == "STAR" { self.eat(); val *= self.factor() }
            else { self.eat(); val /= self.factor() }
        }
        return val
    }
    fun factor(self) {
        if self.cur()["type"] == "NUM" { return self.eat()["val"] }
        if self.cur()["type"] == "LPAREN" {
            self.eat()
            let val = self.expr()
            self.eat()
            return val
        }
        return 0
    }
}

let interp = new MiniInterp()
let expressions = ["2 + 3", "10 - 4 * 2", "(10 - 4) * 2", "100 / 4 + 3 * 5"]
for e in expressions {
    print(e, "=", interp.parse_eval(e))
}
```
