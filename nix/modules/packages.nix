{
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    packages.default =
      config.packages.leansock;

    packages.leansock =
      pkgs.callPackage
      ../leansock.nix {};
  };
}
