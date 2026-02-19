# Mythical Swift

A Test-Driven Development curriculum for learning Swift through mythical creatures.

## What Is This?

Mythical Swift teaches Swift idioms — value types, optionals, enums, protocols, generics, closures, and structured concurrency — through a progression of 11 mythical creatures. Each creature focuses on one primary Swift concept.

You work through compilation errors and failing tests one at a time, writing just enough code to make each test pass. The tests are the specification — read them carefully.

## Prerequisites

- Xcode (includes Swift 6.0+ and XCTest)
- macOS 15+
- A text editor and terminal

**Important:** Make sure `xcode-select` points to Xcode, not the standalone Command Line Tools:

```bash
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
```

## How To Use

```bash
git clone https://github.com/weytani/mythical-swift.git
cd mythical-swift

# Work on one creature at a time
CREATURE=Unicorn swift test
```

Each creature is its own Swift module. Use the `CREATURE` environment variable to select which creature to compile and test. This avoids compiling creatures you haven't started yet.

### The Workflow

1. Run `CREATURE=Unicorn swift test`
2. You'll see a **compilation error** like `Cannot find 'Unicorn' in scope` — this is expected!
3. Open the test file (`Tests/UnicornTests/UnicornTests.swift`) and read the first test
4. Open the source file (`Sources/Unicorn/Unicorn.swift`) and create the type
5. Run `CREATURE=Unicorn swift test` — the first test passes, the rest are skipped
6. Back in the test file, delete the next `throw XCTSkip(...)` line
7. Run tests again — watch it fail, write the code, make it pass
8. Repeat until all tests pass, then move to the next creature

The compilation error IS the "red" phase of TDD. In a statically typed language like Swift, the compiler is your first test.

## Creature Order

Work through creatures in order. Each builds on concepts from the previous one.

| # | Creature | Primary Concept |
|---|----------|----------------|
| 1 | Unicorn | Structs, init, stored/computed properties |
| 2 | Dragon | Classes, reference semantics, weak references |
| 3 | Hobbit | Optionals, guard let, optional chaining |
| 4 | Phoenix | Enums with associated values, pattern matching |
| 5 | Wizard | Protocols, conformance, protocol-typed collections |
| 6 | Sphinx | Error handling, throws, Result type |
| 7 | Chimera | Protocol extensions, default implementations |
| 8 | Shapeshifter | Generics, type constraints, associated types |
| 9 | Siren | Closures, higher-order functions, @escaping |
| 10 | Kraken | async/await, structured concurrency |
| 11 | Direwolf | Actors, isolation, Sendable |

## Project Structure

```
Sources/
  Unicorn/Unicorn.swift         # Your code goes here
  Dragon/Dragon.swift
  ...
Tests/
  UnicornTests/UnicornTests.swift   # Tests (delete XCTSkip lines to reveal)
  DragonTests/DragonTests.swift
  ...
```

Each creature is a separate Swift package target. You only compile the creature you're working on.

## No External Dependencies

This project uses only Swift's standard library and XCTest. No Quick, no Nimble, no SPM dependencies. Learning Swift means learning Swift's tools.
