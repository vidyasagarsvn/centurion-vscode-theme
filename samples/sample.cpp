/**
 * C++ sample demonstrating all token types and syntax.
 */

#include <iostream>
#include <vector>
#include <map>
#include <string>
#include <memory>
#include <algorithm>
#include <functional>

// Single line comment
/* Multi-line
   comment */

using namespace std;

// Preprocessor directives
#define MACRO_NAME 42
#define FUNCTION_MACRO(x) ((x) * 2)
#ifdef DEBUG
#define DEBUG_PRINT(msg) cout << msg << endl
#endif
#pragma once

// Namespace
namespace MyNamespace {
    // Constants and literals
    const int CONSTANT_INT = 100;
    constexpr int COMPILE_TIME_INT = 200;
    const double PI = 3.14159;
    const char* STRING_LITERAL = "string";
    const wchar_t WIDE_CHAR = L'A';
    const char UTF8[] = u8"UTF-8";
    const char16_t UTF16[] = u"UTF-16";
    const char32_t UTF32[] = U"UTF-32";
    
    // Numeric literals
    int decimal = 1234;
    int hex = 0xDEADBEEF;
    int octal = 0755;
    int binary = 0b1010;
    long longNum = 1000L;
    unsigned int unsignedInt = 100U;
    float floatNum = 3.14f;
    double doubleNum = 2.718;
    double scientific = 1.5e-3;
    
    // String literals
    string str1 = "C-style string";
    string str2 = "escaped\nnewline\ttab";
    string raw = R"(raw string\n no escape)";
    
    // Boolean
    bool flag = true;
    bool notFlag = false;
    
    // Null pointer
    int* nullPtr = nullptr;
    
    // Enumerations
    enum Color { RED, GREEN, BLUE };
    enum class Status : unsigned char { IDLE = 0, RUNNING = 1, STOPPED = 2 };
    
    // Type aliases
    using IntVector = vector<int>;
    using StringMap = map<string, string>;
    typedef unsigned long ulong;
    
    // Structures
    struct Point {
        int x;
        int y;
        
        Point() : x(0), y(0) {}
        Point(int x, int y) : x(x), y(y) {}
    };
    
    // Union
    union Data {
        int i;
        float f;
        char c;
    };
    
    // Classes
    class Animal {
    private:
        string name;
        mutable int callCount = 0;
        
    protected:
        int age;
        
    public:
        // Constructors
        Animal() = default;
        explicit Animal(const string& name) : name(name) {}
        Animal(const Animal&) = default;  // Copy constructor
        Animal(Animal&&) noexcept = default;  // Move constructor
        
        // Destructor
        virtual ~Animal() = default;
        
        // Deleted functions
        void operator=(const Animal&) = delete;
        
        // Methods
        virtual void speak() const {
            cout << name << " makes a sound" << endl;
        }
        
        virtual void move(int distance) {
            cout << "Moving " << distance << " units" << endl;
        }
        
        constexpr int getAge() const { return age; }
        
        // Const method
        const string& getName() const { return name; }
        
        // Static method
        static int count() { return 0; }
        
        // Mutable member access in const method
        void incrementCallCount() const { ++callCount; }
        
        // Volatile method
        volatile void volatileMethod() volatile {}
    };
    
    // Class inheritance
    class Dog : public Animal {
    private:
        string breed;
        
    public:
        Dog(const string& name, const string& breed) 
            : Animal(name), breed(breed) {}
        
        virtual void speak() const override {
            cout << "Woof! I'm a " << breed << endl;
        }
        
        void fetch() final {
            cout << "Fetching..." << endl;
        }
    };
    
    // Abstract class
    class Shape {
    public:
        virtual ~Shape() = default;
        virtual double area() const = 0;
        virtual double perimeter() const = 0;
    };
    
    // Multiple inheritance
    class Drawable {
    public:
        virtual void draw() = 0;
    };
    
    class Circle : public Shape, public Drawable {
    private:
        double radius;
        
    public:
        Circle(double r) : radius(r) {}
        double area() const override { return radius * radius * 3.14159; }
        double perimeter() const override { return 2 * radius * 3.14159; }
        void draw() override { cout << "Drawing circle" << endl; }
    };
    
    // Template classes
    template <typename T>
    class Container {
    private:
        vector<T> items;
        
    public:
        void add(const T& item) { items.push_back(item); }
        T& get(size_t index) { return items[index]; }
        size_t size() const { return items.size(); }
    };
    
    template <typename T, typename U>
    class Pair {
    public:
        T first;
        U second;
    };
    
    template <typename T>
    using IntPair = Pair<T, int>;
    
    // Template specialization
    template <>
    class Container<bool> {
        // Specialized version
    };
    
    // Functions
    void simpleFunction() {
        cout << "Simple function" << endl;
    }
    
    int add(int a, int b) {
        return a + b;
    }
    
    double calculateArea(double radius) {
        return radius * radius * 3.14159;
    }
    
    // Function with default parameters
    void greet(const string& name = "World") {
        cout << "Hello, " << name << endl;
    }
    
    // Template function
    template <typename T>
    T maximum(T a, T b) {
        return (a > b) ? a : b;
    }
    
    // Variadic template
    template <typename... Args>
    void printAll(Args... args) {
        // Implementation
    }
    
    // Inline function
    inline int square(int x) { return x * x; }
    
    // Constexpr function
    constexpr int factorial(int n) {
        return n <= 1 ? 1 : n * factorial(n - 1);
    }
    
    // Reference parameters
    void swap(int& a, int& b) {
        int temp = a;
        a = b;
        b = temp;
    }
    
    // Pointer parameters
    void modify(int* ptr) {
        if (ptr) *ptr = 42;
    }
    
    // Function pointers
    typedef int (*BinaryOp)(int, int);
    
    // Lambda functions
    auto lambda = [](int x) { return x * 2; };
    auto captureByValue = [x = 10]() { return x; };
    auto captureByRef = [&]() { return x; };
    
    // Operators - Arithmetic
    void arithmeticOps(int a, int b) {
        int result = a + b;
        result = a - b;
        result = a * b;
        result = a / b;
        result = a % b;
        a++;
        b--;
        a += 5;
        b -= 5;
    }
    
    // Operators - Bitwise
    void bitwiseOps(int a, int b) {
        int result = a & b;
        result = a | b;
        result = a ^ b;
        result = ~a;
        result = a << 1;
        result = a >> 1;
        a &= b;
        a |= b;
        a ^= b;
        a <<= 1;
        a >>= 1;
    }
    
    // Operators - Logical
    void logicalOps(bool a, bool b) {
        bool result = a && b;
        result = a || b;
        result = !a;
        result = a == b;
        result = a != b;
        result = a < b;
        result = a > b;
        result = a <= b;
        result = a >= b;
    }
    
    // Pointer operations
    void pointerOps(int* ptr, int& ref) {
        int* newPtr = &ref;  // Address-of operator
        int value = *ptr;    // Dereference operator
        int* arrPtr = new int[10];
        delete[] arrPtr;
    }
    
    // Type casting
    void typeCasting(void* voidPtr) {
        int* intPtr = static_cast<int*>(voidPtr);
        const int* constPtr = const_cast<int*>(intPtr);
        Animal* animal = dynamic_cast<Animal*>(nullptr);
        int value = reinterpret_cast<int>(voidPtr);
    }
    
    // Smart pointers
    void smartPointers() {
        unique_ptr<Animal> uniqueAnimal = make_unique<Dog>("Buddy", "Labrador");
        shared_ptr<Animal> sharedAnimal = make_shared<Dog>("Rex", "German Shepherd");
        weak_ptr<Animal> weakAnimal = sharedAnimal;
    }
    
    // RAII pattern
    class FileManager {
    private:
        FILE* file;
        
    public:
        FileManager(const string& filename) {
            file = fopen(filename.c_str(), "r");
        }
        
        ~FileManager() {
            if (file) fclose(file);
        }
    };
    
    // Control flow
    void controlFlow(int x) {
        // if-else
        if (x > 0) {
            cout << "Positive" << endl;
        } else if (x < 0) {
            cout << "Negative" << endl;
        } else {
            cout << "Zero" << endl;
        }
        
        // switch
        switch (x) {
            case 1:
                cout << "One" << endl;
                break;
            case 2:
            case 3:
                cout << "Two or three" << endl;
                break;
            default:
                cout << "Other" << endl;
        }
        
        // for loop
        for (int i = 0; i < 10; ++i) {
            if (i > 5) break;
            if (i == 3) continue;
            cout << i << endl;
        }
        
        // Range-based for loop
        vector<int> numbers = {1, 2, 3, 4, 5};
        for (int num : numbers) {
            cout << num << endl;
        }
        
        // while loop
        while (true) {
            break;
        }
        
        // do-while loop
        do {
            cout << "At least once" << endl;
        } while (false);
        
        // goto (not recommended)
        // goto label;
        // label:
    }
    
    // Exception handling
    void exceptionHandling() {
        try {
            throw runtime_error("Something went wrong");
        } catch (const runtime_error& e) {
            cerr << e.what() << endl;
        } catch (const exception& e) {
            cerr << "Exception: " << e.what() << endl;
        } catch (...) {
            cerr << "Unknown exception" << endl;
        }
    }
    
    // Noexcept specification
    void noexceptFunction() noexcept {
        // Won't throw
    }
    
    void mayThrowFunction() noexcept(false) {
        // May throw
    }
    
    // Comments with special syntax
    // TODO: Implement this feature
    // FIXME: Fix the bug here
    // NOTE: This is important
    // HACK: Temporary workaround
}

// Using declarations
using MyNamespace::Animal;
using MyNamespace::Dog;
using namespace MyNamespace;

// Main function
int main(int argc, char* argv[]) {
    cout << "Hello, World!" << endl;
    
    Dog myDog("Buddy", "Labrador");
    myDog.speak();
    
    return 0;
}
