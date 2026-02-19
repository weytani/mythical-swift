// ABOUTME: Tests for Dragon + Knight, the second creature in the TDD curriculum.
// ABOUTME: Teaches classes, reference semantics, mutation, ARC, and weak references.

import XCTest
@testable import Dragon

final class DragonTests: XCTestCase {

    // MARK: - Creation

    func testHasAName() throws {
        let dragon = Dragon(name: "Toothless")
        XCTAssertEqual(dragon.name, "Toothless")
    }

    func testStartsNotHappy() throws {
        throw XCTSkip("Delete this line to continue")
        let dragon = Dragon(name: "Toothless")
        XCTAssertFalse(dragon.isHappy)
    }

    // MARK: - Eating

    func testCanEatFood() throws {
        throw XCTSkip("Delete this line to continue")
        let dragon = Dragon(name: "Toothless")
        dragon.eat("sheep")
        XCTAssertEqual(dragon.foodsEaten, ["sheep"])
    }

    func testTracksMultipleFoods() throws {
        throw XCTSkip("Delete this line to continue")
        let dragon = Dragon(name: "Toothless")
        dragon.eat("sheep")
        dragon.eat("salad")
        dragon.eat("adventurer")
        XCTAssertEqual(dragon.foodsEaten.count, 3)
    }

    // MARK: - Happiness

    func testBecomesHappyWithGoodFood() throws {
        throw XCTSkip("Delete this line to continue")
        let dragon = Dragon(name: "Toothless")
        dragon.eat("sheep")
        dragon.eat("sheep")
        dragon.eat("sheep")
        XCTAssertTrue(dragon.isHappy)
    }

    func testSheepMakeItHappy() throws {
        throw XCTSkip("Delete this line to continue")
        let dragon = Dragon(name: "Toothless")
        dragon.eat("sheep")
        dragon.eat("sheep")
        XCTAssertFalse(dragon.isHappy)
        dragon.eat("sheep")
        XCTAssertTrue(dragon.isHappy)
    }

    func testAdventurersMakeItHappy() throws {
        throw XCTSkip("Delete this line to continue")
        let dragon = Dragon(name: "Toothless")
        dragon.eat("adventurer")
        dragon.eat("adventurer")
        dragon.eat("adventurer")
        XCTAssertTrue(dragon.isHappy)
    }

    func testSaladDoesNotCount() throws {
        throw XCTSkip("Delete this line to continue")
        let dragon = Dragon(name: "Toothless")
        dragon.eat("salad")
        dragon.eat("salad")
        dragon.eat("salad")
        XCTAssertFalse(dragon.isHappy)
    }

    // MARK: - Mood & Breathing

    func testMoodReflectsHappiness() throws {
        throw XCTSkip("Delete this line to continue")
        let dragon = Dragon(name: "Toothless")
        XCTAssertEqual(dragon.mood, "hungry")
        dragon.eat("sheep")
        dragon.eat("sheep")
        dragon.eat("sheep")
        XCTAssertEqual(dragon.mood, "happy")
    }

    func testBreathesFireWhenHappy() throws {
        throw XCTSkip("Delete this line to continue")
        let dragon = Dragon(name: "Toothless")
        XCTAssertEqual(dragon.breathe(), "...")
        dragon.eat("sheep")
        dragon.eat("sheep")
        dragon.eat("sheep")
        XCTAssertEqual(dragon.breathe(), "🔥")
    }

    // MARK: - Reference Semantics

    func testReferenceSemantics() throws {
        throw XCTSkip("Delete this line to continue")
        let dragon1 = Dragon(name: "Toothless")
        let dragon2 = dragon1
        dragon1.eat("sheep")
        XCTAssertEqual(dragon2.foodsEaten, ["sheep"])
    }

    func testWeakRivalDoesNotRetainKnight() throws {
        throw XCTSkip("Delete this line to continue")
        let dragon = Dragon(name: "Toothless")
        var knight: Knight? = Knight(name: "Hiccup")
        dragon.challenge(knight!)
        XCTAssertNotNil(dragon.rival)
        knight = nil
        XCTAssertNil(dragon.rival)
    }
}
