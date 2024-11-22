{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:MarceColl/zen-browser-flake/e6ab73f405e9a2896cce5956c549a9cc359e5fcc";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations.T480 = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        inherit system;
        modules = [
          ./configuration.nix
          ./hosts/T480.nix
          inputs.home-manager.nixosModules.default
          (
            { pkgs, ... }:
            {
              nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];
              environment.systemPackages = [
                pkgs.rust-bin.stable.latest.default
                inputs.zen-browser.packages."${system}".specific
              ];
            }
          )
        ];
      };
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
      devShell.x86_64-linux = pkgs.mkShell {
        buildInputs = with pkgs; [
          nixd
          nil
        ];
      };
    };
}
