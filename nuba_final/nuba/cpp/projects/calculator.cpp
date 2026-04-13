// C++ Project: Calculator
// Project: Calculator (C++)
#include <iostream>
#include <string>
#include <stack>
#include <stdexcept>
using namespace std;

class Calculator {
public:
    double evaluate(const string& expr) {
        stack<double> nums;
        stack<char>   ops;

        auto apply = [&]() {
            double b = nums.top(); nums.pop();
            double a = nums.top(); nums.pop();
            char op = ops.top(); ops.pop();
            switch (op) {
                case '+': nums.push(a + b); break;
                case '-': nums.push(a - b); break;
                case '*': nums.push(a * b); break;
                case '/':
                    if (b == 0) throw runtime_error("Division by zero");
                    nums.push(a / b);
                    break;
            }
        };

        auto precedence = [](char op) -> int {
            if (op == '+' || op == '-') return 1;
            if (op == '*' || op == '/') return 2;
            return 0;
        };

        for (int i = 0; i < (int)expr.size(); i++) {
            char c = expr[i];
            if (c == ' ') continue;
            if (isdigit(c) || c == '.') {
                string num;
                while (i < (int)expr.size() && (isdigit(expr[i]) || expr[i] == '.'))
                    num += expr[i++];
                i--;
                nums.push(stod(num));
            } else if (c == '(') {
                ops.push(c);
            } else if (c == ')') {
                while (!ops.empty() && ops.top() != '(') apply();
                if (!ops.empty()) ops.pop();
            } else if (c == '+' || c == '-' || c == '*' || c == '/') {
                while (!ops.empty() && precedence(ops.top()) >= precedence(c))
                    apply();
                ops.push(c);
            }
        }
        while (!ops.empty()) apply();
        return nums.top();
    }
};

int main() {
    Calculator calc;
    vector<string> expressions = {
        "2 + 3", "10 - 4 * 2", "(10 - 4) * 2",
        "100 / 4 + 3 * 5", "2.5 + 3.5 * 2"
    };
    for (const auto& e : expressions) {
        try {
            cout << e << " = " << calc.evaluate(e) << endl;
        } catch (const exception& ex) {
            cout << e << " ERROR: " << ex.what() << endl;
        }
    }
    return 0;
}
