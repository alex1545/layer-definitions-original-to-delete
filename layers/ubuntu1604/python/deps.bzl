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

load("@bazel_toolchains//rules:gcs.bzl", "gcs_file")

def deps():
    """Download dependencies of to use layers in this repository."""
    excludes = native.existing_rules().keys()

    if "ubuntu1604_python_debs" not in excludes:
        gcs_file(
            name = "ubuntu1604_python_debs",
            bucket = "gs://xingao-debs/ubuntu1604/python",
            file = "python_debs_20181109.tar",
            sha256 = "fc71cd2ebd1e66b7788574ce38b4814a7d0aacb5cbfda596d07f6f8de1faebca",
        )
