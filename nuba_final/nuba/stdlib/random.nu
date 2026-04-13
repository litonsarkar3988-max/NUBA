# stdlib/random.nu - Random utilities for Nuba

fun coin_flip() {
    return choice(["heads", "tails"])
}

fun dice_roll(sides) {
    return randint(1, sides)
}

fun sample(lst, n) {
    let copy = lst.copy()
    shuffle(copy)
    let result = []
    let i = 0
    while i < n and i < len(copy) {
        push(result, copy[i])
        i += 1
    }
    return result
}

fun weighted_choice(items, weights) {
    let total = sum(weights)
    let r = random() * total
    let cumulative = 0
    let i = 0
    for w in weights {
        cumulative += w
        if r <= cumulative { return items[i] }
        i += 1
    }
    return items[len(items) - 1]
}

fun random_string(length) {
    let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let chars_list = chars.chars()
    let result = ""
    let i = 0
    while i < length {
        result += choice(chars_list)
        i += 1
    }
    return result
}

fun random_int_list(n, lo, hi) {
    let result = []
    let i = 0
    while i < n {
        push(result, randint(lo, hi))
        i += 1
    }
    return result
}

fun random_float_list(n) {
    let result = []
    let i = 0
    while i < n {
        push(result, random())
        i += 1
    }
    return result
}
