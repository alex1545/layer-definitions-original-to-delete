schemaVersion: "2.0.0"

commandTests:
- name: 'check-bazel'
  command: 'bazel'
  args: ['version']
  expectedOutput: ['Build label: {_BAZEL_VERSION}']
# 'check-ar' is used to test binutils.
- name: 'check-ar'
  command: 'ar'
  args: ['--version']
  expectedOutput: ['GNU ar .*']
- name: 'check-patch'
  command: 'patch'
  args: ['--version']
  expectedOutput: ['GNU patch .*']
- name: 'check-unzip'
  command: 'unzip'
  expectedOutput: ['.*Usage: unzip .*']
- name: 'check-zip'
  command: 'zip'
  args: ['--version']
  expectedOutput: ['.*This is Zip.*']


fileExistenceTests:
- name: 'bazelrc'
  path: '/etc/bazel.bazelrc'
  shouldExist: true
