# examples/expr_eval.nu - Expression evaluator (calculator with variables)

class ExprEval {
    fun init(self) {
        self.vars = {}
    }

    fun set_var(self, name, val) {
        self.vars[name] = val
    }

    fun get_var(self, name) {
        if has(self.vars, name) { return self.vars[name] }
        throw "Undefined variable: " + name
    }

    # Simple tokenizer
    fun tokenize(self, expr) {
        let tokens = []
        let i = 0
        let s = trim(expr)
        while i < len(s) {
            let ch = substr(s, i, i+1)
            if ch == " " {
                i += 1
                continue
            }
            if ch >= "0" and ch <= "9" {
                let num = ""
                while i < len(s) and ((substr(s, i, i+1) >= "0" and substr(s, i, i+1) <= "9") or substr(s, i, i+1) == ".") {
                    num += substr(s, i, i+1)
                    i += 1
                }
                push(tokens, {"type": "NUM", "val": float(num)})
                continue
            }
            if (ch >= "a" and ch <= "z") or (ch >= "A" and ch <= "Z") {
                let word = ""
                while i < len(s) and ((substr(s, i, i+1) >= "a" and substr(s, i, i+1) <= "z") or (substr(s, i, i+1) >= "A" and substr(s, i, i+1) <= "Z")) {
                    word += substr(s, i, i+1)
                    i += 1
                }
                push(tokens, {"type": "VAR", "val": word})
                continue
            }
            push(tokens, {"type": "OP", "val": ch})
            i += 1
        }
        push(tokens, {"type": "EOF", "val": null})
        return tokens
    }

    fun eval_expr(self, expr) {
        self._tokens = self.tokenize(expr)
        self._pos = 0
        return self._parse_add()
    }

    fun _cur(self) { return self._tokens[self._pos] }
    fun _eat(self)  {
        let t = self._tokens[self._pos]
        self._pos += 1
        return t
    }

    fun _parse_add(self) {
        let left = self._parse_mul()
        while self._cur()["type"] == "OP" and (self._cur()["val"] == "+" or self._cur()["val"] == "-") {
            let op = self._eat()["val"]
            let right = self._parse_mul()
            if op == "+" { left = left + right }
            else         { left = left - right }
        }
        return left
    }

    fun _parse_mul(self) {
        let left = self._parse_unary()
        while self._cur()["type"] == "OP" and (self._cur()["val"] == "*" or self._cur()["val"] == "/") {
            let op = self._eat()["val"]
            let right = self._parse_unary()
            if op == "*" { left = left * right }
            elif right == 0 { throw "Division by zero" }
            else { left = left / right }
        }
        return left
    }

    fun _parse_unary(self) {
        if self._cur()["type"] == "OP" and self._cur()["val"] == "-" {
            self._eat()
            return -self._parse_primary()
        }
        return self._parse_primary()
    }

    fun _parse_primary(self) {
        let tok = self._cur()
        if tok["type"] == "NUM" {
            self._eat()
            return tok["val"]
        }
        if tok["type"] == "VAR" {
            self._eat()
            return self.get_var(tok["val"])
        }
        if tok["type"] == "OP" and tok["val"] == "(" {
            self._eat()
            let val = self._parse_add()
            if self._cur()["val"] != ")" { throw "Expected )" }
            self._eat()
            return val
        }
        throw "Unexpected token: " + str(tok["val"])
    }
}

let calc = new ExprEval()
calc.set_var("x", 10)
calc.set_var("y", 5)
calc.set_var("pi", 3.14159)

let expressions = [
    "2 + 3",
    "10 - 4 * 2",
    "(10 - 4) * 2",
    "x + y",
    "x * y - 3",
    "(x + y) / 3",
    "pi * 2",
    "100 / 4 + x * y"
]

print("=== Expression Evaluator ===")
for expr in expressions {
    try {
        let result = calc.eval_expr(expr)
        print(expr, "=", round(result, 4))
    } catch (err) {
        print(expr, "ERROR:", err)
    }
}
