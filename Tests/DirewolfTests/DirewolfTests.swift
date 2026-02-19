// ABOUTME: Tests for Direwolf + Pack + Stark, the eleventh creature (capstone) in the TDD curriculum.
// ABOUTME: Teaches actors, isolation, Sendable, nonisolated, and concurrent state coordination.

import XCTest
@testable import Direwolf

final class DirewolfTests: XCTestCase {

    // MARK: - Stark

    func testStarkHasAName() throws {
        let stark = Stark(name: "Arya")
        XCTAssertEqual(stark.name, "Arya")
    }

    func testStarkHasDefaultLocation() throws {
        throw XCTSkip("Delete this line to continue")
        let stark = Stark(name: "Arya")
        XCTAssertEqual(stark.location, "Winterfell")
    }

    func testStarkStartsUnsafe() throws {
        throw XCTSkip("Delete this line to continue")
        let stark = Stark(name: "Arya")
        XCTAssertFalse(stark.isSafe)
    }

    func testStarkHouseWordsChangeWithSafety() throws {
        throw XCTSkip("Delete this line to continue")
        var stark = Stark(name: "Arya")
        XCTAssertEqual(stark.houseWords(), "Winter is Coming")
        stark.isSafe = true
        XCTAssertEqual(stark.houseWords(), "The North Remembers")
    }

    func testStarkIsSendable() async throws {
        throw XCTSkip("Delete this line to continue")
        let stark = Stark(name: "Arya", location: "Winterfell")
        let wolf = Direwolf(name: "Nymeria", location: "Winterfell")
        let result = await wolf.protect(stark)
        XCTAssertNotNil(result)
    }

    // MARK: - Direwolf

    func testDirewolfHasAName() async throws {
        throw XCTSkip("Delete this line to continue")
        let wolf = Direwolf(name: "Ghost")
        XCTAssertEqual(wolf.name, "Ghost")
    }

    func testDirewolfNameIsNonisolated() throws {
        throw XCTSkip("Delete this line to continue")
        let wolf = Direwolf(name: "Ghost")
        let name = wolf.name
        XCTAssertEqual(name, "Ghost")
    }

    func testDirewolfCanHowl() async throws {
        throw XCTSkip("Delete this line to continue")
        let wolf = Direwolf(name: "Ghost")
        let howl = await wolf.howl()
        XCTAssertEqual(howl, "Awooo! I'm Ghost!")
    }

    func testDirewolfProtectsAStark() async throws {
        throw XCTSkip("Delete this line to continue")
        let wolf = Direwolf(name: "Ghost", location: "Winterfell")
        let stark = Stark(name: "Jon", location: "Winterfell")
        let protected = await wolf.protect(stark)
        XCTAssertNotNil(protected)
        XCTAssertTrue(protected!.isSafe)
    }

    func testDirewolfRespectsLocationGuard() async throws {
        throw XCTSkip("Delete this line to continue")
        let wolf = Direwolf(name: "Ghost", location: "Beyond the Wall")
        let stark = Stark(name: "Jon", location: "Winterfell")
        let result = await wolf.protect(stark)
        XCTAssertNil(result)
    }

    func testDirewolfRespectsCapacity() async throws {
        throw XCTSkip("Delete this line to continue")
        let wolf = Direwolf(name: "Ghost", location: "Winterfell")
        let arya = Stark(name: "Arya", location: "Winterfell")
        let sansa = Stark(name: "Sansa", location: "Winterfell")
        let bran = Stark(name: "Bran", location: "Winterfell")
        _ = await wolf.protect(arya)
        _ = await wolf.protect(sansa)
        let result = await wolf.protect(bran)
        XCTAssertNil(result)
    }

    func testDirewolfReleasesAStark() async throws {
        throw XCTSkip("Delete this line to continue")
        let wolf = Direwolf(name: "Ghost", location: "Winterfell")
        let stark = Stark(name: "Jon", location: "Winterfell")
        _ = await wolf.protect(stark)
        let released = await wolf.release("Jon")
        XCTAssertNotNil(released)
        XCTAssertFalse(released!.isSafe)
    }

    func testDirewolfHuntsWhenNotProtecting() async throws {
        throw XCTSkip("Delete this line to continue")
        let wolf = Direwolf(name: "Ghost", location: "Winterfell")
        let huntsInitially = await wolf.huntsWhiteWalkers
        XCTAssertTrue(huntsInitially)
        let stark = Stark(name: "Jon", location: "Winterfell")
        _ = await wolf.protect(stark)
        let huntsAfterProtect = await wolf.huntsWhiteWalkers
        XCTAssertFalse(huntsAfterProtect)
    }

    // MARK: - Pack

    func testPackHowlsTogether() async throws {
        throw XCTSkip("Delete this line to continue")
        let pack = Pack()
        let ghost = Direwolf(name: "Ghost")
        let nymeria = Direwolf(name: "Nymeria")
        await pack.add(ghost)
        await pack.add(nymeria)
        let howls = await pack.howlTogether()
        XCTAssertEqual(howls.sorted(), ["Awooo! I'm Ghost!", "Awooo! I'm Nymeria!"])
    }

    func testPackProtectsStark() async throws {
        throw XCTSkip("Delete this line to continue")
        let pack = Pack()
        let ghost = Direwolf(name: "Ghost", location: "Winterfell")
        await pack.add(ghost)
        let stark = Stark(name: "Jon", location: "Winterfell")
        let protected = await pack.protectStark(stark)
        XCTAssertNotNil(protected)
        XCTAssertTrue(protected!.isSafe)
    }
}
