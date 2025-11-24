/**
 * C# sample demonstrating all token types and syntax.
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.IO;
using static System.Math;

// Alias
using StringList = System.Collections.Generic.List<string>;

// Comments
// Single line comment
/* Multi-line
   comment */
/// <summary>
/// XML documentation comment
/// </summary>

namespace MyNamespace
{
    // Numeric literals
    class LiteralExamples
    {
        int decimal_int = 1234;
        int hex_int = 0xDEADBEEF;
        int binary_int = 0b1010_1010;
        long long_num = 1000L;
        ulong ulong_num = 1000UL;
        float float_num = 3.14f;
        double double_num = 2.718;
        decimal decimal_num = 9.99m;
        double scientific = 1.5e-3;
        
        // String literals
        string regular = "string";
        string verbatim = @"C:\path\to\file
multiline";
        string interpolated = $"Value: {decimal_int}";
        string interpolatedVerbatim = $@"Raw: {decimal_int}";
        
        // Character literals
        char charLit = 'A';
        char escaped = '\n';
        char unicode = '\u0041';
        
        // Boolean
        bool isTrue = true;
        bool isFalse = false;
        
        // Null
        object nullValue = null;
    }
    
    // Enums
    public enum Color { Red, Green, Blue }
    public enum Status : byte { Idle = 0, Running = 1, Stopped = 2 }
    
    [Flags]
    public enum Permissions : int { Read = 1, Write = 2, Execute = 4 }
    
    // Structures
    public struct Point
    {
        public int X { get; set; }
        public int Y { get; set; }
        
        public Point(int x, int y)
        {
            X = x;
            Y = y;
        }
    }
    
    // Interfaces
    public interface IAnimal
    {
        void Speak();
        int Age { get; set; }
    }
    
    public interface IMovable
    {
        void Move(int distance);
    }
    
    // Abstract class
    public abstract class Animal : IAnimal
    {
        public string Name { get; set; }
        public int Age { get; set; }
        
        protected Animal(string name, int age)
        {
            Name = name;
            Age = age;
        }
        
        public virtual void Speak()
        {
            Console.WriteLine($"{Name} makes a sound");
        }
        
        public abstract void MakeNoise();
    }
    
    // Regular class
    public class Dog : Animal, IMovable
    {
        private string breed;
        
        // Auto-properties
        public string Breed
        {
            get { return breed; }
            set { breed = value; }
        }
        
        // Expression-bodied property
        public string BreedInfo => $"Breed: {breed}";
        
        // Backing field
        private int _age;
        public new int Age
        {
            get { return _age; }
            set { _age = value; }
        }
        
        // Init-only property (C# 9.0)
        public string Owner { get; init; }
        
        // Required property (C# 11.0)
        public required string Id { get; set; }
        
        // Constructor
        public Dog(string name, string breed) : base(name, 0)
        {
            this.breed = breed;
        }
        
        // Constructor chaining
        public Dog(string name, string breed, int age) : this(name, breed)
        {
            Age = age;
        }
        
        // Method
        public override void Speak()
        {
            Console.WriteLine("Woof!");
        }
        
        public override void MakeNoise()
        {
            Console.WriteLine("Bark bark");
        }
        
        // Expression-bodied method
        public void Move(int distance) => Console.WriteLine($"Moved {distance} meters");
        
        // Sealed override
        public sealed override void Speak() => base.Speak();
        
        // Static method
        public static Dog CreateDefault()
        {
            return new Dog("Buddy", "Labrador");
        }
        
        // Static constructor
        static Dog()
        {
            // Static initialization
        }
        
        // Operator overloading
        public static bool operator ==(Dog left, Dog right)
        {
            return left.Name == right.Name;
        }
        
        public static bool operator !=(Dog left, Dog right)
        {
            return !(left == right);
        }
        
        public static Dog operator +(Dog d1, Dog d2)
        {
            return new Dog($"{d1.Name}+{d2.Name}", "Mixed");
        }
        
        // Conversion operators
        public static explicit operator string(Dog dog)
        {
            return dog.Name;
        }
        
        public static implicit operator Dog(string name)
        {
            return new Dog(name, "Unknown");
        }
        
        // Indexer
        public string this[int index]
        {
            get { return $"Item{index}"; }
            set { }
        }
    }
    
    // Generic class
    public class Container<T> where T : class
    {
        private List<T> items = new List<T>();
        
        public void Add(T item) => items.Add(item);
        public T Get(int index) => items[index];
        public IEnumerable<T> GetAll() => items;
    }
    
    // Generic with constraints
    public class Repository<T> where T : IAnimal, new()
    {
        public T Create() => new T();
    }
    
    // Record class (C# 9.0)
    public record PersonRecord(string Name, int Age);
    
    public record Dog_Record(string Name, string Breed) : Animal(Name, 0)
    {
        public override void MakeNoise() => Console.WriteLine("Woof");
    }
    
    // Anonymous type (created inline)
    var anonymous = new { Name = "John", Age = 30 };
    
    // Delegate
    public delegate void AnimalEventHandler(Animal animal);
    
    // Event
    public class AnimalShelter
    {
        public event AnimalEventHandler AnimalArrived;
        
        public void Register(Animal animal)
        {
            AnimalArrived?.Invoke(animal);
        }
    }
    
    // Lambda and expression trees
    public class ExpressionExamples
    {
        Func<int, int> square = x => x * x;
        Func<int, int, int> add = (x, y) => x + y;
        Func<int, int, int> multiline = (x, y) =>
        {
            int result = x + y;
            return result * 2;
        };
        
        Action<string> print = msg => Console.WriteLine(msg);
        
        Predicate<int> isEven = n => n % 2 == 0;
    }
    
    // Extension methods
    public static class StringExtensions
    {
        public static string Reverse(this string str)
        {
            return new string(str.Reverse().ToArray());
        }
    }
    
    // Partial class
    public partial class PartialExample
    {
        public void Method1() { }
    }
    
    public partial class PartialExample
    {
        public void Method2() { }
    }
    
    // Control flow
    public class ControlFlow
    {
        public void Example(int x)
        {
            // if-else
            if (x > 0)
            {
                Console.WriteLine("Positive");
            }
            else if (x < 0)
            {
                Console.WriteLine("Negative");
            }
            else
            {
                Console.WriteLine("Zero");
            }
            
            // Switch expression (C# 8.0)
            string result = x switch
            {
                > 0 => "Positive",
                < 0 => "Negative",
                _ => "Zero"
            };
            
            // Traditional switch
            switch (x)
            {
                case 1:
                    Console.WriteLine("One");
                    break;
                case 2:
                case 3:
                    Console.WriteLine("Two or three");
                    break;
                default:
                    break;
            }
            
            // for loop
            for (int i = 0; i < 10; i++)
            {
                if (i > 5) break;
                if (i == 3) continue;
                Console.WriteLine(i);
            }
            
            // foreach loop
            var numbers = new[] { 1, 2, 3, 4, 5 };
            foreach (int num in numbers)
            {
                Console.WriteLine(num);
            }
            
            // while loop
            while (true)
            {
                break;
            }
            
            // do-while loop
            do
            {
                Console.WriteLine("At least once");
            } while (false);
        }
    }
    
    // Exception handling
    public class ExceptionHandling
    {
        public void Example()
        {
            try
            {
                throw new InvalidOperationException("Error");
            }
            catch (ArgumentNullException ex)
            {
                Console.WriteLine($"Null argument: {ex.Message}");
            }
            catch (InvalidOperationException ex) when (ex.Message.Contains("Error"))
            {
                Console.WriteLine("Caught specific error");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                Console.WriteLine("Cleanup");
            }
        }
    }
    
    // LINQ examples
    public class LINQExamples
    {
        public void Example()
        {
            var numbers = new[] { 1, 2, 3, 4, 5, 6 };
            
            // Method syntax
            var result1 = numbers.Where(x => x > 2)
                                 .Select(x => x * 2)
                                 .ToList();
            
            // Query syntax
            var result2 = from num in numbers
                         where num > 2
                         select num * 2;
            
            // Complex query
            var result3 = from num in numbers
                         where num > 2
                         group num by num % 2 into g
                         select new { Remainder = g.Key, Count = g.Count() };
            
            // Let clause
            var result4 = from num in numbers
                         let squared = num * num
                         where squared > 10
                         select squared;
            
            // Join
            var result5 = from num in numbers
                         join n in numbers on num equals n into g
                         select new { num, Count = g.Count() };
        }
    }
    
    // Async/await
    public class AsyncExamples
    {
        public async Task SimpleAsync()
        {
            await Task.Delay(1000);
            Console.WriteLine("Done");
        }
        
        public async Task<int> ReturnValue()
        {
            await Task.Delay(500);
            return 42;
        }
        
        public async Task MultipleAwaits()
        {
            var task1 = Task.Delay(100);
            var task2 = Task.Delay(200);
            
            await task1;
            await task2;
            
            await Task.WhenAll(task1, task2);
            await Task.WhenAny(task1, task2);
        }
    }
    
    // Attributes
    [Serializable]
    [Obsolete("Use NewClass instead", false)]
    public class AttributeExample
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Style", "")]
        public void Method()
        {
        }
    }
    
    // Nullable reference types (C# 8.0)
    public class NullableExample
    {
        public string? NullableString { get; set; }
        public string NonNullableString { get; set; } = "";
        
        public void Method(string? value)
        {
            if (value is not null)
            {
                Console.WriteLine(value);
            }
        }
    }
    
    // Pattern matching (C# 7.0+)
    public class PatternMatching
    {
        public void Example(object obj)
        {
            // Type pattern
            if (obj is Dog dog)
            {
                Console.WriteLine(dog.Breed);
            }
            
            // Property pattern
            if (obj is Dog { Age: > 5 })
            {
                Console.WriteLine("Old dog");
            }
            
            // Relational pattern
            if (obj is int { } x && x > 10)
            {
                Console.WriteLine("Large number");
            }
            
            // List pattern (C# 11.0)
            if (obj is [1, 2, ..])
            {
                Console.WriteLine("Starts with 1, 2");
            }
        }
    }
    
    // Operators - Arithmetic
    public void ArithmeticOps(int a, int b)
    {
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
    public void BitwiseOps(int a, int b)
    {
        int result = a & b;
        result = a | b;
        result = a ^ b;
        result = ~a;
        result = a << 1;
        result = a >> 1;
        a &= b;
        a |= b;
    }
    
    // Operators - Logical
    public void LogicalOps(bool a, bool b)
    {
        bool result = a && b;
        result = a || b;
        result = !a;
        result = a == b;
        result = a != b;
        result = a < b;
        result = a > b;
    }
    
    // Null-coalescing and null-conditional
    public void NullOps(string? str, Dog? dog)
    {
        string value = str ?? "default";
        int? length = str?.Length;
        string? breed = dog?.Breed;
        string result = dog?.Breed ?? "Unknown";
    }
    
    // Using statements (C# 8.0+)
    public void UsingDeclaration()
    {
        using var file = new FileStream("test.txt", FileMode.Open);
        // File is automatically disposed
    }
    
    // Using declarations (traditional)
    public void TraditionalUsing()
    {
        using (var file = new FileStream("test.txt", FileMode.Open))
        {
            // Use file
        }
    }
    
    // Tuple
    public (string Name, int Age) GetPerson()
    {
        return ("John", 30);
    }
    
    public void DeconstructTuple()
    {
        var (name, age) = GetPerson();
    }
    
    // Comments with special syntax
    // TODO: Complete this
    // FIXME: Fix the bug
    // NOTE: Important
    // HACK: Temporary fix
}

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Hello, World!");
    }
}
