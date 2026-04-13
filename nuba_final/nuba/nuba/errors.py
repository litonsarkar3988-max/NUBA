# nuba/errors.py - Exception hierarchy for the Nuba language


class NubaError(Exception):
    """Base class for all Nuba errors."""
    pass


class NubaLexError(NubaError):
    """Raised during tokenization."""
    pass


class NubaParseError(NubaError):
    """Raised during parsing."""
    pass


class NubaRuntimeError(NubaError):
    """Raised during interpretation."""
    pass


class NubaTypeError(NubaRuntimeError):
    """Type mismatch at runtime."""
    pass


class NubaIndexError(NubaRuntimeError):
    """Index out of range."""
    pass


class NubaAttributeError(NubaRuntimeError):
    """Attribute not found on object."""
    pass


class NubaImportError(NubaRuntimeError):
    """Module import failure."""
    pass


class NubaZeroDivisionError(NubaRuntimeError):
    """Division by zero."""
    pass


# ── Control-flow signals (not errors per se) ──────────────────────────────────

class ReturnSignal(Exception):
    def __init__(self, value):
        self.value = value


class BreakSignal(Exception):
    pass


class ContinueSignal(Exception):
    pass


class ThrowSignal(Exception):
    def __init__(self, value):
        self.value = value
