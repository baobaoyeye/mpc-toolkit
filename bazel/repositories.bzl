load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def mpct_deps():
    # basic repositories
    _rule_python()
    _rules_foreign_cc()
    _com_github_madler_zlib()
    _com_google_protobuf()
    _com_github_gflags_gflags()
    _com_google_googletest()
    _com_github_google_leveldb()
    _com_github_openssl_openssl()
    _com_github_brpc_brpc()
    _com_github_fmtlib_fmt()
    _com_github_gabime_spdlog()
    _com_github_gperftools_gperftools()

    # cryptographically secure repositories

def _rule_python():
    maybe(
        http_archive,
        name = "rules_python",
        sha256 = "a30abdfc7126d497a7698c29c46ea9901c6392d6ed315171a6df5ce433aa4502",
        strip_prefix = "rules_python-0.6.0",
        urls = [
            "https://github.com/bazelbuild/rules_python/archive/refs/tags/0.6.0.tar.gz",
        ],
    )

def _rules_foreign_cc():
    maybe(
        http_archive,
        name = "rules_foreign_cc",
        sha256 = "bcd0c5f46a49b85b384906daae41d277b3dc0ff27c7c752cc51e43048a58ec83",
        strip_prefix = "rules_foreign_cc-0.7.1",
        urls = [
            "https://github.com/bazelbuild/rules_foreign_cc/archive/0.7.1.tar.gz",
        ],
    )

def _com_github_madler_zlib():
    maybe(
        http_archive,
        name = "zlib",
        build_file = "@mpc-toolkit//bazel:zlib.BUILD",
        strip_prefix = "zlib-1.2.11",
        sha256 = "629380c90a77b964d896ed37163f5c3a34f6e6d897311f1df2a7016355c45eff",
        type = ".tar.gz",
        urls = [
            "https://github.com/madler/zlib/archive/refs/tags/v1.2.11.tar.gz",
        ],
    )

def _com_google_protobuf():
    maybe(
        http_archive,
        name = "com_google_protobuf",
        sha256 = "ba0650be1b169d24908eeddbe6107f011d8df0da5b1a5a4449a913b10e578faf",
        strip_prefix = "protobuf-3.19.4",
        type = "tar.gz",
        urls = [
            "https://github.com/protocolbuffers/protobuf/releases/download/v3.19.4/protobuf-all-3.19.4.tar.gz",
        ],
    )

def _com_github_gflags_gflags():
    maybe(
        http_archive,
        name = "com_github_gflags_gflags",
        strip_prefix = "gflags-2.2.2",
        sha256 = "34af2f15cf7367513b352bdcd2493ab14ce43692d2dcd9dfc499492966c64dcf",
        type = "tar.gz",
        urls = [
            "https://github.com/gflags/gflags/archive/v2.2.2.tar.gz",
        ],
    )

def _com_google_googletest():
    maybe(
        http_archive,
        name = "com_google_googletest",
        sha256 = "b4870bf121ff7795ba20d20bcdd8627b8e088f2d1dab299a031c1034eddc93d5",
        type = "tar.gz",
        strip_prefix = "googletest-release-1.11.0",
        urls = [
            "https://github.com/google/googletest/archive/refs/tags/release-1.11.0.tar.gz",
        ],
    )

def _com_github_google_leveldb():
    maybe(
        http_archive,
        name = "com_github_google_leveldb",
        strip_prefix = "leveldb-1.23",
        sha256 = "9a37f8a6174f09bd622bc723b55881dc541cd50747cbd08831c2a82d620f6d76",
        type = "tar.gz",
        build_file = "@mpc-toolkit//bazel:leveldb.BUILD",
        patch_args = ["-p1"],
        patches = ["@mpc-toolkit//bazel:patches/leveldb.patch"],
        urls = [
            "https://github.com/google/leveldb/archive/refs/tags/1.23.tar.gz",
        ],
    )

def _com_github_openssl_openssl():
    maybe(
        http_archive,
        name = "com_github_openssl_openssl",
        sha256 = "dac036669576e83e8523afdb3971582f8b5d33993a2d6a5af87daa035f529b4f",
        type = "tar.gz",
        strip_prefix = "openssl-OpenSSL_1_1_1l",
        urls = [
            "https://github.com/openssl/openssl/archive/refs/tags/OpenSSL_1_1_1l.tar.gz",
        ],
        build_file = "@mpc-toolkit//bazel:openssl.BUILD",
    )

def _com_github_brpc_brpc():
    maybe(
        http_archive,
        name = "com_github_brpc_brpc",
        sha256 = "b45f5052f21097fffc69715fcd18fda13a8412bef042b6ad6e218c065366eb67",
        strip_prefix = "incubator-brpc-1.1.0",
        type = "tar.gz",
        patch_args = ["-p1"],
        patches = ["@mpc-toolkit//bazel:patches/brpc.patch"],
        urls = [
            "https://github.com/apache/incubator-brpc/archive/refs/tags/1.1.0.tar.gz",
        ],
    )

def _com_github_fmtlib_fmt():
    maybe(
        http_archive,
        name = "com_github_fmtlib_fmt",
        strip_prefix = "fmt-8.1.1",
        sha256 = "3d794d3cf67633b34b2771eb9f073bde87e846e0d395d254df7b211ef1ec7346",
        build_file = "@mpc-toolkit//bazel:fmtlib.BUILD",
        urls = [
            "https://github.com/fmtlib/fmt/archive/refs/tags/8.1.1.tar.gz",
        ],
    )

def _com_github_gabime_spdlog():
    maybe(
        http_archive,
        name = "com_github_gabime_spdlog",
        strip_prefix = "spdlog-1.9.2",
        type = "tar.gz",
        sha256 = "6fff9215f5cb81760be4cc16d033526d1080427d236e86d70bb02994f85e3d38",
        build_file = "@mpc-toolkit//bazel:spdlog.BUILD",
        urls = [
            "https://github.com/gabime/spdlog/archive/refs/tags/v1.9.2.tar.gz",
        ],
    )

def _com_github_gperftools_gperftools():
    maybe(
        http_archive,
        name = "com_github_gperftools_gperftools",
        type = "tar.gz",
        strip_prefix = "gperftools-2.9.1",
        sha256 = "ea566e528605befb830671e359118c2da718f721c27225cbbc93858c7520fee3",
        urls = [
            "https://github.com/gperftools/gperftools/releases/download/gperftools-2.9.1/gperftools-2.9.1.tar.gz",
        ],
        build_file = "@mpc-toolkit//bazel:gperftools.BUILD",
    )
