<?php
/**
 * PHP sample demonstrating all token types and syntax
 */

// Single line comment
# Bash-style comment
/* Multi-line
   comment */

// String types
$single_quote = 'single quoted string';
$double_quote = "double quoted string";
$string_var = "embedded $single_quote";
$string_escape = "line1\nline2\ttabbed";
$heredoc = <<<EOT
    This is a heredoc string
    It can span multiple lines
    And preserve formatting
    EOT;
$nowdoc = <<<'EOT'
    This is a nowdoc string
    It doesn't interpret variables
    Like $this variable
    EOT;

// Numeric types
$integer = 42;
$negative = -100;
$float = 3.14159;
$scientific = 1.5e-3;
$hex = 0xFF;
$binary = 0b1010;
$octal = 0755;

// Boolean
$bool_true = true;
$bool_false = false;

// Null
$null_value = null;

// Arrays
$indexed_array = [1, 2, 3, 4, 5];
$associative_array = ["a" => 1, "b" => 2, "c" => 3];
$nested_array = [
    "group1" => [1, 2, 3],
    "group2" => ["x" => "a", "y" => "b"],
];

// Array functions
$array = [3, 1, 4, 1, 5, 9];
count($array);
array_push($array, 2);
array_pop($array);
array_shift($array);
array_unshift($array, 0);
in_array(3, $array);
array_key_exists("key", $associative_array);

// String functions
$str = "Hello World";
strlen($str);
strtoupper($str);
strtolower($str);
substr($str, 0, 5);
strpos($str, "World");
str_replace("World", "PHP", $str);
explode(" ", $str);
implode("-", ["a", "b", "c"]);
trim($str);

// Functions
function simpleFunction() {
    return "result";
}

function functionWithArgs($name, $age) {
    return "$name is $age years old";
}

function functionWithDefault($name = "John", $age = 30) {
    return [$name, $age];
}

function functionWithVariadic(...$args) {
    return count($args);
}

function &functionByReference() {
    global $globalVar;
    return $globalVar;
}

function functionWithTyping(int $x, string $y): string {
    return "$x: $y";
}

function functionWithNullable(?string $value): ?string {
    return $value;
}

function functionWithUnionType(int|float $number): string {
    return "Number: $number";
}

// Arrow functions (PHP 7.4+)
$arrow = fn($x) => $x * 2;

// Closures
$closure = function($x) use ($globalVar) {
    return $x + $globalVar;
};

// Variable scope
$global_var = "global";

function scopeExample() {
    global $global_var;
    $global_var;
    
    static $static_var = 0;
    $static_var++;
}

// Constants
define("MY_CONSTANT", "constant value");
const CLASS_CONSTANT = "class constant";

// Classes
class Animal {
    // Properties
    public $name;
    protected $age;
    private $secret;
    public static $count = 0;
    
    // Type hints
    public string $typed_property = "value";
    private int $age_typed;
    
    // Constructor
    public function __construct($name, $age = 0) {
        $this->name = $name;
        $this->age = $age;
        self::$count++;
    }
    
    // Regular method
    public function speak() {
        return "{$this->name} makes a sound";
    }
    
    // Protected method
    protected function protectedMethod() {
        return "protected";
    }
    
    // Private method
    private function privateMethod() {
        return "private";
    }
    
    // Static method
    public static function createDefault() {
        return new self("Unknown");
    }
    
    // Magic methods
    public function __get($name) {
        return $this->$name ?? null;
    }
    
    public function __set($name, $value) {
        $this->$name = $value;
    }
    
    public function __call($name, $args) {
        return "Called method $name";
    }
    
    public static function __callStatic($name, $args) {
        return "Called static method $name";
    }
    
    public function __toString() {
        return $this->name;
    }
    
    public function __invoke() {
        return "Invoked";
    }
    
    // Getters and setters
    public function getName() {
        return $this->name;
    }
    
    public function setName($name) {
        $this->name = $name;
    }
}

// Inheritance
class Dog extends Animal {
    private $breed;
    
    public function __construct($name, $breed) {
        parent::__construct($name);
        $this->breed = $breed;
    }
    
    public function speak() {
        return "{$this->name} says Woof!";
    }
    
    public function getBreed() {
        return $this->breed;
    }
}

// Interfaces
interface Reader {
    public function read();
}

interface Writer {
    public function write($data);
}

// Implementing interfaces
class FileHandler implements Reader, Writer {
    private $file;
    
    public function read() {
        return "reading";
    }
    
    public function write($data) {
        return "writing";
    }
}

// Abstract classes
abstract class Shape {
    protected $color;
    
    abstract public function area();
    abstract public function perimeter();
    
    public function getColor() {
        return $this->color;
    }
}

class Circle extends Shape {
    private $radius;
    
    public function __construct($radius) {
        $this->radius = $radius;
    }
    
    public function area() {
        return 3.14 * $this->radius * $this->radius;
    }
    
    public function perimeter() {
        return 2 * 3.14 * $this->radius;
    }
}

// Traits
trait Logger {
    public function log($message) {
        echo "Log: $message\n";
    }
}

trait Timestamp {
    public function getTimestamp() {
        return time();
    }
}

class Application {
    use Logger, Timestamp;
}

// Anonymous classes (PHP 7+)
$obj = new class {
    public function method() {
        return "anonymous class";
    }
};

// Control flow
function controlFlow($x) {
    // if-else
    if ($x > 0) {
        return "positive";
    } elseif ($x < 0) {
        return "negative";
    } else {
        return "zero";
    }
    
    // switch
    switch ($x) {
        case 1:
            return "one";
        case 2:
        case 3:
            return "two or three";
            break;
        default:
            return "other";
    }
    
    // Ternary
    $result = $x > 0 ? "positive" : "non-positive";
    
    // Null coalesce
    $value = $x ?? 0;
    
    // Spaceship operator
    $comparison = $x <=> 0;
    
    // for loop
    for ($i = 0; $i < 10; $i++) {
        if ($i == 3) continue;
        if ($i == 7) break;
    }
    
    // foreach loop
    foreach ([1, 2, 3] as $item) {
        echo $item;
    }
    
    foreach (["a" => 1, "b" => 2] as $key => $value) {
        echo "$key: $value";
    }
    
    // while loop
    while ($x < 10) {
        $x++;
    }
    
    // do-while loop
    do {
        $x++;
    } while ($x < 20);
}

// Exception handling
try {
    throw new Exception("Something went wrong");
} catch (Exception $e) {
    echo $e->getMessage();
} catch (Throwable $e) {
    echo "Throwable";
} finally {
    echo "Cleanup";
}

// Operators
$a = 10;
$b = 3;

// Arithmetic
$add = $a + $b;
$sub = $a - $b;
$mul = $a * $b;
$div = $a / $b;
$mod = $a % $b;
$pow = $a ** $b;

// String concatenation
$concat = "Hello" . " " . "World";

// Comparison
$eq = $a == $b;
$identical = $a === $b;
$neq = $a != $b;
$not_identical = $a !== $b;

// Logical
$and = true && false;
$or = true || false;
$xor = true xor false;
$not = !true;

// Bitwise
$band = $a & $b;
$bor = $a | $b;
$bxor = $a ^ $b;
$bnot = ~$a;
$shl = $a << 1;
$shr = $a >> 1;

// Assignment operators
$a += 5;
$b -= 2;
$a *= 2;
$b /= 2;
$a %= 3;
$a .= "string";

// instanceof
if ($obj instanceof Dog) {
    echo "Is a Dog";
}

// Comments with special syntax
// TODO: Implement this feature
// FIXME: Fix the bug
// NOTE: Important information
// HACK: Quick workaround

?>
