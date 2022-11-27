{
  description = "ICTects website";

  inputs = {
    # Nixpkgs / NixOS version to use. Here using unstable because we want wranger 2.x which is not in 22.05
    nixpkgs.url = "nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, ... }:
    let supportedSystems = [ "x86_64-linux" ];
    in utils.lib.eachSystem supportedSystems (system:
      let
        pkgs = import nixpkgs { inherit system; };

        myPkgs = { website = pkgs.callPackage ./website.nix { }; };
      in {
        checks = myPkgs;
        packages = myPkgs // { default = myPkgs.website; };

        devShells.default = pkgs.mkShell {
          inputsFrom = builtins.attrValues self.checks.${system};

          buildInputs = (with pkgs; [ nixpkgs-fmt libwebp imagemagick wrangler]);

          shellHook = ''
            echo using Zola $(${pkgs.zola}/bin/zola --version)
          '';
        };
      });
}
