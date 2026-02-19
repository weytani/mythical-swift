# Mythical Swift

A Test-Driven Development curriculum for learning Swift through mythical creatures.

## What Is This?

Mythical Swift teaches Swift idioms — value types, optionals, enums, protocols, generics, closures, and structured concurrency — through a progression of 11 mythical creatures. Each creature focuses on one primary Swift concept.

You work through compilation errors and failing tests one at a time, writing just enough code to make each test pass. The tests are the specification — read them carefully.

## Prerequisites

- Xcode (includes Swift 6.0+ and XCTest)
- macOS 15+

## Getting Started

```bash
git clone https://github.com/weytani/mythical-swift.git
```

Open the `mythical-swift` folder in Xcode (File > Open, or `open mythical-swift/Package.swift`).

### The Workflow

1. Select **UnicornTests** from the scheme picker in the toolbar
2. Press **Cmd+U** to run tests
3. You'll see a **compilation error** like `Cannot find 'Unicorn' in scope` — this is expected!
4. Open the test file (`Tests/UnicornTests/UnicornTests.swift`) and read the first test
5. Open the source file (`Sources/Unicorn/Unicorn.swift`) and create the type
6. Press **Cmd+U** again — the first test passes, the rest are skipped
7. Back in the test file, delete the next `throw XCTSkip(...)` line
8. Press **Cmd+U** — watch it fail, write the code, make it pass
9. Repeat until all tests pass, then select the next creature's test scheme

The compilation error IS the "red" phase of TDD. In a statically typed language like Swift, the compiler is your first test.

### Command Line Alternative

If you prefer the terminal, use the `CREATURE` environment variable to select which creature to compile and test:

```bash
CREATURE=Unicorn swift test
```

This avoids compiling creatures you haven't started yet.

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
