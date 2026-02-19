// ABOUTME: Tests for Kraken + Ship, the tenth creature in the TDD curriculum.
// ABOUTME: Teaches async/await, structured concurrency, Task, TaskGroup, and AsyncSequence.

import XCTest
@testable import Kraken

final class KrakenTests: XCTestCase {

    // MARK: - Creation

    func testHasAName() throws {
        let kraken = Kraken(name: "Leviathan")
        XCTAssertEqual(kraken.name, "Leviathan")
    }

    func testStartsWith8Tentacles() throws {
        throw XCTSkip("Delete this line to continue")
        let kraken = Kraken(name: "Leviathan")
        XCTAssertEqual(kraken.tentacles, 8)
    }

    // MARK: - Ship

    func testShipHasANameAndCrew() throws {
        throw XCTSkip("Delete this line to continue")
        let ship = Ship(name: "Black Pearl", crew: 50)
        XCTAssertEqual(ship.name, "Black Pearl")
        XCTAssertEqual(ship.crew, 50)
    }

    func testShipStartsNotSunk() throws {
        throw XCTSkip("Delete this line to continue")
        let ship = Ship(name: "Black Pearl", crew: 50)
        XCTAssertFalse(ship.isSunk)
    }

    // MARK: - Attacking

    func testAttacksAShipAsync() async throws {
        throw XCTSkip("Delete this line to continue")
        var kraken = Kraken(name: "Leviathan")
        let ship = Ship(name: "Black Pearl", crew: 50)
        let result = await kraken.attack(ship)
        XCTAssertEqual(result, "Leviathan attacks Black Pearl!")
        XCTAssertTrue(ship.isSunk)
    }

    func testTracksShipsAttacked() async throws {
        throw XCTSkip("Delete this line to continue")
        var kraken = Kraken(name: "Leviathan")
        let ship = Ship(name: "Black Pearl", crew: 50)
        _ = await kraken.attack(ship)
        XCTAssertEqual(kraken.shipsAttacked, ["Black Pearl"])
    }

    // MARK: - Fleet Attack

    func testAttacksFleetConcurrently() async throws {
        throw XCTSkip("Delete this line to continue")
        var kraken = Kraken(name: "Leviathan")
        let ships = [
            Ship(name: "Black Pearl", crew: 50),
            Ship(name: "Flying Dutchman", crew: 30),
            Ship(name: "Queen Anne", crew: 40),
        ]
        let messages = await kraken.attackFleet(ships)
        XCTAssertEqual(messages.sorted().count, 3)
    }

    func testFleetAttackSinksAllShips() async throws {
        throw XCTSkip("Delete this line to continue")
        var kraken = Kraken(name: "Leviathan")
        let ships = [
            Ship(name: "Black Pearl", crew: 50),
            Ship(name: "Flying Dutchman", crew: 30),
        ]
        _ = await kraken.attackFleet(ships)
        XCTAssertTrue(ships.allSatisfy { $0.isSunk })
    }

    // MARK: - AsyncSequence

    func testRageStreamYieldsMessages() async throws {
        throw XCTSkip("Delete this line to continue")
        let kraken = Kraken(name: "Leviathan")
        var messages: [String] = []
        for await msg in kraken.rageStream() {
            messages.append(msg)
        }
        XCTAssertFalse(messages.isEmpty)
    }

    func testRageStreamCompletes() async throws {
        throw XCTSkip("Delete this line to continue")
        let kraken = Kraken(name: "Leviathan")
        var count = 0
        for await _ in kraken.rageStream() {
            count += 1
        }
        XCTAssertEqual(count, 3)
    }

    // MARK: - Patrol

    func testPatrolFindsTargetShip() async throws {
        throw XCTSkip("Delete this line to continue")
        let kraken = Kraken(name: "Leviathan")
        let ships = [
            Ship(name: "Black Pearl", crew: 50),
            Ship(name: "Flying Dutchman", crew: 30),
        ]
        let found = await kraken.patrolUntilFound("Flying Dutchman", in: ships)
        XCTAssertNotNil(found)
        XCTAssertEqual(found?.name, "Flying Dutchman")
    }

    func testPatrolReturnsNilForMissingShip() async throws {
        throw XCTSkip("Delete this line to continue")
        let kraken = Kraken(name: "Leviathan")
        let ships = [Ship(name: "Black Pearl", crew: 50)]
        let found = await kraken.patrolUntilFound("Ghost Ship", in: ships)
        XCTAssertNil(found)
    }
}
