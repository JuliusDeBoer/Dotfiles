{ config, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  home-manager.users.julius =
    { pkgs, ... }:
    {
      home.packages = [
        # Doesnt work at the time of writing.
        pkgs.gnomeExtensions.open-bar
      ];

      dconf.settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          cursor-size = 24;
          enable-hot-corners = false;
          font-name = "Geist 10";
          show-battery-percentage = true;
          toolbar-style = "text";
        };
        "org/gnome/shell" = {
          favorite-app = [ ];
        };
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/open_terminal" = {
          name = "Open terminal";
          binding = "<Super>Return";
          command = "wezterm";
        };
      };
    };
}
