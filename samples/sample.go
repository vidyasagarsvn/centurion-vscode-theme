package main

import (
	"fmt"
	"strings"
	"strconv"
	"encoding/json"
	"errors"
	"os"
)

// Single line comment
/* Multi-line
   comment */

// Constants
const (
	DefaultName = "John"
	DefaultAge  = 30
	Pi          = 3.14159
)

// Constants with iota (enumeration)
const (
	Red   = iota
	Green = iota
	Blue  = iota
)

// Type declarations
type Person struct {
	Name    string
	Age     int
	Email   string
	Address Address
}

type Address struct {
	Street string
	City   string
	State  string
	Zip    string
}

// Interface
type Reader interface {
	Read(p []byte) (n int, err error)
}

type Writer interface {
	Write(p []byte) (n int, err error)
}

// Embedded interface
type ReadWriter interface {
	Reader
	Writer
}

// Methods on types
func (p *Person) String() string {
	return fmt.Sprintf("%s (%d)", p.Name, p.Age)
}

func (p *Person) IsAdult() bool {
	return p.Age >= 18
}

// Numeric types and literals
var (
	int_var      int     = 42
	int8_var     int8    = 127
	int16_var    int16   = 32767
	int32_var    int32   = 2147483647
	int64_var    int64   = 9223372036854775807
	uint_var     uint    = 42
	uint8_var    uint8   = 255
	uint16_var   uint16  = 65535
	uint32_var   uint32  = 4294967295
	uint64_var   uint64  = 18446744073709551615
	uintptr_var  uintptr = 0xFF
	float32_var  float32 = 3.14
	float64_var  float64 = 3.14159
	complex64_v  complex64  = 1 + 2i
	complex128_v complex128 = 1 + 2i
)

// String and rune
var (
	str_var      string = "Hello, World!"
	rune_var     rune   = 'A'
	byte_var     byte   = 255
	raw_string   string = `raw\nstring`
)

// Boolean
var (
	bool_true  bool = true
	bool_false bool = false
)

// Arrays
var (
	arr_int    [5]int
	arr_string [3]string
	arr_init   [...]int{1, 2, 3, 4, 5}
)

// Slices
var (
	slice_int    []int
	slice_string []string
	slice_empty  []int
	slice_make   = make([]int, 5, 10)
)

// Maps
var (
	map_string_int = map[string]int{"a": 1, "b": 2}
	map_int_string = make(map[int]string)
	map_nested     = map[string]map[string]int{
		"group1": {"a": 1, "b": 2},
		"group2": {"c": 3, "d": 4},
	}
)

// Pointers
var (
	ptr_int    *int
	ptr_string *string
	ptr_person *Person
)

// Channels
var (
	ch_int   chan int
	ch_string chan string
	ch_send  chan<- int
	ch_recv  <-chan int
)

// Functions
func simpleFunction() {
	fmt.Println("Hello")
}

func functionWithArgs(name string, age int) {
	fmt.Printf("%s is %d years old\n", name, age)
}

func functionWithReturn(x int, y int) int {
	return x + y
}

func functionWithMultipleReturns(a int, b int) (int, error) {
	if b == 0 {
		return 0, errors.New("division by zero")
	}
	return a / b, nil
}

func functionWithNamedReturns(x int, y int) (sum int, product int) {
	sum = x + y
	product = x * y
	return
}

func functionWithVariadic(nums ...int) int {
	sum := 0
	for _, num := range nums {
		sum += num
	}
	return sum
}

// Defer
func deferExample() {
	defer fmt.Println("Last")
	fmt.Println("First")
	fmt.Println("Second")
}

// Panic and Recover
func panicExample() {
	defer func() {
		if r := recover(); r != nil {
			fmt.Println("Recovered:", r)
		}
	}()
	panic("Something went wrong")
}

// Anonymous function
func anonymousFunction() {
	f := func(x int) int {
		return x * 2
	}
	fmt.Println(f(5))
}

// Closure
func makeCounter() func() int {
	count := 0
	return func() int {
		count++
		return count
	}
}

// Goroutines and channels
func goroutineExample() {
	ch := make(chan string)
	go func() {
		ch <- "Hello from goroutine"
	}()
	msg := <-ch
	fmt.Println(msg)
}

// Select statement
func selectExample(ch1, ch2 chan string) {
	select {
	case msg1 := <-ch1:
		fmt.Println("Received:", msg1)
	case msg2 := <-ch2:
		fmt.Println("Received:", msg2)
	case <-time.After(time.Second):
		fmt.Println("Timeout")
	}
}

// Control flow
func controlFlow(x int) {
	// if-else
	if x > 0 {
		fmt.Println("Positive")
	} else if x < 0 {
		fmt.Println("Negative")
	} else {
		fmt.Println("Zero")
	}
	
	// if with short statement
	if y := x * 2; y > 10 {
		fmt.Println("Large")
	}
	
	// switch
	switch x {
	case 1:
		fmt.Println("One")
	case 2, 3:
		fmt.Println("Two or three")
		fallthrough
	default:
		fmt.Println("Other")
	}
	
	// switch with no condition
	switch {
	case x > 0:
		fmt.Println("Positive")
	case x < 0:
		fmt.Println("Negative")
	default:
		fmt.Println("Zero")
	}
	
	// for loop
	for i := 0; i < 5; i++ {
		fmt.Println(i)
	}
	
	// while loop
	i := 0
	for i < 5 {
		fmt.Println(i)
		i++
	}
	
	// infinite loop with break
	for {
		fmt.Println("Infinite")
		break
	}
	
	// for-range
	arr := []int{1, 2, 3, 4, 5}
	for i, v := range arr {
		fmt.Printf("Index: %d, Value: %d\n", i, v)
	}
	
	// for-range with strings
	for i, ch := range "Hello" {
		fmt.Printf("Index: %d, Char: %c\n", i, ch)
	}
	
	// for-range with maps
	m := map[string]int{"a": 1, "b": 2}
	for k, v := range m {
		fmt.Printf("Key: %s, Value: %d\n", k, v)
	}
	
	// break and continue
	for i := 0; i < 10; i++ {
		if i == 3 {
			continue
		}
		if i == 7 {
			break
		}
		fmt.Println(i)
	}
}

// Error handling
func errorHandling(filename string) error {
	_, err := os.Open(filename)
	if err != nil {
		return fmt.Errorf("failed to open file: %w", err)
	}
	return nil
}

// Operators
func operators() {
	a := 10
	b := 3
	
	// Arithmetic
	sum := a + b
	diff := a - b
	product := a * b
	quotient := a / b
	remainder := a % b
	power := a << 2  // Left shift
	rshift := a >> 1 // Right shift
	
	// Logical
	and := true && false
	or := true || false
	not := !true
	
	// Comparison
	eq := a == b
	neq := a != b
	lt := a < b
	gt := a > b
	lte := a <= b
	gte := a >= b
	
	// Bitwise
	bitand := a & b
	bitor := a | b
	bitxor := a ^ b
	bitnot := ^a
	lshift := a << 1
	rshift := a >> 1
	
	// Assignment
	a += 5
	b -= 2
	a *= 2
	b /= 2
	a %= 3
	
	// Ternary (using if-else)
	result := "positive"
	if a < 0 {
		result = "negative"
	}
}

// Comments with special syntax
// TODO: Implement this feature
// FIXME: Fix the bug
// NOTE: Important information
// HACK: Quick workaround

func main() {
	fmt.Println("Hello, World!")
	
	person := Person{
		Name: "John Doe",
		Age:  30,
		Email: "john@example.com",
	}
	
	fmt.Println(person)
}
