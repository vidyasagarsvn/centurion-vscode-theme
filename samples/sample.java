/**
 * Java sample demonstrating all token types and syntax.
 */

package com.example.theme;

import java.io.*;
import java.util.*;
import java.util.stream.*;
import static java.lang.Math.*;
import static java.util.Collections.emptyList;

// Single line comment
/* Multi-line
   comment */
/** JavaDoc comment */

public class ComprehensiveExample {
    // Constants
    private static final int CONSTANT = 42;
    private static final String DEFAULT_NAME = "Default";
    private static final double PI_VALUE = 3.14159;
    
    // Class variables
    static int staticVar = 100;
    
    // Instance variables
    private String name;
    protected int age;
    public boolean isActive;
    private volatile boolean flag;
    private transient String tempData;
    private final long id;
    
    // Numeric literals
    private int decimal = 1234;
    private int hex = 0xDEADBEEF;
    private int binary = 0b1010_1010;
    private int octal = 0755;
    private long longNum = 1000L;
    private float floatNum = 3.14f;
    private double doubleNum = 2.718;
    private double scientific = 1.5e-3;
    
    // String literals
    private String single = "string";
    private String withEscape = "line1\nline2\ttabbed";
    private String unicode = "unicode\u0041\u0042";
    private String textBlock = """
            This is a text block
            spanning multiple lines
            without explicit escapes
            """;
    
    // Constructors
    public ComprehensiveExample(String name) {
        this.name = name;
        this.id = System.currentTimeMillis();
    }
    
    private ComprehensiveExample(String name, int age) {
        this(name);
        this.age = age;
    }
    
    // Methods
    public void publicMethod() {
        System.out.println("Public method");
    }
    
    protected void protectedMethod() {
        System.out.println("Protected method");
    }
    
    private void privateMethod() {
        System.out.println("Private method");
    }
    
    package private void packagePrivateMethod() {
        System.out.println("Package private");
    }
    
    static void staticMethod() {
        System.out.println("Static method");
    }
    
    synchronized void synchronizedMethod() {
        System.out.println("Synchronized");
    }
    
    native void nativeMethod();
    
    abstract void abstractMethod();
    
    strictfp void strictfpMethod() {
        System.out.println("Strict floating point");
    }
    
    // Generic methods
    public <T> T identity(T value) {
        return value;
    }
    
    public <T extends Number> T getNumber(T value) {
        return value;
    }
    
    public <K, V> void mapMethod(Map<K, V> map) {
        System.out.println(map);
    }
    
    // Varargs
    public void varargs(String... args) {
        for (String arg : args) {
            System.out.println(arg);
        }
    }
    
    // Return types
    public String returnString() { return "string"; }
    public int returnPrimitive() { return 42; }
    public List<String> returnGeneric() { return new ArrayList<>(); }
    public String[] returnArray() { return new String[0]; }
    public ? extends Number returnWildcard() { return 0; }
    
    // Annotations
    @Override
    public String toString() {
        return this.name;
    }
    
    @Deprecated
    public void oldMethod() {}
    
    @SuppressWarnings("unchecked")
    public void methodWithWarning() {}
    
    @FunctionalInterface
    public interface MyFunctionalInterface {
        void execute();
    }
    
    // Control flow
    public void controlFlow(int x) {
        // if-else
        if (x > 0) {
            System.out.println("Positive");
        } else if (x < 0) {
            System.out.println("Negative");
        } else {
            System.out.println("Zero");
        }
        
        // switch
        switch (x) {
            case 1:
                System.out.println("One");
                break;
            case 2, 3:  // Java 12+ multi-case
                System.out.println("Two or three");
                break;
            default:
                System.out.println("Other");
        }
        
        // Enhanced switch (Java 12+)
        String result = switch (x) {
            case 1 -> "One";
            case 2, 3 -> "Two or three";
            default -> "Other";
        };
        
        // Loops
        for (int i = 0; i < 10; i++) {
            if (i > 5) break;
            if (i == 3) continue;
            System.out.println(i);
        }
        
        // Enhanced for loop
        List<Integer> numbers = Arrays.asList(1, 2, 3);
        for (Integer number : numbers) {
            System.out.println(number);
        }
        
        // While loop
        while (true) {
            break;
        }
        
        // Do-while loop
        do {
            System.out.println("At least once");
        } while (false);
    }
    
    // Exception handling
    public void exceptionHandling() {
        try {
            throw new IOException("Error");
        } catch (IOException | FileNotFoundException e) {
            System.err.println(e);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.out.println("Cleanup");
        }
    }
    
    // Try with resources
    public void tryWithResources() throws IOException {
        try (FileReader reader = new FileReader("file.txt");
             BufferedReader buffer = new BufferedReader(reader)) {
            String line = buffer.readLine();
        }
    }
    
    // Operators - Arithmetic
    public void arithmeticOperators(int a, int b) {
        int add = a + b;
        int sub = a - b;
        int mul = a * b;
        int div = a / b;
        int mod = a % b;
        int pow = (int) Math.pow(a, b);
        a++;
        b--;
        a += 5;
        b -= 5;
    }
    
    // Operators - Bitwise
    public void bitwiseOperators(int a, int b) {
        int and = a & b;
        int or = a | b;
        int xor = a ^ b;
        int not = ~a;
        int lshift = a << 1;
        int rshift = a >> 1;
        int urshift = a >>> 1;
        a &= b;
        a |= b;
    }
    
    // Operators - Logical
    public void logicalOperators(boolean a, boolean b) {
        boolean and = a && b;
        boolean or = a || b;
        boolean not = !a;
        boolean ternary = a ? true : false;
    }
    
    // Operators - Comparison
    public void comparisonOperators(int a, int b) {
        boolean eq = a == b;
        boolean neq = a != b;
        boolean lt = a < b;
        boolean gt = a > b;
        boolean lte = a <= b;
        boolean gte = a >= b;
    }
    
    // instanceof operator
    public void instanceOfOperator(Object obj) {
        if (obj instanceof String) {
            String str = (String) obj;  // Traditional cast
        }
        if (obj instanceof String str) {  // Java 16+ pattern matching
            System.out.println(str);
        }
    }
    
    // Classes and inheritance
    public static class InnerClass {
        public void method() {}
    }
    
    private static class PrivateInnerClass {}
    
    public interface NestedInterface {
        void method();
    }
    
    // Anonymous class
    Runnable anonymous = new Runnable() {
        @Override
        public void run() {
            System.out.println("Anonymous class");
        }
    };
    
    // Lambda expressions
    Runnable lambda = () -> System.out.println("Lambda");
    MyFunctionalInterface lambdaArg = name -> System.out.println(name);
    
    // Method references
    Consumer<String> methodRef = System.out::println;
    Supplier<List<String>> constructor = ArrayList::new;
    
    // Streams API
    public void streamsAPI() {
        List<Integer> list = Arrays.asList(1, 2, 3, 4, 5);
        list.stream()
            .filter(x -> x > 2)
            .map(x -> x * 2)
            .forEach(System.out::println);
        
        list.parallelStream()
            .filter(x -> x > 2)
            .collect(Collectors.toList());
    }
    
    // Generics and wildcards
    public <T> void process(List<T> list) {}
    public void processBounded(List<? extends Number> list) {}
    public void processSuper(List<? super Integer> list) {}
    
    // Record class (Java 14+)
    public record Point(int x, int y) {}
    
    // Sealed class (Java 15+)
    public sealed class Shape permits Circle, Square {}
    public final class Circle extends Shape {}
    public final class Square extends Shape {}
    
    // Module system (Java 9+)
    // (Would be in module-info.java file)
    // module com.example { 
    //     requires java.base;
    //     exports com.example.api;
    // }
    
    // Comments with special syntax
    // TODO: Complete this implementation
    // FIXME: Fix the bug here
    // NOTE: This is important
    // HACK: Quick workaround
    
    // Main method
    public static void main(String[] args) {
        ComprehensiveExample example = new ComprehensiveExample("Test");
        example.publicMethod();
        staticMethod();
    }
}

// Top-level class (Java 21+)
// Could also define multiple classes here
