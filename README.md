# Nerves Gate simulator system

`nerves_system_nerves_gate_simulator` runs the real Nerves Gate firmware on virtual
x86_64 hardware under QEMU. It is a reference device for shared application,
networking, storage and plugin contracts—not an emulator of EC100, EM300 or future
boards' peripherals and boot chains. The firmware Mix target remains `x86_64`.

See [GATEWAY.md](GATEWAY.md) for virtual hardware and validation limits. QEMU
processes, disposable disks and private networking belong to the
[Nerves Gate workbench](https://github.com/sid2baker/nerves_gate), not this package.
Never write this system to a physical disk.

## Use

The package is a Git dependency, not a Hex package:

```elixir
{:nerves_system_nerves_gate_simulator,
 github: "sid2baker/nerves_system_nerves_gate_simulator",
 tag: "v0.3.0", runtime: false, targets: :x86_64}
```

The standalone release must be published before this tag can be used. Until then,
use a checked-out source and build its artifact explicitly. Nerves Gate supports
`NERVES_GATE_SIMULATOR_SYSTEM_PATH=/absolute/path/to/nerves_system_nerves_gate_simulator`.

## Build

Use Elixir 1.17 or later, Nerves bootstrap, and Docker or Podman on Linux:

```sh
mix archive.install hex nerves_bootstrap
mix deps.get
mix nerves.artifact.build
mix nerves.artifact.checksum
```

The build requests Buildroot `source`, `all` and `legal-info`. Fingerprinted binary
artifacts include legal notices, not a corresponding-source archive. Review the
Buildroot reports and applicable source-distribution obligations before distributing
binaries. Legal-info alone is not proof of compliance; prebuilt toolchains can have
additional source obligations.

## Release

1. Update `VERSION` and the matching `## vX.Y.Z` changelog section.
2. Push the source commit; the official `actions-nerves2-package` workflow builds
   it and uploads CI artifacts.
3. Review and commit the generated `checksum.exs` before tagging. Git consumers
   require this manifest in their source checkout, not just as a release asset.
4. Push `vX.Y.Z` only with release authorization. The workflow creates a draft.
5. Review licensing, source availability and the draft assets, then publish manually.

No Hex publishing or automatic public release is configured. Never replace a
published version. This package versions independently of firmware and Buildroot.

## Attribution

Based on `nerves-project/nerves_system_x86_64` commit
`5d755dba94fff478eac2bfd90ba91d2e0025d4eb` (1.34.2). Original
[documentation](UPSTREAM_README.md), [changelog](UPSTREAM_CHANGELOG.md), SPDX
annotations and licenses are retained.
