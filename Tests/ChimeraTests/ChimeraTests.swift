// ABOUTME: Tests for Chimera + Fightable + Healable + Transformable, the seventh creature in the TDD curriculum.
// ABOUTME: Teaches protocol extensions, default implementations, retroactive conformance, and protocol composition.

import XCTest
@testable import Chimera

/// A simple warrior that uses the default Fightable attack implementation.
private struct SimpleWarrior: Fightable {
    let strength: Int
}

final class ChimeraTests: XCTestCase {

    // MARK: - Creation

    func testHasAName() throws {
        let chimera = Chimera(name: "Spike")
        XCTAssertEqual(chimera.name, "Spike")
    }

    func testHasDefaultHealthAndStrength() throws {
        throw XCTSkip("Delete this line to continue")
        let chimera = Chimera(name: "Spike")
        XCTAssertEqual(chimera.healthPoints, 100)
        XCTAssertEqual(chimera.strength, 15)
    }

    // MARK: - Protocol Defaults

    func testFightableHasDefaultAttack() throws {
        throw XCTSkip("Delete this line to continue")
        let warrior = SimpleWarrior(strength: 5)
        XCTAssertEqual(warrior.attack(), "Attacks with strength 5!")
    }

    func testChimeraOverridesAttack() throws {
        throw XCTSkip("Delete this line to continue")
        let chimera = Chimera(name: "Spike")
        XCTAssertEqual(chimera.attack(), "Spike attacks as a chimera with strength 15!")
    }

    func testHealableHasDefaultHeal() throws {
        throw XCTSkip("Delete this line to continue")
        var chimera = Chimera(name: "Spike")
        chimera.healthPoints = 50
        chimera.heal(amount: 20)
        XCTAssertEqual(chimera.healthPoints, 70)
    }

    func testHealCapsAt100() throws {
        throw XCTSkip("Delete this line to continue")
        var chimera = Chimera(name: "Spike")
        chimera.heal(amount: 200)
        XCTAssertEqual(chimera.healthPoints, 100)
    }

    // MARK: - Transformation

    func testChimeraCanTransform() throws {
        throw XCTSkip("Delete this line to continue")
        var chimera = Chimera(name: "Spike")
        _ = chimera.transform(to: "dragon")
        XCTAssertEqual(chimera.currentForm, "dragon")
    }

    func testTracksFormsUsed() throws {
        throw XCTSkip("Delete this line to continue")
        var chimera = Chimera(name: "Spike")
        _ = chimera.transform(to: "dragon")
        _ = chimera.transform(to: "serpent")
        XCTAssertTrue(chimera.formsUsed.contains("dragon"))
        XCTAssertTrue(chimera.formsUsed.contains("serpent"))
    }

    // MARK: - Retroactive Conformance

    func testStringRetroactivelyConformsToFightable() throws {
        throw XCTSkip("Delete this line to continue")
        XCTAssertEqual("hello".attack(), "Attacks with strength 5!")
    }

    func testStringStrengthIsCharacterCount() throws {
        throw XCTSkip("Delete this line to continue")
        XCTAssertEqual("hello".strength, 5)
    }

    // MARK: - Composition

    func testChimeraConformsToMythical() throws {
        throw XCTSkip("Delete this line to continue")
        var chimera = Chimera(name: "Spike")
        let creature: any Mythical = chimera
        XCTAssertEqual(creature.strength, 15)
    }

    func testProtocolCompositionWorks() throws {
        throw XCTSkip("Delete this line to continue")
        let chimera = Chimera(name: "Spike")
        let result = describeFighter(chimera)
        XCTAssertEqual(result, "Spike attacks as a chimera with strength 15!")
    }

    func testDefaultImplementationsAreInherited() throws {
        throw XCTSkip("Delete this line to continue")
        var chimera = Chimera(name: "Spike")
        chimera.healthPoints = 80
        chimera.heal(amount: 10)
        XCTAssertEqual(chimera.healthPoints, 90)
    }

    // MARK: - Helpers

    private func describeFighter(_ creature: any Fightable & Healable) -> String {
        creature.attack()
    }
}
