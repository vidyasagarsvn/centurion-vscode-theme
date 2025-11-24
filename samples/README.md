# Theme Test Samples

This folder contains comprehensive sample files in multiple programming languages to help test and preview the Centurion color theme across different syntaxes.

## Overview

Each sample file demonstrates **all possible tokens and syntax elements** for its language, ensuring complete theme coverage. The samples are carefully crafted to test:

- Keywords (control flow, declarations, operators)
- Comments (single-line, multi-line, documentation)
- Strings (literals, interpolation, escaping, special formats)
- Numbers (integers, floats, hex, binary, scientific notation)
- Operators (arithmetic, logical, bitwise, comparison)
- Functions and methods
- Classes and types
- Control flow structures
- Built-in functions and methods
- Special syntax and advanced features

## Sample Files

### Web Development

#### HTML (`sample.html`)
- Semantic HTML5 elements
- Form inputs and validation
- Media elements (video, audio, SVG)
- Document structure
- Meta tags and attributes

#### CSS (`sample.css`)
- Selectors (element, class, ID, attribute, pseudo)
- Colors and numeric values
- Box model properties
- Flexbox and CSS Grid
- Animations and transitions
- Media queries
- Custom properties
- Font faces

#### JavaScript/TypeScript (`sample.ts`)
- Variables and constants
- Functions and arrow functions
- Classes and inheritance
- Generics and types
- Async/await and Promises
- Operators and control flow
- Template literals
- Destructuring
- Spread operators

### Programming Languages

#### Python (`sample.py`)
- Functions and decorators
- Classes and inheritance
- Comprehensions
- Type hints
- String formatting
- Exception handling
- Context managers
- Generators and yield

#### Java (`sample.java`)
- Classes and inheritance
- Interfaces and enums
- Generics and wildcards
- Annotations
- Exception handling
- Lambda expressions
- Streams API
- Records (Java 14+)
- Sealed classes (Java 15+)

#### C++ (`sample.cpp`)
- Classes and inheritance
- Templates and specialization
- Smart pointers and RAII
- Operator overloading
- Lambda expressions
- Exception handling
- Namespace management
- Type casting

#### C# (`sample.cs`)
- Classes and inheritance
- Interfaces and traits
- LINQ queries
- Async/await
- Pattern matching
- Records (C# 9+)
- Nullable types
- Attributes and annotations

#### Rust (`sample.rs`)
- Ownership and borrowing
- Traits and generics
- Pattern matching
- Lifetimes
- Closures and iterators
- Error handling with Result/Option
- Macros
- Module system

#### Go (`sample.go`)
- Interfaces and methods
- Goroutines and channels
- Error handling
- Defer and panic/recover
- Type declarations
- Structs and receivers
- Function types

#### Ruby (`sample.rb`)
- Classes and modules
- Blocks and iterators
- String interpolation
- Regular expressions
- Symbols
- Hashes and arrays
- Lambda and Proc

#### PHP (`sample.php`)
- Classes and inheritance
- Interfaces and traits
- Type hints and union types
- Magic methods
- Exception handling
- String operations
- Array functions

### Data and Configuration

#### JSON (`sample.json`)
- Nested structures
- Different data types
- Arrays and objects
- Special keys

#### YAML (`sample.yaml`)
- Strings and literals
- Numbers and booleans
- Arrays and objects
- Anchors and aliases
- Tags and directives

#### SQL (`sample.sql`)
- DDL statements (CREATE, ALTER, DROP)
- DML statements (SELECT, INSERT, UPDATE, DELETE)
- Joins and subqueries
- Aggregate functions
- Window functions
- CTEs (Common Table Expressions)

#### Markdown (`sample.md`)
- Headings and text formatting
- Lists (ordered, unordered, task)
- Code blocks with syntax highlighting
- Links and images
- Tables and blockquotes
- HTML elements
- Metadata

### Shell Scripting

#### Bash (`sample.sh`)
- Variables and arrays
- Functions and conditionals
- Loops (for, while, until)
- String operations
- Command substitution
- Process substitution
- Error handling
- Command line arguments

## How to Test the Theme

1. **Open VS Code** - Open your workspace with the Centurion theme installed
2. **Press F5** - Launch the Extension Development Host
3. **Apply the theme** - Go to Settings → Theme → Select "Centurion"
4. **Browse samples** - Open each `sample.*` file to preview syntax highlighting
5. **Compare colors** - Verify that all tokens are properly highlighted and colors are consistent

## Token Types Tested

Each sample tests the following token categories:

- **Keywords** - Language keywords and control flow
- **Comments** - Single-line, multi-line, and documentation comments
- **Strings** - Regular strings, raw strings, template literals, escape sequences
- **Numbers** - Integers, floats, hex, binary, scientific notation
- **Identifiers** - Variable names, function names, class names
- **Operators** - Arithmetic, logical, bitwise, comparison, assignment
- **Punctuation** - Brackets, braces, parentheses, semicolons
- **Types** - Type names, generic types, type annotations
- **Functions** - Function definitions and calls
- **Classes** - Class definitions and inheritance
- **Special** - TODO/FIXME comments, annotations, preprocessor directives

## Customization

To add more samples or languages:

1. Create a new `sample.ext` file in this folder
2. Ensure all possible token types are included
3. Add comments with language-specific examples
4. Document any special syntax or edge cases

## Related Files

- `../themes/centurion-color-theme.json` - The actual theme definition
- `../README.md` - Main theme documentation
- `../package.json` - Theme package configuration

## Notes

- All sample files are intentionally non-executable (with errors) to focus on syntax highlighting rather than runtime behavior
- Samples are designed to be comprehensive rather than practical examples
- The goal is to test every possible token type the theme can encounter
- Comment blocks indicate which language features are being demonstrated

Happy theme testing! 🎨
