workspace(name = "layer_definitions")

load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive",
    "http_file",
)

http_archive(
    name = "bazel_toolchains",
    sha256 = "fa1459abc7d89db728da424176f5f424e78cb8ad7a3d03d8bfa0c5c4a56b7398",
    strip_prefix = "bazel-toolchains-42619b5476b7c8a2f5117f127d5772cc46da2d1d",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-toolchains/archive/42619b5476b7c8a2f5117f127d5772cc46da2d1d.tar.gz",
        "https://github.com/bazelbuild/bazel-toolchains/archive/42619b5476b7c8a2f5117f127d5772cc46da2d1d.tar.gz",
    ],
)

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "d9ee70d2f763ce197e2691f12d69ee8e32b2245a48d53b4365fa239b66405c0c",
    strip_prefix = "rules_docker-7391b39ccad788524262e106d54adfdbfc3e44d5",
    urls = ["https://github.com/bazelbuild/rules_docker/archive/7391b39ccad788524262e106d54adfdbfc3e44d5.tar.gz"],
)

http_archive(
    name = "base_images_docker",
    sha256 = "9093487038f348f437931972ad3010080e2168305fcec86eed48bea81104a508",
    # TODO(xingao): change to a commit in master.
    strip_prefix = "base-images-docker-ffb6e2f8ce9e726781f6b10b80a8d2818f215fbc",
    urls = ["https://github.com/GoogleCloudPlatform/base-images-docker/archive/ffb6e2f8ce9e726781f6b10b80a8d2818f215fbc.tar.gz"],
)

load(
    "@io_bazel_rules_docker//container:container.bzl",
    container_repositories = "repositories",
)

container_repositories()

load("//layers/ubuntu1604/base:deps.bzl", base_deps = "deps")

base_deps()

load("//layers/ubuntu1604/bazel:deps.bzl", bazel_deps = "deps")

bazel_deps()

load("//layers/ubuntu1604/clang:deps.bzl", clang_deps = "deps")

clang_deps()

load("//layers/ubuntu1604/docker:deps.bzl", docker_deps = "deps")

docker_deps()

load("//layers/ubuntu1604/gcloud:deps.bzl", gcloud_deps = "deps")

gcloud_deps()

load("//layers/ubuntu1604/java:deps.bzl", java_deps = "deps")

java_deps()

load("//layers/ubuntu1604/python:deps.bzl", python_deps = "deps")

python_deps()
