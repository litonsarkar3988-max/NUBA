# examples/guess_game.nu - Number guessing game in Nuba
# This is a non-interactive demo version

fun play_guess_game(secret, guesses) {
    print("=== Number Guessing Game ===")
    print("Secret number: " + str(secret))
    print("---")

    let attempts = 0
    let won = false

    for guess in guesses {
        attempts += 1
        print("Guess #" + str(attempts) + ": " + str(guess))

        if guess == secret {
            print("🎉 Correct! You got it in " + str(attempts) + " attempts!")
            won = true
            break
        } elif guess < secret {
            print("  Too low!")
        } else {
            print("  Too high!")
        }
    }

    if not won {
        print("Game over! The number was " + str(secret))
    }
    return attempts
}

# Simulate a binary-search strategy
fun binary_search_strategy(target, lo, hi) {
    let guesses = []
    while lo <= hi {
        let mid = floor((lo + hi) / 2)
        push(guesses, mid)
        if mid == target { break }
        elif mid < target { lo = mid + 1 }
        else { hi = mid - 1 }
    }
    return guesses
}

let secret = 73
let strategy = binary_search_strategy(secret, 1, 100)
print("Strategy guesses:", strategy)
play_guess_game(secret, strategy)

print()

# Word guessing game (Wordle-like hint)
fun check_word(guess, target) {
    let result = []
    for i in 0..len(target) {
        let gc = substr(guess, i, i+1)
        let tc = substr(target, i, i+1)
        if gc == tc {
            push(result, "🟩")
        } elif contains(target, gc) {
            push(result, "🟨")
        } else {
            push(result, "⬜")
        }
    }
    return join(result, "")
}

print("=== Word Guessing Demo ===")
let target_word = "crane"
let word_guesses = ["slate", "probe", "crane"]

for wg in word_guesses {
    let feedback = check_word(wg, target_word)
    print(wg, "->", feedback)
    if wg == target_word {
        print("🎉 Got it!")
        break
    }
}
