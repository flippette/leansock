{inputs, ...}: {
  perSystem = {system, ...}: {
    _module.args.pkgs =
      import inputs.nixpkgs
      {
        inherit system;

        overlays = [
          (inputs.lean4-nix.readToolchainFile {
            toolchain = ../../lean-toolchain;
            binary = false;
          })

          (final: _: {
            lake2nix =
              final.callPackage
              inputs.lean4-nix.lake {};
          })
        ];
      };
  };
}
