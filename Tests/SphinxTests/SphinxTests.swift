// ABOUTME: Tests for Sphinx + RiddleError, the sixth creature in the TDD curriculum.
// ABOUTME: Teaches error handling — throws, do-catch, Result, and custom Error types.

import XCTest
@testable import Sphinx

final class SphinxTests: XCTestCase {

    // MARK: - Creation

    func testStartsWithRiddles() throws {
        let sphinx = Sphinx()
        XCTAssertGreaterThan(sphinx.riddlesRemaining, 0)
    }

    // MARK: - Answering

    func testCanAskARiddle() throws {
        throw XCTSkip("Delete this line to continue")
        var sphinx = Sphinx()
        let riddle = try sphinx.askRiddle()
        XCTAssertFalse(riddle.isEmpty)
    }

    func testAnsweringCorrectlyReturnsTrue() throws {
        throw XCTSkip("Delete this line to continue")
        var sphinx = Sphinx()
        _ = try sphinx.askRiddle()
        let result = try sphinx.answer("clock")
        XCTAssertTrue(result)
    }

    func testTracksCorrectCount() throws {
        throw XCTSkip("Delete this line to continue")
        var sphinx = Sphinx()
        _ = try sphinx.askRiddle()
        _ = try sphinx.answer("clock")
        XCTAssertEqual(sphinx.correctCount, 1)
    }

    // MARK: - Error Cases

    func testAnsweringWrongThrowsWrongAnswer() throws {
        throw XCTSkip("Delete this line to continue")
        var sphinx = Sphinx()
        _ = try sphinx.askRiddle()
        XCTAssertThrowsError(try sphinx.answer("banana")) { error in
            guard let riddleError = error as? RiddleError else {
                XCTFail("Expected RiddleError, got \(error)")
                return
            }
            if case .wrongAnswer = riddleError {
                // Expected
            } else {
                XCTFail("Expected wrongAnswer, got \(riddleError)")
            }
        }
    }

    func testWrongAnswerErrorHasDetails() throws {
        throw XCTSkip("Delete this line to continue")
        var sphinx = Sphinx()
        _ = try sphinx.askRiddle()
        do {
            _ = try sphinx.answer("banana")
            XCTFail("Expected error to be thrown")
        } catch let error as RiddleError {
            if case .wrongAnswer(let expected, let got) = error {
                XCTAssertEqual(expected, "clock")
                XCTAssertEqual(got, "banana")
            } else {
                XCTFail("Expected wrongAnswer, got \(error)")
            }
        }
    }

    func testTracksAttempts() throws {
        throw XCTSkip("Delete this line to continue")
        var sphinx = Sphinx()
        _ = try sphinx.askRiddle()
        _ = try sphinx.answer("clock")
        _ = try sphinx.askRiddle()
        _ = try? sphinx.answer("wrong")
        XCTAssertEqual(sphinx.attempts, 2)
    }

    func testAsksRiddlesInOrder() throws {
        throw XCTSkip("Delete this line to continue")
        var sphinx = Sphinx()
        let riddle = try sphinx.askRiddle()
        XCTAssertEqual(riddle, "What has hands but can't clap?")
    }

    func testRunsOutOfRiddles() throws {
        throw XCTSkip("Delete this line to continue")
        var sphinx = Sphinx()
        // Answer all 3 riddles correctly
        _ = try sphinx.askRiddle()
        _ = try sphinx.answer("clock")
        _ = try sphinx.askRiddle()
        _ = try sphinx.answer("coin")
        _ = try sphinx.askRiddle()
        _ = try sphinx.answer("footsteps")
        // Fourth ask should throw
        XCTAssertThrowsError(try sphinx.askRiddle()) { error in
            guard let riddleError = error as? RiddleError else {
                XCTFail("Expected RiddleError, got \(error)")
                return
            }
            if case .noRiddlesLeft = riddleError {
                // Expected
            } else {
                XCTFail("Expected noRiddlesLeft, got \(riddleError)")
            }
        }
    }

    func testAnsweringWithoutAskingThrowsAlreadyAnswered() throws {
        throw XCTSkip("Delete this line to continue")
        var sphinx = Sphinx()
        XCTAssertThrowsError(try sphinx.answer("clock")) { error in
            guard let riddleError = error as? RiddleError else {
                XCTFail("Expected RiddleError, got \(error)")
                return
            }
            if case .alreadyAnswered = riddleError {
                // Expected
            } else {
                XCTFail("Expected alreadyAnswered, got \(riddleError)")
            }
        }
    }

    // MARK: - Result Type

    func testResultVersionReturnsSuccess() throws {
        throw XCTSkip("Delete this line to continue")
        var sphinx = Sphinx()
        _ = try sphinx.askRiddle()
        let result = sphinx.answerAsResult("clock")
        switch result {
        case .success(let value):
            XCTAssertTrue(value)
        case .failure(let error):
            XCTFail("Expected success, got \(error)")
        }
    }

    func testResultVersionReturnsFailure() throws {
        throw XCTSkip("Delete this line to continue")
        var sphinx = Sphinx()
        _ = try sphinx.askRiddle()
        let result = sphinx.answerAsResult("wrong")
        switch result {
        case .success:
            XCTFail("Expected failure")
        case .failure(let error):
            if case .wrongAnswer(let expected, let got) = error {
                XCTAssertEqual(expected, "clock")
                XCTAssertEqual(got, "wrong")
            } else {
                XCTFail("Expected wrongAnswer, got \(error)")
            }
        }
    }

    func testTryOptionalReturnsNilOnFailure() throws {
        throw XCTSkip("Delete this line to continue")
        var sphinx = Sphinx()
        _ = try sphinx.askRiddle()
        let result = try? sphinx.answer("wrong")
        XCTAssertNil(result)
    }
}
