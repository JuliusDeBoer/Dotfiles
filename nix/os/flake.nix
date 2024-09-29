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
        url = "github:MarceColl/zen-browser-flake/06505a088396e2c0b9ad100302502783a6bcdb40";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs :
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations.T480 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        inherit system;
        modules = [
          ./configuration.nix
          ./hardware/T480.nix
          ./specialized/T480.nix
          inputs.home-manager.nixosModules.default
          ({ pkgs, ... }: {
            nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];
            environment.systemPackages = [
              pkgs.rust-bin.stable.latest.default
              inputs.zen-browser.packages."${system}".specific
            ];
          })
        ];
      };
    };
}
