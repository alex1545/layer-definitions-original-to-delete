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

    # GCloud gpg key necessary to install GCloud in the containers.
    if "gcloud_gpg" not in excludes:
        http_file(
            name = "gcloud_gpg",
            sha256 = "226ba1072f20e4ff97ee4f94e87bf45538a900a6d9b25399a7ac3dc5a2f3af87",
            urls = ["https://packages.cloud.google.com/apt/doc/apt-key.gpg"],
        )

    if "ubuntu1604_gcloud_debs" not in excludes:
        gcs_file(
            name = "ubuntu1604_gcloud_debs",
            bucket = "gs://xingao-debs/ubuntu1604/gcloud",
            file = "gcloud_debs_20181109.tar",
            sha256 = "ce7b1b433357f8289b42e8620050f1858e7d2d2e20311d1ef0cf62c70ef6faec",
        )
