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

exports_files(glob(["*.yaml"]))

load(
    "//revisions/clang:revision.bzl",
    "CLANG_REVISION",
)
load(
    "//revisions/openjdk:revision.bzl",
    "JDK_VERSION",
    "JDK_VERSION_DECODED",
)
load("//revisions/bazel:revision.bzl", "BAZEL_VERSION_SHA256S")
load(
    "//revisions/gcloud:revision.bzl",
    "GCLOUD_VERSION",
)

genrule(
    name = "generate_clang_yaml",
    srcs = ["clang.yaml.tpl"],
    outs = ["clang.yaml"],
    cmd = "sed 's|{_CLANG_REVISION}|" + CLANG_REVISION.lstrip("r") + "|' <$< >$@",
)

genrule(
    name = "generate_java_yaml",
    srcs = ["java.yaml.tpl"],
    outs = ["java.yaml"],
    cmd = (
        "sed 's|{_JDK_VERSION}|" + JDK_VERSION + "|g; s|{_JDK_VERSION_DECODED}|" + JDK_VERSION_DECODED + "|g' <$< >$@"
    ),
)

# Generate Bazel container testing yaml files with all supported Bazel versions.
[genrule(
    name = "generate_bazel_%s_yaml" % bazel_version,
    srcs = [":bazel.yaml.tpl"],
    outs = ["bazel_%s.yaml" % bazel_version],
    cmd = "sed 's|{_BAZEL_VERSION}|" + bazel_version + "|' <$< >$@",
) for bazel_version, _ in BAZEL_VERSION_SHA256S.items()]

genrule(
    name = "generate_gcloud_yaml",
    srcs = ["gcloud.yaml.tpl"],
    outs = ["gcloud.yaml"],
    cmd = "sed 's|{_GCLOUD_VERSION}|" + GCLOUD_VERSION.rpartition("-")[0] + "|' <$< >$@",
)
