load("@mpc-toolkit//bazel:mpct.bzl", "mpct_cmake_external")

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "all_srcs",
    srcs = glob(["**"]),
)

mpct_cmake_external(
    name = "fmtlib",
    cache_entries = {
        "FMT_TEST": "OFF",
    },
    defines = ["FMT_HEADER_ONLY"],
    lib_source = ":all_srcs",
    out_headers_only = True,
)
