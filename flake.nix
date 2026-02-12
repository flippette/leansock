{
  inputs = {
    import-tree.url = "github:vic/import-tree";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    git-hooks.url = "github:cachix/git-hooks.nix";
    git-hooks.inputs.nixpkgs.follows = "nixpkgs";

    lean4-nix.url = "github:lenianiva/lean4-nix";
    lean4-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    flake-parts,
    import-tree,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake
    {inherit inputs;}
    (import-tree [
      ./nix/modules
    ]);
}
