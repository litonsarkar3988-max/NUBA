# Mini Project Tutorial: Config File Parser

print("=== Config File Parser ===")

fun parse_config(text) {
    let config   = {}
    let section  = "default"
    config[section] = {}
    for raw_line in split(text, "\n") {
        let line = trim(raw_line)
        if len(line) == 0 or startswith(line, "#") { continue }
        if startswith(line, "[") and endswith(line, "]") {
            section = substr(line, 1, len(line)-1)
            config[section] = {}
        } elif contains(line, "=") {
            let idx  = indexOf(line, "=")
            let key  = trim(substr(line, 0, idx))
            let val  = trim(substr(line, idx+1, len(line)))
            if val == "true"  { val = true  }
            elif val == "false" { val = false }
            elif isInt(val)   { val = int(val) }
            elif isFloat(val) { val = float(val) }
            config[section][key] = val
        }
    }
    return config
}

fun get_config(cfg, section, key, default_val) {
    if has(cfg, section) and has(cfg[section], key) {
        return cfg[section][key]
    }
    return default_val
}

let config_text = "
[database]
host = localhost
port = 5432
name = myapp
ssl  = true

[server]
host    = 0.0.0.0
port    = 8080
debug   = false
workers = 4

[cache]
enabled = true
ttl     = 3600
"

let cfg = parse_config(config_text)
print("DB host:", get_config(cfg, "database", "host", "localhost"))
print("DB port:", get_config(cfg, "database", "port", 5432))
print("Server workers:", get_config(cfg, "server", "workers", 1))
print("Cache TTL:", get_config(cfg, "cache", "ttl", 300))
print("Missing key:", get_config(cfg, "email", "smtp", "not set"))
