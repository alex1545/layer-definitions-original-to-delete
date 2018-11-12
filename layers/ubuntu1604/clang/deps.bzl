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

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")
load("@bazel_toolchains//rules:gcs.bzl", "gcs_file")
load(
    "//revisions/clang:revision.bzl",
    "CLANG_REVISION",
    "UBUNTU1604_CLANG_SHA256",
)
load(
    "//revisions/libcxx:revision.bzl",
    "LIBCXX_REVISION",
    "UBUNTU1604_LIBCXX_SHA256",
)

def deps():
    """Download dependencies of to use this layer."""
    excludes = native.existing_rules().keys()

    # Clang
    if "ubuntu1604_clang_release" not in excludes:
        http_file(
            name = "ubuntu1604_clang_release",
            downloaded_file_path = "clang_" + CLANG_REVISION + ".tar.gz",
            sha256 = UBUNTU1604_CLANG_SHA256,
            urls = ["https://storage.googleapis.com/clang-builds-stable/clang-ubuntu16_04/clang_" + CLANG_REVISION + ".tar.gz"],
        )

    # libcxx
    if "ubuntu1604_libcxx_release" not in excludes:
        http_file(
            name = "ubuntu1604_libcxx_release",
            downloaded_file_path = "libcxx-msan_" + LIBCXX_REVISION + ".tar.gz",
            sha256 = UBUNTU1604_LIBCXX_SHA256,
            urls = ["https://storage.googleapis.com/clang-builds-stable/clang-ubuntu16_04/libcxx-msan_" + LIBCXX_REVISION + ".tar.gz"],
        )

    if "ubuntu1604_clang_debs" not in excludes:
        gcs_file(
            name = "ubuntu1604_clang_debs",
            bucket = "gs://xingao-debs/ubuntu1604/clang",
            file = "clang_debs_20181109.tar",
            sha256 = "f972c262bfe71f164581a4f25872a875790454d1ace018d42571f4b016dba4da",
        )
