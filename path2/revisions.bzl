GCSDeps:
  - name: "BAZEL"
    bucket: "dep-update-service-test"
    versionRegex: "\\d+(\\.\\d+)*"
    fileRegex: "^bazel/\\d+(\\.\\d+)*/release/bazel-\\d+(\\.\\d+)*-installer-linux-x86_64\\.sh\\.sha256$"
    excludes: "/rc"
    startsWith: "bazel/"
    readShaFromFile: true
    startIndex: 0
    template: "revision.bzl or pointer to Go struct (TBD)"
    githubPath: "revisions/bazel/revision.bzl"
  - name: "CLANG"
    bucket: "dep-update-service-test"
    versionRegex: "r\\d{6,}"
    fileRegex: "^clang-builds-stable/clang-debian8/clang_r\\d{6,}\\.tar\\.gz$"
    startsWith: "clang-builds-stable/clang-debian8/clang_r"
    template: "revision.bzl or pointer to Go struct (TBD)"
    githubPath: "revisions/clang/revision.bzl"