# E-Commerce: Payment System
class PaymentMethod {
    fun init(self, name) { self.name = name }
    fun charge(self, amount) {
        print("Charging $" + str(amount) + " via " + self.name)
        return {"success":true,"amount":amount,"method":self.name,"txn":"TXN"+str(randint(100000,999999))}
    }
}
class CreditCard(PaymentMethod) {
    fun init(self, number, holder, expiry) {
        super.init("Credit Card")
        self.last4  = substr(number, len(number)-4, len(number))
        self.holder = holder
        self.expiry = expiry
    }
    fun charge(self, amount) {
        print(format("Charging ${0} to card ending {1} ({2})", amount, self.last4, self.holder))
        return {"success":true,"amount":amount,"method":"credit_card","last4":self.last4}
    }
}
class PayPal(PaymentMethod) {
    fun init(self, email) {
        super.init("PayPal")
        self.email = email
    }
    fun charge(self, amount) {
        print("Charging $" + str(amount) + " via PayPal to " + self.email)
        return {"success":true,"amount":amount,"method":"paypal","email":self.email}
    }
}
class CryptoWallet(PaymentMethod) {
    fun init(self, address, coin) {
        super.init("Crypto")
        self.address = address
        self.coin    = coin
    }
    fun charge(self, amount) {
        let crypto_amount = round(amount / 40000, 6)
        print("Charging " + str(crypto_amount) + " " + self.coin + " to " + self.address)
        return {"success":true,"amount":amount,"method":"crypto","coin":self.coin}
    }
}

let card   = new CreditCard("4532015112830366","Alice Smith","12/26")
let paypal = new PayPal("alice@example.com")
let btc    = new CryptoWallet("1A1zP1eP5QGefi2DMPTfTL5SLmv7Divf","BTC")

for pm in [card, paypal, btc] {
    let result = pm.charge(99.99)
    print("Result:", result["success"], result["method"])
    print()
}
