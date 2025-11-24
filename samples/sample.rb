#!/usr/bin/env ruby
# Ruby sample demonstrating all token types and syntax

# Single line comment
=begin
Multi-line comment
with multiple lines
=end

# Strings
string1 = "double quoted"
string2 = 'single quoted'
string3 = %q(percent q string)
string4 = %Q(percent Q with #{"interpolation"})
symbol = :symbol_name
regex = /pattern/i
regex2 = %r{alternative regex}i

# String interpolation
name = "World"
greeting = "Hello, #{name}!"
escaped = "escaped\nstring"
heredoc = <<-HEREDOC
  This is a
  multi-line heredoc
  string
HEREDOC

# Numbers
integer = 42
negative = -100
float = 3.14159
scientific = 1.5e-3
hex = 0xFF
octal = 0o755
binary = 0b1010
underscored = 1_000_000

# Booleans and nil
bool_true = true
bool_false = false
null_value = nil

# Arrays
array1 = [1, 2, 3, 4, 5]
array2 = ["a", "b", "c"]
array3 = %w(word1 word2 word3)
array_nested = [[1, 2], [3, 4]]
array_symbols = %i(symbol1 symbol2 symbol3)

# Hashes
hash1 = { "key" => "value", "name" => "John" }
hash2 = { key: "value", name: "John" }
hash3 = { "a" => 1, "b" => 2, "c" => 3 }
hash_nested = { person: { name: "John", age: 30 } }

# Ranges
range_inclusive = 1..10
range_exclusive = 1...10
range_string = "a".."z"

# Variables and constants
local_var = "local"
@instance_var = "instance"
@@class_var = "class"
$global_var = "global"
CONSTANT = "constant"

# String operations
str = "hello"
str_upper = str.upcase
str_reverse = str.reverse
str_length = str.length

# Array operations
arr = [1, 2, 3, 4, 5]
first = arr.first
last = arr.last
pushed = arr << 6
combined = arr + [7, 8]

# Hash operations
h = { a: 1, b: 2 }
value = h[:a]
keys = h.keys
values = h.values

# Functions (methods)
def simple_function
  puts "Hello"
end

def function_with_args(name, age)
  "#{name} is #{age} years old"
end

def function_with_defaults(name = "John", age = 30)
  { name: name, age: age }
end

def function_with_splat(*args)
  args
end

def function_with_double_splat(**kwargs)
  kwargs
end

def function_with_block
  yield if block_given?
end

def function_with_block_param(&block)
  block.call if block
end

# Return values
def get_value
  return 42
  # last expression is return value
  "not reached"
end

# Classes
class Animal
  # Class variables
  @@count = 0
  
  # Constructor
  def initialize(name, age = 0)
    @name = name
    @age = age
    @@count += 1
  end
  
  # Getter methods
  def name
    @name
  end
  
  def age
    @age
  end
  
  # Setter methods
  def name=(value)
    @name = value
  end
  
  # Attr shortcuts
  attr_reader :name, :age
  attr_writer :name
  attr_accessor :name, :age
  
  # Regular method
  def speak
    puts "#{@name} makes a sound"
  end
  
  # Method with ? (predicate)
  def adult?
    @age >= 18
  end
  
  # Method with ! (mutator)
  def grow!
    @age += 1
  end
  
  # Class method
  def self.count
    @@count
  end
  
  # Class method alternative
  class << self
    def create_default
      new("Unknown")
    end
  end
end

# Inheritance
class Dog < Animal
  def initialize(name, age, breed)
    super(name, age)
    @breed = breed
  end
  
  def speak
    puts "#{@name} says Woof!"
  end
  
  def breed
    @breed
  end
end

# Modules (mixins)
module Drawable
  def draw
    puts "Drawing #{self.class.name}"
  end
end

module Comparable
  def compare(other)
    self.age <=> other.age
  end
end

class Shape
  include Drawable
  include Comparable
end

# Singleton class
obj = Object.new
class << obj
  def singleton_method
    "Only on this object"
  end
end

# Control flow
def control_flow(x)
  # if-elsif-else
  if x > 0
    puts "positive"
  elsif x < 0
    puts "negative"
  else
    puts "zero"
  end
  
  # unless
  unless x.zero?
    puts "not zero"
  end
  
  # case-when
  case x
  when 1
    "one"
  when 2, 3
    "two or three"
  else
    "other"
  end
  
  # Modifier if
  puts "positive" if x > 0
  
  # Modifier unless
  puts "not zero" unless x.zero?
  
  # Modifier case
  result = case x
  when 1 then "one"
  when 2 then "two"
  else "other"
  end
  
  # Ternary
  message = x > 0 ? "positive" : "non-positive"
  
  # for loop
  for i in 1..5
    puts i
  end
  
  # while loop
  i = 0
  while i < 5
    puts i
    i += 1
  end
  
  # until loop
  i = 0
  until i >= 5
    puts i
    i += 1
  end
  
  # break and next
  [1, 2, 3, 4, 5].each do |num|
    next if num == 2
    break if num == 4
    puts num
  end
end

# Iterators and blocks
[1, 2, 3, 4, 5].each { |x| puts x }
[1, 2, 3].map { |x| x * 2 }
[1, 2, 3, 4].select { |x| x > 2 }
[1, 2, 3].reduce(0) { |sum, x| sum + x }

# Lambda and Proc
lambda_func = lambda { |x| x * 2 }
lambda_func2 = ->(x) { x * 2 }
proc_func = Proc.new { |x| x * 2 }

# Symbols
sym1 = :symbol
sym2 = :"symbol with spaces"
sym_from_string = "string".to_sym

# String manipulation
str = "hello world"
str_split = str.split(" ")
str_chars = str.chars
str_substitute = str.gsub("world", "ruby")

# Error handling
begin
  raise "Error message"
rescue => e
  puts e.message
rescue StandardError => e
  puts "Standard error: #{e}"
ensure
  puts "Cleanup"
end

# Operators
a = 10
b = 3

add = a + b
sub = a - b
mul = a * b
div = a / b
mod = a % b
power = a ** b

eq = a == b
neq = a != b
lt = a < b
gt = a > b
lte = a <= b
gte = a >= b
spaceship = a <=> b

and_op = true && false
or_op = true || false
not_op = !true

bit_and = a & b
bit_or = a | b
bit_xor = a ^ b
bit_not = ~a
left_shift = a << 1
right_shift = a >> 1

# String operators
concat = "hello" + " world"
repeat = "ha" * 3

# Regex operators
matches = "hello" =~ /ell/
no_match = "hello" !~ /xyz/

# Special operators
ternary = a > b ? "a is greater" : "b is greater"
null_coalesce = nil || "default"

# Comments with special syntax
# TODO: Complete this
# FIXME: Fix the bug
# NOTE: Important
# HACK: Quick fix
