# AI/ML: Uncertainty Ai

print("=== Uncertainty Ai ===")

class AIModel {
    fun init(self, name, model_type) {
        self.name       = name
        self.model_type = model_type
        self.weights    = []
        self.trained    = false
        self.metrics    = {}
    }

    fun initialize_weights(self, n) {
        self.weights = []
        for i in 0..n { push(self.weights, round((random()-0.5)*0.1, 6)) }
        return self
    }

    fun forward(self, input_data) {
        # Simple linear combination
        let output = 0
        for i in 0..min([len(input_data), len(self.weights)]) {
            output += input_data[i] * self.weights[i]
        }
        # Sigmoid activation
        return 1 / (1 + 2.718 ** (-output))
    }

    fun train(self, X, y, lr, epochs) {
        self.initialize_weights(len(X[0]))
        let losses = []
        for epoch in 0..epochs {
            let total_loss = 0
            for i in 0..len(X) {
                let pred = self.forward(X[i])
                let err  = pred - y[i]
                total_loss += err * err
                # Simple gradient update
                for j in 0..len(self.weights) {
                    if j < len(X[i]) {
                        self.weights[j] -= lr * err * X[i][j]
                    }
                }
            }
            push(losses, round(total_loss/len(X), 6))
        }
        self.trained = true
        self.metrics["final_loss"] = losses[len(losses)-1]
        self.metrics["epochs"]     = epochs
        return losses
    }

    fun predict(self, X) {
        return map(fun(x) -> round(self.forward(x), 4), X)
    }

    fun evaluate(self, X, y) {
        let preds = self.predict(X)
        let correct = 0
        for i in 0..len(preds) {
            if (preds[i] >= 0.5) == bool(y[i]) { correct += 1 }
        }
        let accuracy = round(correct / len(y), 4)
        self.metrics["accuracy"] = accuracy
        return accuracy
    }

    fun info(self) {
        print(format("Model: {0} ({1})", self.name, self.model_type))
        print("Weights:", len(self.weights))
        print("Trained:", self.trained)
        print("Metrics:", self.metrics)
    }
}

# Demo for Uncertainty Ai
let model = new AIModel("Uncertainty Ai", "neural_network")
let X_train = [[0,0],[0,1],[1,0],[1,1]]
let y_train = [0, 1, 1, 0]  # XOR problem

let losses = model.train(X_train, y_train, 0.1, 50)
print("Initial loss:", losses[0])
print("Final loss:", losses[len(losses)-1])

let preds = model.predict(X_train)
print("Predictions:", preds)
let acc = model.evaluate(X_train, y_train)
print("Accuracy:", acc)
model.info()
