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

load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
)
load("//revisions/image:revision.bzl", "sha256s")

def deps():
    """Download dependencies of to use this layer."""
    excludes = native.existing_rules().keys()

    if "ubuntu1604" not in excludes:
        # TODO(xingao) Switch to use "marketplace.gcr.io" registry once Buildkite support proper auth.
        container_pull(
            name = "ubuntu1604",
            digest = sha256s()["ubuntu1604"],
            registry = "l.gcr.io",
            repository = "google/ubuntu16_04",
        )
