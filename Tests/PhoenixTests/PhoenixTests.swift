// ABOUTME: Tests for Phoenix, the fourth creature in the TDD curriculum.
// ABOUTME: Teaches enums with associated values, pattern matching, raw values, and CaseIterable.

import XCTest
@testable import Phoenix

final class PhoenixTests: XCTestCase {

    // MARK: - Creation

    func testHasAName() throws {
        let phoenix = Phoenix(name: "Fawkes")
        XCTAssertEqual(phoenix.name, "Fawkes")
    }

    func testHasADefaultElementOfFire() throws {
        throw XCTSkip("Delete this line to continue")
        let phoenix = Phoenix(name: "Fawkes")
        XCTAssertEqual(phoenix.element, .fire)
    }

    func testCanHaveADifferentElement() throws {
        throw XCTSkip("Delete this line to continue")
        let phoenix = Phoenix(name: "Blizzard", element: .ice)
        XCTAssertEqual(phoenix.element, .ice)
    }

    // MARK: - Element Enum

    func testElementHasRawStringValue() throws {
        throw XCTSkip("Delete this line to continue")
        XCTAssertEqual(Element.fire.rawValue, "fire")
        XCTAssertEqual(Element.ice.rawValue, "ice")
        XCTAssertEqual(Element.lightning.rawValue, "lightning")
        XCTAssertEqual(Element.shadow.rawValue, "shadow")
    }

    func testAllElementsAreIterable() throws {
        throw XCTSkip("Delete this line to continue")
        XCTAssertEqual(Element.allCases.count, 4)
    }

    // MARK: - Lifecycle State

    func testStartsAliveAtAge0() throws {
        throw XCTSkip("Delete this line to continue")
        let phoenix = Phoenix(name: "Fawkes")
        if case .alive(let age) = phoenix.state {
            XCTAssertEqual(age, 0)
        } else {
            XCTFail("Phoenix should start in alive state")
        }
    }

    func testIsAliveWhenAlive() throws {
        throw XCTSkip("Delete this line to continue")
        let phoenix = Phoenix(name: "Fawkes")
        XCTAssertTrue(phoenix.isAlive)
    }

    func testCanGrow() throws {
        throw XCTSkip("Delete this line to continue")
        var phoenix = Phoenix(name: "Fawkes")
        phoenix.grow()
        XCTAssertEqual(phoenix.age, 1)
    }

    func testAgeExtractsFromAliveState() throws {
        throw XCTSkip("Delete this line to continue")
        var phoenix = Phoenix(name: "Fawkes")
        XCTAssertEqual(phoenix.age, 0)
        phoenix.grow()
        phoenix.grow()
        XCTAssertEqual(phoenix.age, 2)
    }

    func testAgeIsNilWhenNotAlive() throws {
        throw XCTSkip("Delete this line to continue")
        var phoenix = Phoenix(name: "Fawkes")
        phoenix.burn()
        XCTAssertNil(phoenix.age)
    }

    // MARK: - Lifecycle Transitions

    func testBurnsToAshes() throws {
        throw XCTSkip("Delete this line to continue")
        var phoenix = Phoenix(name: "Fawkes")
        phoenix.burn()
        if case .ashes = phoenix.state {
            // correct
        } else {
            XCTFail("Phoenix should be ashes after burning")
        }
        XCTAssertFalse(phoenix.isAlive)
    }

    func testRisesFromAshes() throws {
        throw XCTSkip("Delete this line to continue")
        var phoenix = Phoenix(name: "Fawkes")
        phoenix.burn()
        phoenix.rise()
        if case .reborn(let n) = phoenix.state {
            XCTAssertEqual(n, 1)
        } else {
            XCTFail("Phoenix should be reborn after rising from ashes")
        }
        XCTAssertTrue(phoenix.isAlive)
    }

    func testBecomesEternalAfter3Rebirths() throws {
        throw XCTSkip("Delete this line to continue")
        var phoenix = Phoenix(name: "Fawkes")
        // Cycle 1
        phoenix.burn()
        phoenix.rise()
        // Cycle 2
        phoenix.burn()
        phoenix.rise()
        // Cycle 3
        phoenix.burn()
        phoenix.rise()
        if case .eternal = phoenix.state {
            // correct
        } else {
            XCTFail("Phoenix should be eternal after 3 rebirths")
        }
    }

    // MARK: - Description

    func testDescriptionChangesWithState() throws {
        throw XCTSkip("Delete this line to continue")
        var phoenix = Phoenix(name: "Fawkes")
        XCTAssertEqual(phoenix.description, "Fawkes the fire phoenix, age 0")
        phoenix.burn()
        XCTAssertEqual(phoenix.description, "Fawkes lies in ashes (reborn 0 times before)")
        phoenix.rise()
        XCTAssertEqual(phoenix.description, "Fawkes rises reborn! (1 times now)")
        phoenix.burn()
        phoenix.rise()
        phoenix.burn()
        phoenix.rise()
        XCTAssertEqual(phoenix.description, "Fawkes has transcended mortality")
    }

    func testGrowingTo100TriggersDeath() throws {
        throw XCTSkip("Delete this line to continue")
        var phoenix = Phoenix(name: "Fawkes")
        for _ in 0..<100 {
            phoenix.grow()
        }
        if case .ashes = phoenix.state {
            // correct
        } else {
            XCTFail("Phoenix should die at age 100")
        }
    }
}
