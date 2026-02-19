// ABOUTME: Tests for Unicorn, the first creature in the TDD curriculum.
// ABOUTME: Teaches structs, init, stored properties, computed properties, and value semantics.

import XCTest
@testable import Unicorn

final class UnicornTests: XCTestCase {

    // MARK: - Creation

    func testHasAName() throws {
        let unicorn = Unicorn(name: "Robert")
        XCTAssertEqual(unicorn.name, "Robert")
    }

    func testHasADefaultColorOfWhite() throws {
        throw XCTSkip("Delete this line to continue")
        let unicorn = Unicorn(name: "Robert")
        XCTAssertEqual(unicorn.color, "white")
    }

    func testCanBeGivenAColor() throws {
        throw XCTSkip("Delete this line to continue")
        let unicorn = Unicorn(name: "Sparkle", color: "purple")
        XCTAssertEqual(unicorn.color, "purple")
    }

    // MARK: - Properties

    func testCanGreet() throws {
        throw XCTSkip("Delete this line to continue")
        let unicorn = Unicorn(name: "Robert")
        XCTAssertEqual(unicorn.greeting, "Hi, I'm Robert the white unicorn.")
    }

    func testIsWhiteByDefault() throws {
        throw XCTSkip("Delete this line to continue")
        let unicorn = Unicorn(name: "Robert")
        XCTAssertTrue(unicorn.isWhite)
    }

    func testIsNotWhiteWhenGivenAnotherColor() throws {
        throw XCTSkip("Delete this line to continue")
        let unicorn = Unicorn(name: "Sparkle", color: "purple")
        XCTAssertFalse(unicorn.isWhite)
    }

    // MARK: - Value Semantics

    func testHasValueSemantics() throws {
        throw XCTSkip("Delete this line to continue")
        var original = Unicorn(name: "Robert")
        var copy = original
        copy.name = "Changed"
        XCTAssertEqual(original.name, "Robert")
        XCTAssertEqual(copy.name, "Changed")
    }

    func testTwoUnicornsWithSameNameAreIndependent() throws {
        throw XCTSkip("Delete this line to continue")
        var first = Unicorn(name: "Robert")
        var second = Unicorn(name: "Robert")
        first.name = "Modified"
        XCTAssertEqual(first.name, "Modified")
        XCTAssertEqual(second.name, "Robert")
    }
}
