# Mini Project Tutorial: Password Generator

print("=== Password Generator ===")
let charset_lower = "abcdefghijklmnopqrstuvwxyz"
let charset_upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
let charset_digits = "0123456789"
let charset_symbols = "!@#$%^&*()_+-=[]{}|;:,.<>?"

fun generate_password(length, use_upper, use_digits, use_symbols) {
    let charset = charset_lower.chars()
    if use_upper   { for c in charset_upper.chars()   { push(charset,c) } }
    if use_digits  { for c in charset_digits.chars()  { push(charset,c) } }
    if use_symbols { for c in charset_symbols.chars() { push(charset,c) } }
    let password = ""
    for i in 0..length { password += choice(charset) }
    return password
}

fun password_strength(pwd) {
    let score = 0
    let has_lower  = len(filter(fun(c)->ord(c)>=97 and ord(c)<=122, pwd.chars())) > 0
    let has_upper  = len(filter(fun(c)->ord(c)>=65 and ord(c)<=90,  pwd.chars())) > 0
    let has_digit  = len(filter(fun(c)->ord(c)>=48 and ord(c)<=57,  pwd.chars())) > 0
    let has_symbol = len(filter(fun(c)->not ((ord(c)>=48 and ord(c)<=57) or (ord(c)>=65 and ord(c)<=90) or (ord(c)>=97 and ord(c)<=122)), pwd.chars())) > 0
    if has_lower  { score += 1 }
    if has_upper  { score += 1 }
    if has_digit  { score += 1 }
    if has_symbol { score += 1 }
    if len(pwd) >= 12 { score += 1 }
    if len(pwd) >= 16 { score += 1 }
    if score <= 2 { return "Weak" }
    elif score <= 4 { return "Medium" }
    else { return "Strong" }
}

for i in 0..5 {
    let pwd = generate_password(16, true, true, true)
    print(format("Password {0}: {1} [{2}]", i+1, pwd, password_strength(pwd)))
}
