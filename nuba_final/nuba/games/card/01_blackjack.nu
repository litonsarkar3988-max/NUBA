# Game: Blackjack Card Game


class Card {
    fun init(self, suit, rank) {
        self.suit = suit
        self.rank = rank
    }
    fun value(self) {
        if self.rank == "A" { return 11 }
        if self.rank == "K" or self.rank == "Q" or self.rank == "J" { return 10 }
        return int(self.rank)
    }
    fun display(self) { return self.rank + self.suit }
}
class Deck {
    fun init(self) {
        self.cards = []
        let suits = ["♠","♥","♦","♣"]
        let ranks = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
        for s in suits { for r in ranks { push(self.cards, new Card(s,r)) } }
        shuffle(self.cards)
    }
    fun deal(self) {
        if len(self.cards) == 0 { throw "Deck empty" }
        return pop(self.cards)
    }
}
class BlackjackHand {
    fun init(self, name) { self.name=name; self.cards=[] }
    fun add(self, card) { push(self.cards, card) }
    fun total(self) {
        let t = sum(map(fun(c)->c.value(), self.cards))
        let aces = len(filter(fun(c)->c.rank=="A", self.cards))
        while t > 21 and aces > 0 { t -= 10; aces -= 1 }
        return t
    }
    fun is_bust(self) { return self.total() > 21 }
    fun display(self) {
        let cards = join(map(fun(c)->c.display(), self.cards), " ")
        print(format("{0}: [{1}] = {2}", self.name, cards, self.total()))
    }
}
let deck   = new Deck()
let player = new BlackjackHand("Player")
let dealer = new BlackjackHand("Dealer")
player.add(deck.deal()); dealer.add(deck.deal())
player.add(deck.deal()); dealer.add(deck.deal())
player.display()
dealer.display()
if player.total() > dealer.total() and not player.is_bust() {
    print("Player wins!")
} elif dealer.total() > player.total() and not dealer.is_bust() {
    print("Dealer wins!")
} else {
    print("Push (tie)!")
}
