{
  description = "Nix packages for reproducible MIR research";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }@inputs:
    let
      supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixpkgs-fmt);
      packages = forAllSystems (system: import ./packages (inputs // { inherit system; }));
      devShells = forAllSystems (system: { default = import ./shell.nix { pkgs = nixpkgs.legacyPackages.${system}; }; });
      overlays.default = final: prev: rec {
        jams = final.callPackage ./packages/jams.nix { };
        vmo = final.callPackage ./packages/vmo.nix { };
        msaf = final.callPackage ./packages/msaf.nix { inherit jams; inherit vmo; };
      };
    };
}
