# Limbo
#
# A place for packages that are semi-permanent.

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    aseprite
    beekeeper-studio
    docker
    dotnetCorePackages.dotnet_8.sdk
    godot_4
    jetbrains.rider
    ldtk
    wl-clipboard
  ];

  virtualisation.docker.enable = true;

  home-manager.users.julius =
    { pkgs, ... }:
    {
      home.file.".config/aseprite/aseprite.ini".text = ''
        [theme]
        selected = dark
      '';
    };
}
