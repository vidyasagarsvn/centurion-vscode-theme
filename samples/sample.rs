// Rust sample demonstrating all token types and syntax

// Comments
// Single line comment
/// Documentation comment for items
/** Multi-line
    documentation comment */
/*! Module documentation */
// Regular multi-line
/* comment */

// Prelude and imports
use std::collections::{HashMap, HashSet};
use std::io::{self, Read, Write};
use std::fs::File;

// Re-export
pub use crate::module::Item;

// Attributes
#![allow(dead_code)]
#![crate_type = "lib"]

#[derive(Debug, Clone, Copy)]
#[repr(C)]
struct Point {
    x: i32,
    y: i32,
}

// Constants and statics
const CONSTANT: i32 = 42;
const PI: f64 = 3.14159;
static STATIC_VAR: &str = "static";
static mut MUTABLE_STATIC: i32 = 0;

// Numeric types and literals
let decimal_int: i32 = 42;
let negative: i32 = -100;
let hex: i32 = 0xFF;
let octal: i32 = 0o755;
let binary: i32 = 0b1010;
let float32: f32 = 3.14;
let float64: f64 = 3.14159;
let scientific: f64 = 1.5e-3;
let underscored: i64 = 1_000_000;
let byte: u8 = b'A';
let inf: f64 = f64::INFINITY;
let neg_inf: f64 = f64::NEG_INFINITY;
let nan: f64 = f64::NAN;

// Strings and characters
let string: String = String::from("owned string");
let str_literal: &str = "string slice";
let raw_string: &str = r#"raw string with "quotes""#;
let byte_string: &[u8] = b"byte string";
let char_literal: char = 'A';
let escaped_char: char = '\n';
let unicode_char: char = '\u{1F600}';
let multi_line = "line1
line2";

// String interpolation
let name = "World";
let greeting = format!("Hello, {}!", name);

// Booleans
let bool_true: bool = true;
let bool_false: bool = false;

// Arrays
let array: [i32; 5] = [1, 2, 3, 4, 5];
let array_init: [i32; 3] = [0; 3];
let array_inference = [1, 2, 3];

// Tuples
let tuple: (i32, f64, &str) = (42, 3.14, "text");
let unit_tuple: () = ();
let (a, b, c) = tuple; // Destructuring

// Slices
let slice: &[i32] = &[1, 2, 3, 4, 5];
let slice_mutable: &mut [i32] = &mut [1, 2, 3];

// Vectors
let vector: Vec<i32> = vec![1, 2, 3];
let vector_new = Vec::new();
let vector_with_capacity = Vec::with_capacity(10);

// HashMaps
let mut map: HashMap<String, i32> = HashMap::new();
map.insert("a".to_string(), 1);
map.insert("b".to_string(), 2);

// HashSets
let mut set: HashSet<i32> = HashSet::new();
set.insert(1);
set.insert(2);

// Options
let option_some: Option<i32> = Some(42);
let option_none: Option<i32> = None;
if let Some(val) = option_some {
    println!("{}", val);
}

// Results
let result_ok: Result<i32, String> = Ok(42);
let result_err: Result<i32, String> = Err("error".to_string());
match result_ok {
    Ok(val) => println!("{}", val),
    Err(e) => println!("Error: {}", e),
}

// Enumerations
enum Color {
    Red,
    Green,
    Blue,
}

enum Message {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
    ChangeColor(i32, i32, i32),
}

// Structs
struct Person {
    name: String,
    age: u32,
    email: String,
}

struct Unit;

struct Tuple(String, i32, bool);

// Implementations
impl Point {
    fn new(x: i32, y: i32) -> Point {
        Point { x, y }
    }
    
    fn x(&self) -> i32 {
        self.x
    }
    
    fn translate(&mut self, dx: i32, dy: i32) {
        self.x += dx;
        self.y += dy;
    }
}

impl Person {
    fn new(name: String, age: u32) -> Person {
        Person {
            name,
            age,
            email: String::new(),
        }
    }
    
    fn display(&self) {
        println!("{} is {} years old", self.name, self.age);
    }
}

// Traits
trait Animal {
    fn name(&self) -> &str;
    
    fn make_sound(&self) {
        println!("{} makes a sound", self.name());
    }
}

struct Dog {
    name: String,
}

impl Animal for Dog {
    fn name(&self) -> &str {
        &self.name
    }
    
    fn make_sound(&self) {
        println!("{} says woof!", self.name());
    }
}

// Generic types
struct Container<T> {
    value: T,
}

impl<T> Container<T> {
    fn new(value: T) -> Container<T> {
        Container { value }
    }
    
    fn get(&self) -> &T {
        &self.value
    }
}

fn generic_function<T: std::fmt::Debug>(value: T) {
    println!("{:?}", value);
}

// Trait bounds
fn print_animal<T: Animal>(animal: T) {
    println!("{}", animal.name());
}

// Lifetime annotations
fn first_word<'a>(s: &'a str) -> &'a str {
    let bytes = s.as_bytes();
    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return &s[0..i];
        }
    }
    &s[..]
}

fn borrow_two<'a, 'b>(x: &'a str, y: &'b str) -> &'a str {
    x
}

// Functions
fn simple_function() {
    println!("Hello");
}

fn function_with_args(x: i32, y: i32) -> i32 {
    x + y
}

fn function_with_multiple_returns() -> (i32, String) {
    (42, "text".to_string())
}

fn function_with_impl_trait(x: i32) -> impl Iterator<Item = i32> {
    (0..x).map(|i| i * 2)
}

// Closures
let add_one = |x| x + 1;
let add = |x, y| x + y;
let closure_with_move = move |x| x + value;

// Control flow
fn control_flow(x: i32) {
    // if-else
    if x > 0 {
        println!("Positive");
    } else if x < 0 {
        println!("Negative");
    } else {
        println!("Zero");
    }
    
    // if as expression
    let result = if x > 0 { "positive" } else { "non-positive" };
    
    // match
    match x {
        0 => println!("Zero"),
        1..=5 => println!("Between 1 and 5"),
        10 | 20 => println!("Ten or twenty"),
        _ => println!("Other"),
    }
    
    // match with destructuring
    let point = (0, 0);
    match point {
        (0, 0) => println!("Origin"),
        (x, 0) => println!("On x-axis at {}", x),
        (0, y) => println!("On y-axis at {}", y),
        (x, y) => println!("At ({}, {})", x, y),
    }
    
    // loop
    loop {
        println!("Infinite");
        break;
    }
    
    // for loop
    for i in 0..5 {
        if i == 3 {
            continue;
        }
        if i == 4 {
            break;
        }
        println!("{}", i);
    }
    
    // while loop
    let mut i = 0;
    while i < 5 {
        println!("{}", i);
        i += 1;
    }
}

// Error handling
fn result_example(filename: &str) -> Result<String, std::io::Error> {
    let mut file = File::open(filename)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents)
}

// Ownership and borrowing
fn ownership_example() {
    let s1 = String::from("hello");
    let s2 = s1; // Move
    // println!("{}", s1); // Error: s1 is no longer valid
    
    let s3 = String::from("world");
    let s4 = &s3; // Borrow
    println!("{}", s3); // Valid, s3 is still valid
    
    let mut s5 = String::from("mutable");
    let s6 = &mut s5; // Mutable borrow
    s6.push_str(" string");
}

// Pattern matching
fn pattern_matching(value: Option<i32>) {
    match value {
        Some(x) if x > 5 => println!("Greater than 5"),
        Some(x) => println!("Some: {}", x),
        None => println!("None"),
    }
}

// Operators
fn operators() {
    let a = 10;
    let b = 3;
    
    // Arithmetic
    let _sum = a + b;
    let _diff = a - b;
    let _product = a * b;
    let _quotient = a / b;
    let _remainder = a % b;
    
    // Logical
    let _and = true && false;
    let _or = true || false;
    let _not = !true;
    
    // Comparison
    let _eq = a == b;
    let _neq = a != b;
    let _lt = a < b;
    let _gt = a > b;
    let _lte = a <= b;
    let _gte = a >= b;
    
    // Bitwise
    let _band = a & b;
    let _bor = a | b;
    let _bxor = a ^ b;
    let _bnot = !a;
    let _shl = a << 1;
    let _shr = a >> 1;
}

// Comments with special syntax
// TODO: Implement this feature
// FIXME: Fix the bug
// NOTE: Important information
// HACK: Quick workaround

fn main() {
    println!("Hello, world!");
    
    let point = Point::new(0, 0);
    println!("{:?}", point);
}
