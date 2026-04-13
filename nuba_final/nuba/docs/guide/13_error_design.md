# Error Design Patterns

Best practices for error handling in Nuba.

## Never silently swallow errors
```nuba
try {
    risky()
} catch (e) {
    # Log, then re-throw or handle
    print("Error:", e)
    throw e  # re-throw if can't handle
}
```
