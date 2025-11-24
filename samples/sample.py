#!/usr/bin/env python3
"""Comprehensive Python sample showcasing all language features and token types.

Demonstrates proper syntax highlighting across the Centurion color theme.
"""

from abc import ABC, abstractmethod
from dataclasses import dataclass
from enum import Enum
from collections.abc import Callable


# ============================================================================
# CONSTANTS AND GLOBAL VARIABLES
# ============================================================================

DEBUG_MODE: bool = True
MAX_RETRIES: int = 3
API_TIMEOUT: float = 30.5
EMPTY_VALUE: None = None
VALID_STATUSES: list[str] = ["pending", "active", "completed"]


# ============================================================================
# ENUMS AND DATA CLASSES
# ============================================================================


class Status(Enum):
    """Enumeration of possible statuses."""

    PENDING = "pending"
    ACTIVE = "active"
    COMPLETED = "completed"


@dataclass
class User:
    """A user with name and email."""

    name: str
    email: str
    age: int = 18
    is_active: bool = True

    def __str__(self) -> str:
        return f"{self.name} <{self.email}>"


# ============================================================================
# FUNCTIONS AND DECORATORS
# ============================================================================


def simple_function(x: int, y: int) -> int:
    """
    Simple function that adds two numbers.

    Args:
        x: First number
        y: Second number

    Returns:
        The sum of x and y
    """
    return x + y


def function_with_defaults(
    name: str, age: int = 25, email: str | None = None, *args, **kwargs
) -> dict[str, object]:
    """Function with default and variable arguments."""
    return {
        "name": name,
        "age": age,
        "email": email or "unknown@example.com",
        "extra_args": args,
        "extra_kwargs": kwargs,
    }


def decorator_function(func: Callable) -> Callable:
    """A simple decorator."""

    def wrapper(*args, **kwargs):
        print(f"Calling {func.__name__}")
        return func(*args, **kwargs)

    return wrapper


@decorator_function
def decorated_function() -> str:
    """A function with a decorator."""
    return "decorated result"


# ============================================================================
# LAMBDA AND COMPREHENSIONS
# ============================================================================

# Lambda expressions
add: Callable[[int, int], int] = lambda x, y: x + y
multiply: Callable[[int, int], int] = lambda x, y: x * y
is_even: Callable[[int], bool] = lambda n: n % 2 == 0

# List comprehension
_squares = [x**2 for x in range(10)]
_evens = [x for x in range(20) if is_even(x)]
_nested = [[x + y for y in range(3)] for x in range(3)]

# Dictionary comprehension
_squares_dict = {x: x**2 for x in range(5)}
_filtered_dict = {k: v for k, v in {"a": 1, "b": 2, "c": 3}.items() if v > 1}

# Set comprehension
_unique_squares = {x**2 for x in range(10)}

# Generator expression
_squared_generator = (x**2 for x in range(1000))


# ============================================================================
# COLLECTIONS AND SLICING
# ============================================================================

# Lists
numbers: list[int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
mixed_list: list = [1, "string", 3.14, True, None]

# Tuples
coordinates: tuple[int, int, int] = (10, 20, 30)
immutable_data: tuple[str, ...] = ("a", "b", "c", "d")

# Dictionaries
config: dict[str, object] = {
    "host": "localhost",
    "port": 8080,
    "debug": True,
    "features": ["auth", "logging", "cache"],
}

# Sets
tags: set = {"python", "theme", "syntax", "highlight"}
unique_ids = {101, 102, 103, 104}

# Slicing operations
_first_three = numbers[:3]
_skip_first = numbers[1:]
_every_second = numbers[::2]
_reversed_list = numbers[::-1]
_subset = numbers[2:7:2]


# ============================================================================
# CONTROL FLOW
# ============================================================================


def control_flow_example(value: int) -> str:
    """Demonstrate various control flow patterns."""

    # if/elif/else
    if value < 0:
        return "negative"
    elif value == 0:
        return "zero"
    elif value < 10:
        return "single digit"
    else:
        return "large number"


def loops_example() -> None:
    """Demonstrate loop constructs."""

    # for loop
    for i in range(5):
        if i == 2:
            continue
        if i == 4:
            break
        print(i)

    # for with enumerate
    items = ["a", "b", "c"]
    for index, item in enumerate(items):
        print(f"{index}: {item}")

    # for with zip
    names = ["Alice", "Bob", "Charlie"]
    ages = [25, 30, 35]
    for name, age in zip(names, ages):
        print(f"{name} is {age}")

    # while loop
    counter = 0
    while counter < 5:
        counter += 1


def exception_handling() -> None:
    """Demonstrate exception handling."""

    try:
        _result = 10 / 0  # noqa: F841
    except ZeroDivisionError as e:
        print(f"Error: {e}")
    except (ValueError, TypeError):
        print("Type or value error occurred")
    except Exception as e:
        print(f"Unknown error: {e}")
    else:
        print("No exception occurred")
    finally:
        print("Cleanup resources")


# ============================================================================
# CLASSES AND OOP
# ============================================================================


class Animal(ABC):
    """Abstract base class for animals."""

    class_species = "Unknown"

    def __init__(self, name: str) -> None:
        self.name = name
        self._age = 0
        self.__id = id(self)

    @property
    def age(self) -> int:
        """Get the age of the animal."""
        return self._age

    @age.setter
    def age(self, value: int) -> None:
        """Set the age of the animal."""
        if value < 0:
            raise ValueError("Age cannot be negative")
        self._age = value

    @abstractmethod
    def make_sound(self) -> str:
        """Make a sound specific to the animal."""
        pass

    @staticmethod
    def get_species() -> str:
        """Get the species name."""
        return "Generic Animal"

    @classmethod
    def from_dict(cls, data: dict[str, object]) -> "Animal":
        """Create an animal from a dictionary."""
        return cls(data.get("name", "Unknown"))


class Dog(Animal):
    """Dog subclass."""

    class_species = "Canis familiaris"

    def __init__(self, name: str, breed: str = "Mixed") -> None:
        super().__init__(name)
        self.breed = breed

    def make_sound(self) -> str:
        """Dogs bark."""
        return "Woof!"

    def fetch(self, item: str) -> str:
        return f"{self.name} fetched the {item}"


# ============================================================================
# OPERATORS
# ============================================================================


def operators_example() -> None:
    """Demonstrate different operator types."""

    # Arithmetic operators
    a, b = 10, 3
    _addition = a + b
    _subtraction = a - b
    _multiplication = a * b
    _division = a / b
    _floor_div = a // b
    _modulo = a % b
    _exponent = a**b

    # Comparison operators
    _is_greater = a > b
    _is_less = a < b
    _is_equal = a == b
    _is_not_equal = a != b
    _is_greater_equal = a >= b
    _is_less_equal = a <= b

    # Logical operators
    _both_true = (a > 5) and (b < 5)
    _either_true = (a > 5) or (b > 5)
    _is_false = not (a < 5)

    # Bitwise operators
    _bitwise_and = a & b
    _bitwise_or = a | b
    _bitwise_xor = a ^ b
    _bitwise_not = ~a
    _left_shift = a << 1
    _right_shift = a >> 1

    # Identity operators
    _is_same = a is b
    _is_not_same = a is not b

    # Membership operators
    _is_in_list = a in [1, 5, 10, 15]
    _is_not_in_list = b not in [1, 5, 10, 15]


# ============================================================================
# STRING OPERATIONS
# ============================================================================


def string_operations() -> None:
    """Demonstrate string handling."""

    # String literals
    _single_quote = "single quoted string"
    _double_quote = "double quoted string"
    _triple_quoted = """This is a
    multi-line
    string"""
    _raw_string = r"C:\Users\name\Documents\file.txt"

    # String formatting
    name = "Alice"
    age = 30
    _formatted_old = "Name: %s, Age: %d" % (name, age)
    _formatted_new = "Name: {}, Age: {}".format(name, age)
    _formatted_f = f"Name: {name}, Age: {age}"
    _formatted_expr = f"Age next year: {age + 1}"

    # String methods
    text = "Hello World"
    _uppercase = text.upper()
    _lowercase = text.lower()
    _title_case = text.title()
    _start_check = text.startswith("Hello")
    _end_check = text.endswith("World")
    _find_index = text.find("World")
    _replaced = text.replace("World", "Python")
    _split_text = text.split()
    _joined = "-".join(["a", "b", "c"])
    _stripped = "  hello  ".strip()


# ============================================================================
# CONTEXT MANAGERS AND GENERATORS
# ============================================================================


def file_operations() -> None:
    """Demonstrate context manager usage."""

    # With statement
    with open("example.txt") as f:
        _content = f.read()

    # Multiple context managers
    with open("input.txt") as infile, open("output.txt", "w") as outfile:
        for line in infile:
            outfile.write(line.upper())


def generator_function() -> Callable:
    """A generator function that yields values."""
    for i in range(5):
        yield i

    yield from range(5, 10)


def simple_generator():
    """Generate first n Fibonacci numbers."""
    a, b = 0, 1
    for _ in range(10):
        yield a
        a, b = b, a + b


# ============================================================================
# TYPE HINTS AND ANNOTATIONS
# ============================================================================


def complex_function(
    numbers: list[int],
    multiplier: int = 2,
    filter_fn: Callable[[int], bool] | None = None,
) -> dict[str, list[int] | int]:
    """
    Process a list of numbers with optional filtering.

    Args:
        numbers: List of integers to process
        multiplier: Factor to multiply each number by
        filter_fn: Optional function to filter numbers

    Returns:
        Dictionary with processed results and count
    """
    filtered = [n for n in numbers if filter_fn is None or filter_fn(n)]
    processed = [n * multiplier for n in filtered]
    return {"original": numbers, "processed": processed, "count": len(processed)}


# ============================================================================
# MAIN EXECUTION
# ============================================================================

if __name__ == "__main__":
    # Execute sample code
    print("Python sample file loaded successfully!")

    # Walrus operator (Python 3.8+)
    if (length := len(numbers)) > 5:
        print(f"List has {length} items")

    # Create instances
    dog = Dog("Buddy", "Golden Retriever")
    dog.age = 5
    print(f"{dog.name} says: {dog.make_sound()}")

    # Use various functions
    result = simple_function(10, 20)
    assert result == 30, "Function should return 30"

    # Generator usage
    for value in generator_function():
        pass

    # Assertions
    assert DEBUG_MODE is True
    assert MAX_RETRIES >= 1

    print("All examples executed!")
