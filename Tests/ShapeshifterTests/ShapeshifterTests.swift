// ABOUTME: Tests for Shapeshifter + Form types, the eighth creature in the TDD curriculum.
// ABOUTME: Teaches generics, type constraints, associated types, where clauses, and generic functions.

import XCTest
@testable import Shapeshifter

final class ShapeshifterTests: XCTestCase {

    // MARK: - Form Types

    func testWolfIsAForm() throws {
        let wolf = Wolf()
        XCTAssertEqual(wolf.formName, "wolf")
    }

    func testEagleIsAForm() throws {
        throw XCTSkip("Delete this line to continue")
        let eagle = Eagle()
        XCTAssertEqual(eagle.formName, "eagle")
    }

    func testShadowIsAFormWithDoublePower() throws {
        throw XCTSkip("Delete this line to continue")
        let shadow = Shadow()
        XCTAssertEqual(shadow.power, 9.5)
    }

    func testWolfDescribesItself() throws {
        throw XCTSkip("Delete this line to continue")
        let wolf = Wolf()
        XCTAssertEqual(wolf.describe(), "a fearsome wolf (power: 7)")
    }

    // MARK: - Shapeshifter

    func testShapeshifterHasAName() throws {
        throw XCTSkip("Delete this line to continue")
        let shifter = Shapeshifter(name: "Loki", currentForm: Wolf())
        XCTAssertEqual(shifter.name, "Loki")
    }

    func testShapeshifterHasACurrentForm() throws {
        throw XCTSkip("Delete this line to continue")
        let shifter = Shapeshifter(name: "Loki", currentForm: Wolf())
        XCTAssertEqual(shifter.currentForm.formName, "wolf")
    }

    func testCanShiftForms() throws {
        throw XCTSkip("Delete this line to continue")
        var shifter = Shapeshifter(name: "Loki", currentForm: Wolf())
        let newWolf = Wolf()
        shifter.shift(to: newWolf)
        XCTAssertEqual(shifter.currentForm.formName, "wolf")
        XCTAssertEqual(shifter.shiftCount, 1)
    }

    func testTracksShiftCount() throws {
        throw XCTSkip("Delete this line to continue")
        var shifter = Shapeshifter(name: "Loki", currentForm: Wolf())
        shifter.shift(to: Wolf())
        shifter.shift(to: Wolf())
        XCTAssertEqual(shifter.shiftCount, 2)
    }

    func testDescribesWithCurrentForm() throws {
        throw XCTSkip("Delete this line to continue")
        let shifter = Shapeshifter(name: "Loki", currentForm: Wolf())
        XCTAssertEqual(shifter.describe(), "Loki is currently a fearsome wolf (power: 7)")
    }

    // MARK: - Generic Function

    func testMostPowerfulGenericFunction() throws {
        throw XCTSkip("Delete this line to continue")
        let wolves = [Wolf(), Wolf()]
        let result = mostPowerful(wolves)
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.formName, "wolf")
        XCTAssertEqual(result?.power, 7)
    }

    func testMostPowerfulWithEmptyArray() throws {
        throw XCTSkip("Delete this line to continue")
        let result: Wolf? = mostPowerful([])
        XCTAssertNil(result)
    }

    // MARK: - Type Safety

    func testTypeConstraintEnforced() throws {
        throw XCTSkip("Delete this line to continue")
        let wolfShifter = Shapeshifter(name: "Loki", currentForm: Wolf())
        let eagleShifter = Shapeshifter(name: "Odin", currentForm: Eagle())
        XCTAssertEqual(wolfShifter.currentForm.formName, "wolf")
        XCTAssertEqual(eagleShifter.currentForm.formName, "eagle")
    }
}
