# Copyright 2017 The Bazel Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

licenses(["notice"])  # Apache 2.0

package(default_visibility = ["//visibility:public"])

exports_files(["deps.bzl"])

load(
    "@bazel_toolchains//rules/container:docker_toolchains.bzl",
    "language_tool_layer",
)
load(":clang.bzl", "clang_env")
load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")
load("@base_images_docker//package_managers:download_pkgs.bzl", "download_pkgs")

download_pkgs(
    name = "clang_debs",
    image_tar = "@ubuntu1604//image",
    packages = [
        "libstdc++-4.9-dev",
    ],
)

pkg_tar(
    name = "clang_tar",
    package_dir = "/usr/local/",
    strip_prefix = ".",
    tags = ["manual"],
    deps = [
        "@ubuntu1604_clang_release//file",
    ],
)

pkg_tar(
    name = "libcxx_tar",
    package_dir = "/usr/local/",
    strip_prefix = ".",
    tags = ["manual"],
    deps = [
        "@ubuntu1604_libcxx_release//file",
    ],
)

language_tool_layer(
    name = "clang-ltl",
    base = "@ubuntu1604//image",
    env = clang_env,
    installables_tar = "@ubuntu1604_clang_debs//file",
    tars = [
        ":clang_tar",
        ":libcxx_tar",
    ],
)
