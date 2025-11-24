"""
Python sample demonstrating all token types and syntax.
"""

# Comments: Single line comment
"""Multi-line string (docstring)"""

# Keywords
import os
from typing import List, Dict, Optional, Union, Tuple
from abc import ABC, abstractmethod
import sys as system

# Built-in functions and constants
print("String literal")
x = None
y = True
z = False

# Numbers
integer = 42
floating = 3.14
scientific = 1e-3
hexadecimal = 0xFF
binary = 0b1010
octal = 0o755

# String literals
single_quote = "single"
double_quote = "double"
triple_single = """multi
line"""
triple_double = """another
multi"""
raw_string = r"C:\path\to\file"
f_string = f"formatted {x} string {integer + floating}"

# Control flow
if x is None:
    pass
elif y or z:
    pass
else:
    pass

for i in range(10):
    if i > 5:
        break
    continue

while True:
    try:
        result = 10 / 0
    except ZeroDivisionError as e:
        print(e)
    except Exception:
        pass
    else:
        pass
    finally:
        pass
    break


# Functions and decorators
@property
@staticmethod
@classmethod
def example_function(param: int, *args, **kwargs) -> Optional[str]:
    """Function with type hints and docstring."""
    return None


async def async_function():
    await some_coroutine()


# Lambda
lambda_func = lambda x, y: x + y


# Classes
class BaseClass(ABC):
    class_var = "class variable"

    def __init__(self, name: str) -> None:
        self.name = name
        self._private = None
        self.__dunder__ = True

    @abstractmethod
    def abstract_method(self) -> None:
        pass

    def regular_method(self) -> None:
        self.name = "modified"

    @property
    def property_method(self) -> str:
        return self.name


class DerivedClass(BaseClass):
    def abstract_method(self) -> None:
        super().abstract_method()


# Operators
result = 1 + 2 - 3 * 4 / 5 % 6
result = 2**3
result = a & b | c ^ d << 1 >> 1
result = a and b or not c
result = a is b is c
result = a is not b
result = a in b
result = a not in b
result = a < b <= c > d >= e == f != g

# Comprehensions
list_comp = [x for x in range(10) if x % 2]
dict_comp = {x: x**2 for x in range(5)}
set_comp = {x for x in range(5)}
gen_exp = (x for x in range(5))

# Collections
my_list = [1, 2, 3]
my_tuple = (1, 2, 3)
my_dict = {"key": "value", "num": 42}
my_set = {1, 2, 3}

# Slicing
slice_op = my_list[1:3]
slice_step = my_list[::2]
slice_neg = my_list[-2:]

# Context manager
with open("file.txt") as f:
    content = f.read()

# Global and nonlocal
global_var = 10


def outer():
    nonlocal_var = 20

    def inner():
        nonlocal nonlocal_var
        nonlocal_var = 30


# Type annotations
def annotated(x: int, y: str = "default") -> Dict[str, Union[int, str]]:
    return {"x": x, "y": y}


# Assertions
assert x is not None, "x cannot be None"

# Delete
del x

# Import statements
from module import func, Class as Alias
from . import relative_module
from ..parent import something


# Yield
def generator():
    yield 1
    yield from another_generator()


# Ellipsis
def stub(): ...


# Walrus operator (Python 3.8+)
if (n := len(my_list)) > 5:
    print(f"List has {n} items")
