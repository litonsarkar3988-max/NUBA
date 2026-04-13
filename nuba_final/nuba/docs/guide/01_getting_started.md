# Getting Started with Nuba

## Installation

Nuba requires Python 3.8+. No external dependencies.

```bash
unzip nuba.zip
cd nuba
python nuba_cli.py --version
```

## Your First Program

Create `hello.nu`:
```nuba
print("Hello, World!")
```

Run it:
```bash
python nuba_cli.py hello.nu
```

## Interactive REPL

```bash
python nuba_cli.py
nuba> let x = 42
nuba> print(x * 2)
84
```

## Running Examples

```bash
python nuba_cli.py examples/my.nu
python nuba_cli.py examples/fizzbuzz.nu
python nuba_cli.py exercises/beginner/01_hello_world.nu
```
