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
load("@base_images_docker//package_managers:download_pkgs.bzl", "download_pkgs")

download_pkgs(
    name = "python_debs",
    image_tar = "@ubuntu1604//image",
    packages = [
        "python-dev",
        "python-setuptools",
        "python3-dev",
        "software-properties-common",
    ],
)

PYTHON_CLEANUP_COMMANDS = (
    "find /usr/lib/python* -name __pycache__ -exec rm -rf {} +"
)

language_tool_layer(
    name = "python-ltl",
    base = "@ubuntu1604//image",
    installables_tar = "@ubuntu1604_python_debs//file",
    installation_cleanup_commands = PYTHON_CLEANUP_COMMANDS,
    symlinks = {
        "/usr/bin/python": "/usr/bin/python2.7",
    },
)
