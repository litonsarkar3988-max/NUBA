# nuba/environment.py - Variable environment / scope chain

from .errors import NubaRuntimeError


class Environment:
    def __init__(self, parent=None, name="<scope>"):
        self.vars = {}
        self.constants = set()
        self.parent = parent
        self.name = name

    def define(self, name: str, value, constant=False):
        self.vars[name] = value
        if constant:
            self.constants.add(name)

    def _find_env(self, name: str):
        if name in self.vars:
            return self
        if self.parent:
            return self.parent._find_env(name)
        return None

    def get(self, name: str):
        env = self._find_env(name)
        if env is None:
            raise NubaRuntimeError(f"Undefined variable '{name}'")
        return env.vars[name]

    def set(self, name: str, value):
        env = self._find_env(name)
        if env is None:
            raise NubaRuntimeError(f"Undefined variable '{name}'")
        if name in env.constants:
            raise NubaRuntimeError(f"Cannot reassign constant '{name}'")
        env.vars[name] = value

    def set_local(self, name: str, value):
        """Set only in current scope (used for loop vars, etc.)"""
        self.vars[name] = value

    def child(self, name="<block>"):
        return Environment(parent=self, name=name)

    def __repr__(self):
        return f"Environment({self.name}, vars={list(self.vars.keys())})"
