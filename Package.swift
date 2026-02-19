// swift-tools-version: 6.0
// ABOUTME: Swift Package Manager manifest for the Mythical Creatures TDD curriculum.
// ABOUTME: Each creature is a separate target so students compile only what they're working on.

import PackageDescription
import Foundation

let allCreatures = [
    "Unicorn", "Dragon", "Hobbit", "Phoenix", "Wizard",
    "Sphinx", "Chimera", "Shapeshifter", "Siren", "Kraken", "Direwolf",
]

// Set CREATURE env var to compile and test a single creature:
//   CREATURE=Unicorn swift test
// Without it, all targets are included (requires all creatures to compile).
let active = ProcessInfo.processInfo.environment["CREATURE"]

let sourceTargets: [Target] = allCreatures.map { creature in
    .target(name: creature, path: "Sources/\(creature)")
}

let testTargets: [Target] = allCreatures.compactMap { creature in
    guard active == nil || active == creature else { return nil }
    return .testTarget(
        name: "\(creature)Tests",
        dependencies: [.byName(name: creature)],
        path: "Tests/\(creature)Tests"
    )
}

let package = Package(
    name: "MythicalCreatures",
    platforms: [
        .macOS(.v15)
    ],
    targets: sourceTargets + testTargets
)
