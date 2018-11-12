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

def deps():
    """Download dependencies of to use this layer."""
    excludes = native.existing_rules().keys()

    # Docker gpg key necessary to install Docker in the containers.
    if "docker_gpg" not in excludes:
        http_file(
            name = "docker_gpg",
            sha256 = "1500c1f56fa9e26b9b8f42452a553675796ade0807cdce11975eb98170b3a570",
            urls = ["https://download.docker.com/linux/ubuntu/gpg"],
        )

    if "ubuntu1604_docker_debs" not in excludes:
        gcs_file(
            name = "ubuntu1604_docker_debs",
            bucket = "gs://xingao-debs/ubuntu1604/docker",
            file = "docker_debs_20181109.tar",
            sha256 = "f1499c804ec1c7205ef73bcfb39a8fe38de0ab065155b5ca7c14aa42c1e88900",
        )
