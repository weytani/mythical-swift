// ABOUTME: Tests for Wizard + Castable + Enchantable, the fifth creature in the TDD curriculum.
// ABOUTME: Teaches protocols, conformance, protocol-typed collections, and `any` existentials.

import XCTest
@testable import Wizard

final class WizardTests: XCTestCase {

    // MARK: - Creation

    func testHasAName() throws {
        let wizard = Wizard(name: "Gandalf")
        XCTAssertEqual(wizard.name, "Gandalf")
    }

    func testStartsWithNoSpells() throws {
        throw XCTSkip("Delete this line to continue")
        let wizard = Wizard(name: "Gandalf")
        XCTAssertEqual(wizard.spellCount, 0)
    }

    // MARK: - Spells

    func testSpellConformsToCastable() throws {
        throw XCTSkip("Delete this line to continue")
        let spell = Spell(name: "Fireball", power: 10)
        XCTAssertEqual(spell.cast(), "Casting Fireball with power 10!")
    }

    func testCanLearnASpell() throws {
        throw XCTSkip("Delete this line to continue")
        var wizard = Wizard(name: "Gandalf")
        wizard.learn(Spell(name: "Fireball", power: 10))
        XCTAssertEqual(wizard.spellCount, 1)
    }

    func testTracksSpellCount() throws {
        throw XCTSkip("Delete this line to continue")
        var wizard = Wizard(name: "Gandalf")
        wizard.learn(Spell(name: "Fireball", power: 10))
        wizard.learn(Spell(name: "Ice Blast", power: 8))
        XCTAssertEqual(wizard.spellCount, 2)
    }

    func testCastsAllSpells() throws {
        throw XCTSkip("Delete this line to continue")
        var wizard = Wizard(name: "Gandalf")
        wizard.learn(Spell(name: "Fireball", power: 10))
        wizard.learn(Spell(name: "Ice Blast", power: 8))
        let results = wizard.castAll()
        XCTAssertEqual(results, [
            "Casting Fireball with power 10!",
            "Casting Ice Blast with power 8!"
        ])
    }

    func testCanLearnMultipleSpells() throws {
        throw XCTSkip("Delete this line to continue")
        var wizard = Wizard(name: "Gandalf")
        wizard.learn(Spell(name: "Fireball", power: 10))
        wizard.learn(Spell(name: "Ice Blast", power: 8))
        wizard.learn(Spell(name: "Lightning", power: 12))
        let results = wizard.castAll()
        XCTAssertEqual(results.count, 3)
        XCTAssertTrue(results.contains("Casting Lightning with power 12!"))
    }

    func testFindsMostPowerfulSpell() throws {
        throw XCTSkip("Delete this line to continue")
        var wizard = Wizard(name: "Gandalf")
        wizard.learn(Spell(name: "Fireball", power: 10))
        wizard.learn(Spell(name: "Lightning", power: 12))
        wizard.learn(Spell(name: "Ice Blast", power: 8))
        let strongest = wizard.mostPowerful()
        let spell = try XCTUnwrap(strongest as? Spell)
        XCTAssertEqual(spell.power, 12)
    }

    func testMostPowerfulIsNilWithNoSpells() throws {
        throw XCTSkip("Delete this line to continue")
        let wizard = Wizard(name: "Gandalf")
        XCTAssertNil(wizard.mostPowerful())
    }

    // MARK: - Protocols

    func testProtocolTypedCollection() throws {
        throw XCTSkip("Delete this line to continue")
        let spells: [any Castable] = [
            Spell(name: "Fireball", power: 10),
            Spell(name: "Ice Blast", power: 8)
        ]
        XCTAssertEqual(spells.count, 2)
        XCTAssertEqual(spells[0].cast(), "Casting Fireball with power 10!")
    }

    func testWizardConformsToEnchantable() throws {
        throw XCTSkip("Delete this line to continue")
        let wizard = Wizard(name: "Gandalf")
        let enchanter: any Enchantable = wizard
        XCTAssertEqual(enchanter.enchant("sword"), "Gandalf enchants sword!")
    }

    func testWizardCanEnchant() throws {
        throw XCTSkip("Delete this line to continue")
        let wizard = Wizard(name: "Gandalf")
        XCTAssertEqual(wizard.enchant("sword"), "Gandalf enchants sword!")
    }
}
