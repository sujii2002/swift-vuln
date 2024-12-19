// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "swift-vuln",
    targets: [
        .executableTarget(
            name: "swift-vuln",
            dependencies: [],
            path: ".",
            sources: [
                "loginjection.swift",
                "safe.swift",
                "sqlinjection.swift",
                "webview.swift",
                "xxe.swift"
            ]
        )
    ]
)

