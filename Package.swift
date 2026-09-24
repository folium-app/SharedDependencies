// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let endpoint: String = "https://github.com/folium-app/SharedDependencies/releases/download"
let `extension`: String = "xcframework.zip"

func url(for libraryName: String, with version: String = "1.0") -> String {
    "\(endpoint)/\(version)/\(libraryName).\(`extension`)"
}

let package = Package(
    name: "SharedDependencies",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(name: "SharedDependencies", targets: [
            "SharedDependencies"
        ])
    ],
    dependencies: [
        .package(url: "https://github.com/jarrodnorwell/PLzmaSDK", branch: "master"),
        .package(url: "https://github.com/krzyzanowskim/OpenSSL", branch: "main")
    ],
    targets: [
        .target(name: "SharedDependencies", dependencies: [
            "lib_dynarmic",
            "lib_enet",
            "lib_faad2",
            "lib_fmt",
            "lib_genericcodegen",
            "lib_glslang",
            "lib_machineindependent",
            "lib_mcl",
            "lib_openal",
            "lib_sdl3",
            "lib_sirit",
            "lib_soundtouch",
            "lib_spirv",
            "lib_teakra",
            
            "cereal",
            "cryptopp",
            "dds_ktx",
            "eventbus",
            "glib",
            "httplib",
            "inih",
            "jwt",
            "libchdr",
            "libslirp",
            "lodepng",
            "magic_enum",
            "metal_cpp",
            "microprofile",
            "miniz",
            "nihstro",
            "nlohmann",
            "oaknut",
            "osa",
            "stb",
            "tsl",
            "xxhash"
        ]),
        .target(name: "cereal", publicHeadersPath: "include"),
        .target(name: "cryptopp", publicHeadersPath: "include", cxxSettings: [
            .define("CRYPTOPP_DISABLE_ARM_CRC32"),
            .headerSearchPath("include/cryptopp"),
            .unsafeFlags([
                "-Wno-implicit-int-conversion",
                "-Wno-shorten-64-to-32"
            ])
        ]),
        .target(name: "dds_ktx", publicHeadersPath: "include"),
        .target(name: "eventbus", publicHeadersPath: "include"),
        .target(name: "glib",
                publicHeadersPath: "include",
                cSettings: [
                    .unsafeFlags([
                        "-Wno-implicit-int-conversion",
                        "-Wno-shorten-64-to-32"
                    ])
                ]),
        .target(name: "httplib",
                publicHeadersPath: "include",
                cxxSettings: [
                    .define("CPPHTTPLIB_OPENSSL_SUPPORT")
                ]),
        .target(name: "inih", publicHeadersPath: "include"),
        .target(name: "jwt",
                dependencies: [
                    "OpenSSL"
                ],
                publicHeadersPath: "include"),
        .target(name: "libchdr",
                dependencies: [
                    "FLAC",
                    "ogg",
                    .product(name: "PLzmaSDK-Static", package: "PLzmaSDK")
                ], publicHeadersPath: "include",
                cSettings: [
                    .unsafeFlags([
                        "-Wno-shorten-64-to-32"
                    ])
                ]),
        .target(name: "libslirp", dependencies: [
            "glib"
        ], publicHeadersPath: "include", cSettings: [
            .unsafeFlags([
                "-D_NETINET_TCP_VAR_H_",
                "-ffast-math",
                "-Wno-implicit-int-conversion",
                "-Wno-shorten-64-to-32"
            ])
        ]),
        .target(name: "lodepng", publicHeadersPath: "include"),
        .target(name: "magic_enum", publicHeadersPath: "include"),
        .target(name: "metal_cpp", publicHeadersPath: "include"),
        .target(name: "microprofile",
                publicHeadersPath: "include",
                cxxSettings: [
                    .unsafeFlags([
                        "-Wno-implicit-int-conversion",
                        "-Wno-shorten-64-to-32"
                    ])
                ]),
        .target(name: "miniz", publicHeadersPath: "include"),
        .target(name: "nihstro",
                publicHeadersPath: "include",
                cxxSettings: [
                    .unsafeFlags([
                        "-I/usr/local/include"
                    ])
                ]),
        .target(name: "nlohmann", publicHeadersPath: "include"),
        .target(name: "oaknut", publicHeadersPath: "include"),
        .target(name: "osa", publicHeadersPath: "include"),
        .target(name: "stb", publicHeadersPath: "include"),
        .target(name: "tsl", publicHeadersPath: "include"),
        .target(name: "xxhash", publicHeadersPath: "include"),
        
        .binaryTarget(name: "lib_dynarmic",
                      url: url(for: "lib_dynarmic"),
                      checksum: "643ba9854728fe6d2aee8070f1f4e3c3a942d76167a63ca54877b1a86924155d"),
        
        
        .binaryTarget(name: "lib_enet",
                      url: url(for: "lib_enet"),
                      checksum: "96fbd5413ebf4ff0dc62cf3d7ad55fdc906b17e782f607f0c599f436fb5050cf"),
        
        
        .binaryTarget(name: "lib_faad2",
                      url: url(for: "lib_faad2"),
                      checksum: "d2e36b845840300569021fc56167d530eb1854f7cd0f358fe2b75a31c674b920"),
        
        
        .binaryTarget(name: "lib_fmt",
                      url: url(for: "lib_fmt"),
                      checksum: "9e20abf2009e7c44dfb9069b7088e9843ff9ad6e519ac4a7a6c83bb5b713ddc6"),
        
        
        .binaryTarget(name: "lib_genericcodegen",
                      url: url(for: "lib_genericcodegen"),
                      checksum: "cbc902c99588694f76724f58aa2ca6d3d48885892240b743fc746d81b72c0c49"),
        .binaryTarget(name: "lib_glslang",
                      url: url(for: "lib_glslang"),
                      checksum: "192a0ac2a6a59472a20b5fdfbd500dec8e1c7dd9e0855528818b17e454f08277"),
        .binaryTarget(name: "lib_machineindependent",
                      url: url(for: "lib_machineindependent"),
                      checksum: "93952c81841b455dd4ca68d6abdb9e5f4c26c7eb336ef72658abaf89d00ad1d9"),
        
        
        .binaryTarget(name: "lib_mcl",
                      url: url(for: "lib_mcl"),
                      checksum: "f4b8d5a004fb6a3e5476e336b2e07bf00164b606a0fbbc785a188fc78cf379e1"),
        
        
        .binaryTarget(name: "lib_openal",
                      url: url(for: "lib_openal"),
                      checksum: "147a16ff29c10a44744b0ed10fd500f25d67d216da05ddf13e425f5899284307"),
        
        
        .binaryTarget(name: "lib_sdl3",
                      url: url(for: "lib_sdl3"),
                      checksum: "e7b5387f07d03bdbca5c9abb8bbd3bb9ff4c6c8bb46ba0f03291b58265d522bb"),
        
        
        .binaryTarget(name: "lib_sirit",
                      url: url(for: "lib_sirit"),
                      checksum: "cee2af805952d9881d0167e51f223c9499b4677b3b8a064341338d2b349892a1"),
        
        
        .binaryTarget(name: "lib_soundtouch",
                      url: url(for: "lib_soundtouch"),
                      checksum: "bb178f3bfaa133f7e3a2476f15ed8da76c57a983573d812fbac26aa8bcc8a51c"),
        
        
        .binaryTarget(name: "lib_spirv",
                      url: url(for: "lib_spirv"),
                      checksum: "e86b963c0988e01ff5ba5b4fdd5c53a05f911f1a7850c337ff7eb24a2c3d2ca9"),
        
        
        .binaryTarget(name: "lib_teakra",
                      url: url(for: "lib_teakra"),
                      checksum: "9f62f7a88dc5f0b36a3b656bf98387b2fae1ade006c6a29a23a6fd7f507aa91f"),
        
        
        .binaryTarget(name: "FLAC",
                      url: "https://github.com/sbooth/flac-binary-xcframework/releases/download/0.2.0/FLAC.xcframework.zip",
                      checksum: "87f1b13fb490867790b96d52fcbeb1a23847b8f45f50cece530d533266c2001e"),
        .binaryTarget(name: "ogg",
                      url: "https://github.com/sbooth/ogg-binary-xcframework/releases/download/0.1.3/ogg.xcframework.zip",
                      checksum: "0c06ea645c6ca187e66442717eb856c09e2b969545e880300639b41f7b83ae98")
    ],
    cLanguageStandard: .gnu2x,
    cxxLanguageStandard: .gnucxx2b
)
