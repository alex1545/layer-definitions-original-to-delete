# Copyright 2016 The Bazel Authors. All rights reserved.
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

# Once recursive workspace is implemented in Bazel, this file should cease
# to exist.

load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive",
    "http_file",
)
load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
)
load(
    "//revisions/clang:revision.bzl",
    "CLANG_REVISION",
    "DEBIAN8_CLANG_SHA256",
    "DEBIAN9_CLANG_SHA256",
    "UBUNTU16_04_CLANG_SHA256",
)
load(
    "//revisions/libcxx:revision.bzl",
    "DEBIAN8_LIBCXX_SHA256",
    "DEBIAN9_LIBCXX_SHA256",
    "LIBCXX_REVISION",
    "UBUNTU16_04_LIBCXX_SHA256",
)
load(
    "//revisions/openjdk:revision.bzl",
    "JDK_VERSION",
    "OPENJDK_SHA256",
    "OPENJDK_SRC_SHA256",
)
load("//revisions/bazel:revision.bzl", "BAZEL_VERSION_SHA256S")
load("//revisions/image:revision.bzl", "sha256s")

def dependencies():
    """Download dependencies of to use layers in this repository."""
    excludes = native.existing_rules().keys()

    # ================================ GPG Keys ================================
    # Bazel gpg key necessary to install Bazel in the containers.
    if "bazel_gpg" not in excludes:
        http_file(
            name = "bazel_gpg",
            sha256 = "30af2ca7abfb65987cd61802ca6e352aadc6129dfb5bfc9c81f16617bc3a4416",
            urls = ["https://bazel.build/bazel-release.pub.gpg"],
        )

    # GCloud gpg key necessary to install GCloud in the containers.
    if "gcloud_gpg" not in excludes:
        http_file(
            name = "gcloud_gpg",
            sha256 = "226ba1072f20e4ff97ee4f94e87bf45538a900a6d9b25399a7ac3dc5a2f3af87",
            urls = ["https://packages.cloud.google.com/apt/doc/apt-key.gpg"],
        )

    # Docker gpg key necessary to install Docker in the containers.
    if "xenial_docker_gpg" not in excludes:
        http_file(
            name = "xenial_docker_gpg",
            sha256 = "1500c1f56fa9e26b9b8f42452a553675796ade0807cdce11975eb98170b3a570",
            urls = ["https://download.docker.com/linux/ubuntu/gpg"],
        )

    # =============================== Toolchains ===============================
    # Clang
    if "ubuntu16_04_clang_release" not in excludes:
        http_file(
            name = "ubuntu16_04_clang_release",
            downloaded_file_path = "clang_" + CLANG_REVISION + ".tar.gz",
            sha256 = UBUNTU16_04_CLANG_SHA256,
            urls = ["https://storage.googleapis.com/clang-builds-stable/clang-ubuntu16_04/clang_" + CLANG_REVISION + ".tar.gz"],
        )

    # libcxx
    if "ubuntu16_04_libcxx_release" not in excludes:
        http_file(
            name = "ubuntu16_04_libcxx_release",
            downloaded_file_path = "libcxx-msan_" + LIBCXX_REVISION + ".tar.gz",
            sha256 = UBUNTU16_04_LIBCXX_SHA256,
            urls = ["https://storage.googleapis.com/clang-builds-stable/clang-ubuntu16_04/libcxx-msan_" + LIBCXX_REVISION + ".tar.gz"],
        )

    # ============================ Bazel installers ============================
    # Official Bazel installer.sh for all supported versions.
    for bazel_version, bazel_sha256 in BAZEL_VERSION_SHA256S.items():
        name = "bazel_%s_installer" % (bazel_version.replace(".", ""))
        if name not in excludes:
            http_file(
                name = name,
                downloaded_file_path = "bazel-" + bazel_version + "-installer-linux-x86_64.sh",
                sha256 = bazel_sha256,
                urls = [
                    "https://releases.bazel.build/" + bazel_version + "/release/bazel-" + bazel_version + "-installer-linux-x86_64.sh",
                    "https://github.com/bazelbuild/bazel/releases/download/" + bazel_version + "/bazel-" + bazel_version + "-installer-linux-x86_64.sh",
                ],
            )

    # ============================ Azul OpenJDK packages ============================
    if "azul_open_jdk" not in excludes:
        http_file(
            name = "azul_open_jdk",
            downloaded_file_path = "zulu" + JDK_VERSION + "-linux_x64-allmodules.tar.gz",
            sha256 = OPENJDK_SHA256,
            urls = ["https://mirror.bazel.build/openjdk/azul-zulu" + JDK_VERSION + "/zulu" + JDK_VERSION + "-linux_x64-allmodules.tar.gz"],
        )

    if "azul_open_jdk_src" not in excludes:
        http_file(
            name = "azul_open_jdk_src",
            downloaded_file_path = "zsrc" + JDK_VERSION + ".zip",
            sha256 = OPENJDK_SRC_SHA256,
            urls = ["https://mirror.bazel.build/openjdk/azul-zulu" + JDK_VERSION + "/zsrc" + JDK_VERSION + ".zip"],
        )

    # ============================ Images ============================

    if "ubuntu16_04" not in excludes:
        # TODO(xingao) Switch to use "marketplace.gcr.io" registry once Buildkite support proper auth.
        container_pull(
            name = "ubuntu16_04",
            digest = sha256s()["ubuntu16_04"],
            registry = "l.gcr.io",
            repository = "google/ubuntu16_04",
        )
