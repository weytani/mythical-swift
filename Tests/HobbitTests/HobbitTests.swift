// ABOUTME: Tests for Hobbit, the third creature in the TDD curriculum.
// ABOUTME: Teaches optionals, guard let, optional chaining, nil coalescing, and if-let binding.

import XCTest
@testable import Hobbit

final class HobbitTests: XCTestCase {

    // MARK: - Creation

    func testHasAName() throws {
        let hobbit = Hobbit(name: "Bilbo")
        XCTAssertEqual(hobbit.name, "Bilbo")
    }

    func testStartsAtAge0() throws {
        throw XCTSkip("Delete this line to continue")
        let hobbit = Hobbit(name: "Bilbo")
        XCTAssertEqual(hobbit.age, 0)
    }

    func testPocketStartsNil() throws {
        throw XCTSkip("Delete this line to continue")
        let hobbit = Hobbit(name: "Bilbo")
        XCTAssertNil(hobbit.pocketItem)
    }

    func testReputationStartsNil() throws {
        throw XCTSkip("Delete this line to continue")
        let hobbit = Hobbit(name: "Bilbo")
        XCTAssertNil(hobbit.reputation)
    }

    // MARK: - Aging

    func testCanCelebrateBirthdays() throws {
        throw XCTSkip("Delete this line to continue")
        var hobbit = Hobbit(name: "Bilbo")
        hobbit.celebrateBirthday()
        XCTAssertEqual(hobbit.age, 1)
    }

    func testIsNotAdultAt32() throws {
        throw XCTSkip("Delete this line to continue")
        var hobbit = Hobbit(name: "Bilbo")
        for _ in 1...32 {
            hobbit.celebrateBirthday()
        }
        XCTAssertFalse(hobbit.isAdult)
    }

    func testBecomesAdultAt33() throws {
        throw XCTSkip("Delete this line to continue")
        var hobbit = Hobbit(name: "Bilbo")
        for _ in 1...33 {
            hobbit.celebrateBirthday()
        }
        XCTAssertTrue(hobbit.isAdult)
    }

    func testEarnsReputationAt33() throws {
        throw XCTSkip("Delete this line to continue")
        var hobbit = Hobbit(name: "Bilbo")
        for _ in 1...33 {
            hobbit.celebrateBirthday()
        }
        XCTAssertEqual(hobbit.reputation, "Respected")
    }

    // MARK: - Pocket

    func testCanPickUpItems() throws {
        throw XCTSkip("Delete this line to continue")
        var hobbit = Hobbit(name: "Bilbo")
        hobbit.pickUp("ring")
        XCTAssertEqual(hobbit.pocketItem, "ring")
    }

    func testCanDropItems() throws {
        throw XCTSkip("Delete this line to continue")
        var hobbit = Hobbit(name: "Bilbo")
        hobbit.pickUp("ring")
        let dropped = hobbit.dropItem()
        XCTAssertEqual(dropped, "ring")
        XCTAssertNil(hobbit.pocketItem)
    }

    func testDroppingFromEmptyPocketReturnsNil() throws {
        throw XCTSkip("Delete this line to continue")
        var hobbit = Hobbit(name: "Bilbo")
        let dropped = hobbit.dropItem()
        XCTAssertNil(dropped)
    }

    // MARK: - Reputation

    func testDisplayReputationUsesNilCoalescing() throws {
        throw XCTSkip("Delete this line to continue")
        var hobbit = Hobbit(name: "Bilbo")
        XCTAssertEqual(hobbit.displayReputation, "unknown")
        for _ in 1...33 {
            hobbit.celebrateBirthday()
        }
        XCTAssertEqual(hobbit.displayReputation, "Respected")
    }

    // MARK: - Optional Patterns

    func testPocketDescriptionUsesOptionalBinding() throws {
        throw XCTSkip("Delete this line to continue")
        var hobbit = Hobbit(name: "Bilbo")
        XCTAssertEqual(hobbit.pocketDescription, "Bilbo has empty pockets")
        hobbit.pickUp("ring")
        XCTAssertEqual(hobbit.pocketDescription, "Bilbo has ring")
    }

    func testGreetingUsesGuardLet() throws {
        throw XCTSkip("Delete this line to continue")
        var hobbit = Hobbit(name: "Bilbo")
        XCTAssertEqual(hobbit.greeting(), "I'm Bilbo, a simple hobbit")
        for _ in 1...33 {
            hobbit.celebrateBirthday()
        }
        XCTAssertEqual(hobbit.greeting(), "I'm Bilbo, Respected hobbit")
    }

    func testInspectPocketUsesOptionalChaining() throws {
        throw XCTSkip("Delete this line to continue")
        var hobbit = Hobbit(name: "Bilbo")
        XCTAssertNil(hobbit.inspectPocket())
        hobbit.pickUp("ring")
        XCTAssertEqual(hobbit.inspectPocket(), 4)
    }
}
