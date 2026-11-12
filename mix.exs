defmodule NervesSystemNervesGateSimulator.MixProject do
  use Mix.Project
  @app :nerves_system_nerves_gate_simulator
  @version String.trim(File.read!(Path.join(__DIR__, "VERSION")))
  def project do
    [
      app: @app,
      version: @version,
      elixir: "~> 1.17",
      compilers: Mix.compilers() ++ [:nerves_package],
      nerves_package: nerves_package(),
      description: "Virtual Nerves Gate reference device for x86_64/QEMU",
      deps: deps()
    ]
  end

  def application do
    []
  end

  def cli, do: [default_target: :target]

  defp nerves_package do
    [
      type: :system,
      artifact_sites: [github_releases: "sid2baker/#{@app}"],
      artifact_checksum: true,
      build_runner_opts: [make_args: ["source", "all", "legal-info"]],
      platform: Nerves.System.BR,
      platform_config: [defconfig: "nerves_defconfig"],
      env: [
        {"TARGET_ARCH", "x86_64"},
        {"TARGET_OS", "linux"},
        {"TARGET_ABI", "musl"},
        {"TARGET_GCC_FLAGS",
         "-m64 -fstack-protector-strong -march=x86-64 -fPIE -pie -Wl,-z,now -Wl,-z,relro"}
      ],
      checksum: source_fingerprint_files()
    ]
  end

  defp deps do
    [
      {:nerves, "~> 2.0 or ~> 2.0.0-pre.9", runtime: false},
      {:nerves_system_br, "1.34.5", runtime: false},
      {:nerves_toolchain_x86_64_nerves_linux_musl, "15.3.1", runtime: false},
      {:nerves_system_linter, "~> 0.4", only: [:dev, :test], runtime: false}
    ]
  end

  defp source_fingerprint_files do
    [
      "fwup_include",
      "linux",
      "rootfs_overlay",
      "Config.in",
      "config/config.exs",
      "fwup-ops.conf",
      "fwup.conf",
      "grub.cfg",
      "linux-6.18.defconfig",
      "mix.exs",
      "nerves_defconfig",
      "post-build.sh",
      "post-createfs.sh"
    ]
  end
end
