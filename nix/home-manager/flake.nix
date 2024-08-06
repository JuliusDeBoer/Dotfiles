{
  description = "Home Manager configuration of Julius";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixGL.url = "github:guibou/nixgl";
  };

  outputs = { nixpkgs, home-manager, nixGL, ... }:
  let
    system = "x86_64-linux";
    nixGLPackage = nixGL.packages.${system}.nixGLDefault;
  in {
    homeConfigurations.julius = home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs {
        inherit system;
        overlays = [nixGL.overlay];
    };

    modules = [ ./home.nix ];
    };
  };
}
