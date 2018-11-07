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
    sha256 = "1355ba2f4509409f3f57a4a4a03200b9431f0e37924950b02cc6955b691aee23",
    strip_prefix = "base-images-docker-c4c3ff85458ce5dd3d93298559605d97fe948d17",
    urls = ["https://github.com/GoogleCloudPlatform/base-images-docker/archive/c4c3ff85458ce5dd3d93298559605d97fe948d17.tar.gz"],
)

load(
    "@io_bazel_rules_docker//container:container.bzl",
    container_repositories = "repositories",
)
container_repositories()

load(
    "//dependencies:dependencies.bzl",
    "dependencies",
)
dependencies()
