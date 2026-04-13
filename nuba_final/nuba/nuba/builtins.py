# nuba/builtins.py - Built-in functions for the Nuba language

import math
import time
import random
import os
import json as _json

from .errors import NubaRuntimeError, NubaTypeError


def _check_type(val, *types, name="argument"):
    if not isinstance(val, types):
        raise NubaTypeError(f"Expected {'/'.join(t.__name__ for t in types)} for {name}, got {type(val).__name__}")


def nuba_len(args, _):
    _check_type(args[0], list, str, dict, name="len()")
    return len(args[0])

def nuba_type(args, _):
    v = args[0]
    if v is None:            return "null"
    if isinstance(v, bool):  return "bool"
    if isinstance(v, int):   return "int"
    if isinstance(v, float): return "float"
    if isinstance(v, str):   return "string"
    if isinstance(v, list):  return "list"
    if isinstance(v, dict):  return "dict"
    return type(v).__name__

def nuba_int(args, _):
    try: return int(args[0])
    except: raise NubaTypeError(f"Cannot convert {args[0]!r} to int")

def nuba_float(args, _):
    try: return float(args[0])
    except: raise NubaTypeError(f"Cannot convert {args[0]!r} to float")

def nuba_str(args, _):
    return nuba_to_string(args[0])

def nuba_bool(args, _):
    return bool(args[0])

def nuba_input(args, _):
    prompt = args[0] if args else ""
    return input(prompt)

def nuba_range(args, _):
    from .values import NubaRange
    if len(args) == 1:
        return NubaRange(0, args[0])
    elif len(args) == 2:
        return NubaRange(args[0], args[1])
    else:
        return NubaRange(args[0], args[1], args[2])

def nuba_list(args, _):
    from .values import NubaRange
    if not args: return []
    v = args[0]
    if isinstance(v, NubaRange): return v.to_list()
    if isinstance(v, (list, tuple)): return list(v)
    if isinstance(v, str): return list(v)
    raise NubaTypeError(f"Cannot convert {type(v).__name__} to list")

def nuba_abs(args, _):
    _check_type(args[0], int, float)
    return abs(args[0])

def nuba_max(args, _):
    if len(args) == 1 and isinstance(args[0], list):
        return max(args[0])
    return max(args)

def nuba_min(args, _):
    if len(args) == 1 and isinstance(args[0], list):
        return min(args[0])
    return min(args)

def nuba_sum(args, _):
    _check_type(args[0], list)
    return sum(args[0])

def nuba_sorted(args, _):
    _check_type(args[0], list)
    rev = args[1] if len(args) > 1 else False
    return sorted(args[0], reverse=bool(rev))

def nuba_reversed(args, _):
    _check_type(args[0], list)
    return list(reversed(args[0]))

def nuba_map(args, _):
    fn, lst = args[0], args[1]
    lst = _to_iterable(lst)
    _check_type(lst, list)
    return [fn.call([item]) for item in lst]

def nuba_filter(args, _):
    fn, lst = args[0], args[1]
    lst = _to_iterable(lst)
    _check_type(lst, list)
    return [item for item in lst if fn.call([item])]

def nuba_reduce(args, _):
    fn, lst = args[0], _to_iterable(args[1])
    init = args[2] if len(args) > 2 else lst[0]
    start = lst if len(args) > 2 else lst[1:]
    acc = init
    for item in start:
        acc = fn.call([acc, item])
    return acc

def nuba_zip(args, _):
    return [list(pair) for pair in zip(*args)]

def nuba_enumerate(args, _):
    lst = args[0]
    start = args[1] if len(args) > 1 else 0
    return [[i+start, v] for i, v in enumerate(lst)]

def nuba_keys(args, _):
    _check_type(args[0], dict)
    return list(args[0].keys())

def nuba_values(args, _):
    _check_type(args[0], dict)
    return list(args[0].values())

def nuba_items(args, _):
    _check_type(args[0], dict)
    return [[k, v] for k, v in args[0].items()]

def nuba_has(args, _):
    return args[1] in args[0]

def nuba_push(args, _):
    _check_type(args[0], list)
    args[0].append(args[1])
    return args[0]

def nuba_pop(args, _):
    _check_type(args[0], list)
    return args[0].pop()

def nuba_insert(args, _):
    _check_type(args[0], list)
    args[0].insert(int(args[1]), args[2])
    return args[0]

def nuba_remove(args, _):
    _check_type(args[0], list)
    args[0].remove(args[1])
    return args[0]

def nuba_join(args, _):
    sep = args[1] if len(args) > 1 else ""
    return sep.join(str(x) for x in args[0])

def nuba_split(args, _):
    _check_type(args[0], str)
    sep = args[1] if len(args) > 1 else None
    return args[0].split(sep)

def nuba_trim(args, _):
    _check_type(args[0], str)
    return args[0].strip()

def nuba_upper(args, _):
    _check_type(args[0], str)
    return args[0].upper()

def nuba_lower(args, _):
    _check_type(args[0], str)
    return args[0].lower()

def nuba_replace(args, _):
    _check_type(args[0], str)
    return args[0].replace(args[1], args[2])

def nuba_startswith(args, _):
    return str(args[0]).startswith(str(args[1]))

def nuba_endswith(args, _):
    return str(args[0]).endswith(str(args[1]))

def nuba_contains(args, _):
    return str(args[1]) in str(args[0])

def nuba_index_of(args, _):
    try: return args[0].index(args[1])
    except ValueError: return -1

def nuba_substr(args, _):
    s = args[0]
    start = int(args[1]) if len(args) > 1 else 0
    end = int(args[2]) if len(args) > 2 else len(s)
    return s[start:end]

def nuba_char(args, _):
    return chr(int(args[0]))

def nuba_ord(args, _):
    return ord(str(args[0])[0])

def nuba_format(args, _):
    fmt = args[0]
    rest = args[1:]
    for i, val in enumerate(rest):
        fmt = fmt.replace(f"{{{i}}}", nuba_to_string(val))
    return fmt

def nuba_sqrt(args, _):
    return math.sqrt(float(args[0]))

def nuba_floor(args, _):
    return math.floor(float(args[0]))

def nuba_ceil(args, _):
    return math.ceil(float(args[0]))

def nuba_round(args, _):
    digits = int(args[1]) if len(args) > 1 else 0
    return round(float(args[0]), digits)

def nuba_pow(args, _):
    return args[0] ** args[1]

def nuba_log(args, _):
    base = args[1] if len(args) > 1 else math.e
    return math.log(float(args[0]), float(base))

def nuba_sin(args, _):   return math.sin(float(args[0]))
def nuba_cos(args, _):   return math.cos(float(args[0]))
def nuba_tan(args, _):   return math.tan(float(args[0]))

def nuba_random(args, _):    return random.random()
def nuba_randint(args, _):   return random.randint(int(args[0]), int(args[1]))
def nuba_choice(args, _):    return random.choice(args[0])
def nuba_shuffle(args, _):   random.shuffle(args[0]); return args[0]

def nuba_time(args, _):      return time.time()
def nuba_sleep(args, _):     time.sleep(float(args[0])); return None

def nuba_exit(args, _):      raise SystemExit(int(args[0]) if args else 0)

def nuba_assert(args, _):
    if not args[0]:
        msg = args[1] if len(args) > 1 else "Assertion failed"
        raise NubaRuntimeError(str(msg))
    return None

def nuba_read_file(args, _):
    try:
        with open(str(args[0])) as f:
            return f.read()
    except Exception as e:
        raise NubaRuntimeError(str(e))

def nuba_write_file(args, _):
    try:
        with open(str(args[0]), 'w') as f:
            f.write(str(args[1]))
        return True
    except Exception as e:
        raise NubaRuntimeError(str(e))

def nuba_json_parse(args, _):
    try: return _json.loads(str(args[0]))
    except Exception as e: raise NubaRuntimeError(str(e))

def nuba_json_stringify(args, _):
    try: return _json.dumps(args[0], default=str)
    except Exception as e: raise NubaRuntimeError(str(e))

def nuba_env_get(args, _):
    return os.environ.get(str(args[0]), args[1] if len(args) > 1 else None)

def nuba_is_null(args, _):   return args[0] is None
def nuba_is_int(args, _):    return isinstance(args[0], int) and not isinstance(args[0], bool)
def nuba_is_float(args, _):  return isinstance(args[0], float)
def nuba_is_string(args, _): return isinstance(args[0], str)
def nuba_is_list(args, _):   return isinstance(args[0], list)
def nuba_is_dict(args, _):   return isinstance(args[0], dict)
def nuba_is_bool(args, _):   return isinstance(args[0], bool)


def nuba_to_string(val):
    if val is None:           return "null"
    if isinstance(val, bool): return "true" if val else "false"
    if isinstance(val, list):
        inner = ", ".join(nuba_to_string(x) for x in val)
        return f"[{inner}]"
    if isinstance(val, dict):
        pairs = ", ".join(f"{nuba_to_string(k)}: {nuba_to_string(v)}" for k, v in val.items())
        return "{" + pairs + "}"
    return str(val)


BUILTINS = {
    "len":         nuba_len,
    "type":        nuba_type,
    "int":         nuba_int,
    "float":       nuba_float,
    "str":         nuba_str,
    "bool":        nuba_bool,
    "input":       nuba_input,
    "range":       nuba_range,
    "list":        nuba_list,
    "abs":         nuba_abs,
    "max":         nuba_max,
    "min":         nuba_min,
    "sum":         nuba_sum,
    "sorted":      nuba_sorted,
    "reversed":    nuba_reversed,
    "map":         nuba_map,
    "filter":      nuba_filter,
    "reduce":      nuba_reduce,
    "zip":         nuba_zip,
    "enumerate":   nuba_enumerate,
    "keys":        nuba_keys,
    "values":      nuba_values,
    "items":       nuba_items,
    "has":         nuba_has,
    "push":        nuba_push,
    "pop":         nuba_pop,
    "insert":      nuba_insert,
    "remove":      nuba_remove,
    "join":        nuba_join,
    "split":       nuba_split,
    "trim":        nuba_trim,
    "upper":       nuba_upper,
    "lower":       nuba_lower,
    "replace":     nuba_replace,
    "startswith":  nuba_startswith,
    "endswith":    nuba_endswith,
    "contains":    nuba_contains,
    "indexOf":     nuba_index_of,
    "substr":      nuba_substr,
    "char":        nuba_char,
    "ord":         nuba_ord,
    "format":      nuba_format,
    "sqrt":        nuba_sqrt,
    "floor":       nuba_floor,
    "ceil":        nuba_ceil,
    "round":       nuba_round,
    "pow":         nuba_pow,
    "log":         nuba_log,
    "sin":         nuba_sin,
    "cos":         nuba_cos,
    "tan":         nuba_tan,
    "random":      nuba_random,
    "randint":     nuba_randint,
    "choice":      nuba_choice,
    "shuffle":     nuba_shuffle,
    "time":        nuba_time,
    "sleep":       nuba_sleep,
    "exit":        nuba_exit,
    "assert":      nuba_assert,
    "readFile":    nuba_read_file,
    "writeFile":   nuba_write_file,
    "jsonParse":   nuba_json_parse,
    "jsonStringify": nuba_json_stringify,
    "envGet":      nuba_env_get,
    "isNull":      nuba_is_null,
    "isInt":       nuba_is_int,
    "isFloat":     nuba_is_float,
    "isString":    nuba_is_string,
    "isList":      nuba_is_list,
    "isDict":      nuba_is_dict,
    "isBool":      nuba_is_bool,
    "PI":          math.pi,
    "E":           math.e,
    "INF":         math.inf,
}


def _to_iterable(val):
    """Convert NubaRange or list to a Python iterable."""
    from .values import NubaRange
    if isinstance(val, NubaRange):
        return list(val)
    return val
