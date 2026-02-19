// ABOUTME: Tests for Siren + Sailor, the ninth creature in the TDD curriculum.
// ABOUTME: Teaches closures, higher-order functions, @escaping, capture lists, and trailing closure syntax.

import XCTest
@testable import Siren

final class SirenTests: XCTestCase {

    // MARK: - Sailor

    func testSailorHasAName() throws {
        let sailor = Sailor(name: "Jack")
        XCTAssertEqual(sailor.name, "Jack")
    }

    func testSailorStartsWithNoSongsHeard() throws {
        throw XCTSkip("Delete this line to continue")
        let sailor = Sailor(name: "Jack")
        XCTAssertTrue(sailor.songsHeard.isEmpty)
    }

    func testSailorHearsASong() throws {
        throw XCTSkip("Delete this line to continue")
        let sailor = Sailor(name: "Jack")
        sailor.hear("Come to me")
        XCTAssertEqual(sailor.songsHeard, ["Come to me"])
    }

    func testSailorIsLuredAfter3Songs() throws {
        throw XCTSkip("Delete this line to continue")
        let sailor = Sailor(name: "Jack")
        XCTAssertFalse(sailor.isLured)
        sailor.hear("Song 1")
        sailor.hear("Song 2")
        sailor.hear("Song 3")
        XCTAssertTrue(sailor.isLured)
    }

    // MARK: - Siren Creation

    func testSirenHasAName() throws {
        throw XCTSkip("Delete this line to continue")
        let siren = Siren(name: "Lorelei")
        XCTAssertEqual(siren.name, "Lorelei")
    }

    func testSirenHasSongs() throws {
        throw XCTSkip("Delete this line to continue")
        let siren = Siren(name: "Lorelei")
        XCTAssertEqual(siren.songs.count, 3)
    }

    // MARK: - Singing with Closures

    func testSirenSingsWithClosure() throws {
        throw XCTSkip("Delete this line to continue")
        let siren = Siren(name: "Lorelei")
        var heardSongs: [String] = []
        siren.sing(onSong: { song in
            heardSongs.append(song)
        })
        XCTAssertEqual(heardSongs.count, 3)
    }

    func testTrailingClosureSyntax() throws {
        throw XCTSkip("Delete this line to continue")
        let siren = Siren(name: "Lorelei")
        var heardSongs: [String] = []
        siren.sing { song in
            heardSongs.append(song)
        }
        XCTAssertEqual(heardSongs.count, 3)
    }

    // MARK: - Singing to Sailors

    func testSirenSingsToASailor() throws {
        throw XCTSkip("Delete this line to continue")
        let siren = Siren(name: "Lorelei")
        let sailor = Sailor(name: "Jack")
        siren.singTo(sailor)
        XCTAssertEqual(sailor.songsHeard.count, 3)
    }

    func testSirenTracksSongsPerformed() throws {
        throw XCTSkip("Delete this line to continue")
        let siren = Siren(name: "Lorelei")
        let sailor = Sailor(name: "Jack")
        siren.singTo(sailor)
        XCTAssertEqual(siren.songsPerformed, 3)
    }

    func testSirenLuresMultipleSailors() throws {
        throw XCTSkip("Delete this line to continue")
        let siren = Siren(name: "Lorelei")
        let jack = Sailor(name: "Jack")
        let will = Sailor(name: "Will")
        // Give Jack 2 songs already so siren's 3 will lure him
        jack.hear("Prelude 1")
        jack.hear("Prelude 2")
        let lured = siren.lure([jack, will])
        // Jack had 2 + 3 = 5 songs (lured), Will had 0 + 3 = 3 songs (lured)
        XCTAssertEqual(lured.count, 2)
    }

    // MARK: - Higher Order Functions

    func testMapTransformsSongNames() throws {
        throw XCTSkip("Delete this line to continue")
        let siren = Siren(name: "Lorelei")
        let uppercased = siren.songNames()
        XCTAssertEqual(uppercased, ["COME TO ME", "THE SEA CALLS", "SURRENDER TO THE WAVES"])
    }

    func testReduceCalculatesTotalLength() throws {
        throw XCTSkip("Delete this line to continue")
        let siren = Siren(name: "Lorelei")
        let total = siren.totalSongLength()
        let expected = "Come to me".count + "The sea calls".count + "Surrender to the waves".count
        XCTAssertEqual(total, expected)
    }

    // MARK: - Escaping Closures

    func testEscapingCallbackReceivesSongs() throws {
        throw XCTSkip("Delete this line to continue")
        let siren = Siren(name: "Lorelei")
        var receivedSongs: [String] = []
        siren.singWithCallback { songs in
            receivedSongs = songs
        }
        XCTAssertEqual(receivedSongs.count, 3)
    }
}
