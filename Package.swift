// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "armadillo",
    platforms: [
		.iOS(.v9), 
		.macOS(.v10_10), 
		.tvOS(.v9), 
		.watchOS(.v2)
    ],
    products: [
        .library(
            name: "armadillo",
            targets: [ "armadillo" ]
        )
    ],
    targets: [
		.target(
			name: "armadillo",
			path: "include/",
            exclude: [
				"armadillo",
                "armadillo_bits/config.hpp.cmake"
            ],
            publicHeadersPath: "./",
			cSettings: [
                .define("ARMA_DONT_USE_WRAPPER", to: "1"),
			],
            cxxSettings: [
                .unsafeFlags([ "-Wno-modules-import-nested-redundant" ])
            ]
        )
    ],
    cxxLanguageStandard: .cxx14
)

