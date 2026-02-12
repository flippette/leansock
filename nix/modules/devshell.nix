{
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShellNoCC {
      inputsFrom = [
        config.packages.leansock
      ];

      packages = with pkgs; [
        lean.lean-all
      ];
    };
  };
}
