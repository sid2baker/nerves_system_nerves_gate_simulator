# Nerves Gate simulator system

Keep the standard Nerves system structure and official actions-nerves2-package
workflow. This is the virtual reference device for shared firmware contracts, not
a registry of board emulators. Do not add board-specific adapters or fake hardware
backends. Keep the x86_64/musl, virtio and GRUB implementation here; QEMU lifecycle,
disks and networking belong to the Nerves Gate workbench.

Use Elixir AST tools for structural changes and exact edits for small changes.
Bump VERSION when build inputs change. Preserve upstream attribution and licenses.
Run formatting, Nerves build-plan resolution and the system linter; report full
artifact builds separately. Source fingerprints are not security checksums.

Use standard vX.Y.Z tags and draft GitHub releases, never Hex publishing. Commit
reviewed checksum.exs before tagging for Git consumers. Review legal reports and
corresponding-source availability before distributing binaries. No tags,
publication, physical disk writes, QEMU boots, networking changes or changes to
live workbench sessions without explicit authorization.
