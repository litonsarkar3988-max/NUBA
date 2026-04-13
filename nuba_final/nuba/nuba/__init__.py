# nuba/__init__.py

__version__ = "1.0.0"
__author__  = "Nuba Language Project"

from .runner import run_source, run_file
from .errors import NubaError, NubaRuntimeError, NubaParseError, NubaLexError
