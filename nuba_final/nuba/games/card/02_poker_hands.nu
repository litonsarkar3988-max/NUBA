# Game: Poker Hand Evaluator


fun card_value(card) {
    let values = {"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9,"10":10,"J":11,"Q":12,"K":13,"A":14}
    return values[substr(card,0,len(card)-1)]
}
fun card_suit(card) { return substr(card, len(card)-1, len(card)) }
fun hand_rank(hand) {
    let values = sorted(map(fun(c)->card_value(c), hand), true)
    let suits  = map(fun(c)->card_suit(c), hand)
    let freq = {}
    for v in values {
        let k=str(v)
        if has(freq,k) { freq[k]+=1 } else { freq[k]=1 }
    }
    let counts = sorted(values(freq), true)
    let is_flush    = len(filter(fun(s)->s==suits[0], suits)) == 5
    let is_straight = values[0] - values[4] == 4 and len(freq) == 5
    if is_straight and is_flush { return [8, "Straight Flush"] }
    if counts[0] == 4           { return [7, "Four of a Kind"] }
    if counts[0]==3 and counts[1]==2 { return [6, "Full House"] }
    if is_flush                 { return [5, "Flush"] }
    if is_straight              { return [4, "Straight"] }
    if counts[0] == 3           { return [3, "Three of a Kind"] }
    if counts[0]==2 and counts[1]==2 { return [2, "Two Pair"] }
    if counts[0] == 2           { return [1, "One Pair"] }
    return [0, "High Card"]
}
let hands = [
    ["A♠","K♠","Q♠","J♠","10♠"],
    ["K♥","K♦","K♣","A♥","A♦"],
    ["Q♠","Q♥","Q♦","J♠","J♥"],
    ["7♠","8♠","9♠","10♠","J♠"],
    ["2♥","4♥","6♥","8♥","10♥"],
    ["A♠","A♥","A♦","K♠","Q♥"],
    ["3♣","3♦","5♠","5♥","9♣"],
    ["J♠","J♥","2♣","7♦","9♠"],
    ["2♠","5♥","7♣","9♦","K♠"]
]
for hand in hands {
    let rank = hand_rank(hand)
    print(format("{0}: {1}", join(hand," "), rank[1]))
}
