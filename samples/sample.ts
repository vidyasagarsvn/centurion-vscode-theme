/**
 * JavaScript/TypeScript sample demonstrating all token types and syntax.
 */

// Single line comment
/* Multi-line
   comment */

// Keywords and imports
import * as os from 'os';
import { readFile, writeFile } from 'fs';
import type { SomeType } from 'module';
export default class Example {}
export { something, another as alias };

// Variables and constants
const CONSTANT = 42;
let mutableVar = "string";
var legacyVar = true;

// Primitive types and literals
const numberLit = 3.14;
const hexNum = 0xFF;
const binaryNum = 0b1010;
const octalNum = 0o755;
const bigInt = 1234567890n;
const stringLit = "double quote";
const singleQuote = 'single quote';
const templateLit = `template ${numberLit}`;
const multiline = `multi
line
template`;
const escaped = "escaped\nstring\t\"quotes\"";

// Booleans and null
const isTrue = true;
const isFalse = false;
const isEmpty = null;
const notDefined = undefined;

// Arrays and objects
const array = [1, 2, 3, 4, 5];
const tuple: [string, number] = ["text", 42];
const object = {
  key: "value",
  number: 123,
  nested: {
    deep: "value"
  },
  method() {
    return this.key;
  },
  [dynamicKey]: "computed"
};

// Spread and rest operators
const spread = [...array];
const objSpread = { ...object };
function restParams(first, ...rest) {
  return rest;
}

// Destructuring
const [first, second, ...remaining] = array;
const { key, nested: { deep } } = object;
const { a = 10, b: renamed } = { a: 5 };

// Arrow functions and regular functions
const arrowFunc = (x: number): number => x * 2;
const arrowMultiline = (x, y) => {
  return x + y;
};

function regularFunc(name: string): string {
  return `Hello, ${name}`;
}

function* generatorFunc() {
  yield 1;
  yield 2;
  yield* anotherGenerator();
}

async function asyncFunc(): Promise<void> {
  const result = await somePromise();
}

async function* asyncGenFunc() {
  yield await someAsync();
}

// Classes
class Animal {
  protected name: string;
  private _age: number;
  public static species: string = "Unknown";
  readonly id: number;

  constructor(name: string, age: number) {
    this.name = name;
    this._age = age;
    this.id = Math.random();
  }

  move(distance: number = 0): void {
    console.log(`${this.name} moved ${distance} meters`);
  }

  get age(): number {
    return this._age;
  }

  set age(value: number) {
    this._age = value;
  }

  static createAnimal(name: string): Animal {
    return new Animal(name, 0);
  }

  abstract describe(): string;
}

class Dog extends Animal {
  private breed: string;

  constructor(name: string, age: number, breed: string) {
    super(name, age);
    this.breed = breed;
  }

  describe(): string {
    return `${this.name} is a ${this.breed}`;
  }

  override move(distance: number = 5): void {
    super.move(distance);
  }
}

// Interfaces and types
interface Person {
  name: string;
  age: number;
  greet(): void;
}

type PersonType = {
  name: string;
  age: number;
};

type UnionType = string | number | boolean;
type IntersectionType = Person & { id: number };

// Generic functions and classes
function identity<T>(value: T): T {
  return value;
}

class Container<T> {
  constructor(private value: T) {}
  getValue(): T {
    return this.value;
  }
}

// Operators - Arithmetic
let result = 10 + 5;
result = 10 - 5;
result = 10 * 5;
result = 10 / 5;
result = 10 % 3;
result = 2 ** 3;
result++;
result--;
result += 5;
result -= 5;

// Operators - Bitwise
result = 5 & 3;
result = 5 | 3;
result = 5 ^ 3;
result = ~5;
result = 5 << 1;
result = 5 >> 1;
result = 5 >>> 1;

// Operators - Logical
const logical = true && false || !true;
const nullCoalesce = null ?? "default";
const optional = object?.key?.nested?.deep;

// Operators - Comparison
const comparison = 5 === 5;
const notEqual = 5 !== "5";
const lessThan = 5 < 10;
const greaterThan = 10 > 5;
const lessOrEqual = 5 <= 5;
const greaterOrEqual = 10 >= 5;
const instanceOf = {} instanceof Object;

// Control flow
if (true) {
  // block
} else if (false) {
  // block
} else {
  // block
}

switch (result) {
  case 1:
    break;
  case 2:
    // fall through
  default:
    break;
}

for (let i = 0; i < 10; i++) {
  if (i > 5) break;
  if (i === 3) continue;
}

for (const key in object) {
  console.log(key);
}

for (const item of array) {
  console.log(item);
}

while (true) {
  break;
}

do {
  // block
} while (false);

// Try-catch
try {
  throw new Error("Something went wrong");
} catch (error) {
  console.error(error);
} finally {
  console.log("Cleanup");
}

// Ternary operator
const ternary = true ? "yes" : "no";

// Conditional chains
const chain = result > 10 ? "big" : result > 5 ? "medium" : "small";

// Template literals with expressions
const template = `Result: ${result}, Comparison: ${comparison}`;

// Regular expressions
const regex = /pattern/;
const regexGlobal = /test/gi;
const regexString = new RegExp("dynamic", "g");

// Comments with special syntax
// TODO: Fix this later
// FIXME: This is broken
// NOTE: Important observation
// HACK: Quick fix

// Enum (TypeScript)
enum Direction {
  Up = 1,
  Down = 2,
  Left = "LEFT",
  Right = "RIGHT"
}

// Decorators (TypeScript experimental)
@deprecated
@validate
class DecoratedClass {
  @observable
  property: string = "value";

  @memoize
  method() {
    return this.property;
  }
}

// Namespace (TypeScript)
namespace Utils {
  export function helper() {
    return "help";
  }
}

// Module re-export
export * from './other-module';

// CommonJS (fallback)
module.exports = { Example, Animal, Dog };
require('some-module');
