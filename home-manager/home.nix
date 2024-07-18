{ config, pkgs, lib, ... }:
let
  helpers = import ./helpers.nix {
    inherit pkgs;
    inherit lib;
    inherit config;
  };
  wrappedWezterm = helpers.nixGLWrap pkgs.wezterm;
in
{
  home.username = "julius";
  home.homeDirectory = "/home/julius";

  home.stateVersion = "24.05";

  home.packages = [
    wrappedWezterm

    pkgs.tlrc

    pkgs.openssh

    pkgs.neovim

    pkgs.firefox

    # (helpers.nixGLWrap pkgs.wezterm)
    (helpers.nixGLWrap pkgs.zed-editor)
    pkgs.vesktop
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "Julius de Boer";
    userEmail = "45075461+JuliusDeBoer@users.noreply.github.com";
    signing = {
      key = "04491B6E0B95C939";
      signByDefault = true;
    };
    extraConfig = {
      init.defaultBranch = "master";
      color = {
        diff = "auto";
        status = "auto";
        branch = "auto";
        interactive = "auto";
        ui = true;
        pager = true;
      };
      rerere.enabled = true;
      branch.sort = "-committerdate";
      pull.ff = "only";
    };
  };

  programs.wezterm = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = wezterm.config_builder()

      config.color_scheme = 'Tokyo Night'

      config.enable_tab_bar = false

      return config
    '';
    package = wrappedWezterm;
  };

  home.activation = {
     linkDesktopApplications = {
       after = [ "writeBoundary" "createXdgUserDirectories" ];
       before = [ ];
       data = ''
         rm -rf ${config.xdg.dataHome}/"applications/home-manager"
         mkdir -p ${config.xdg.dataHome}/"applications/home-manager"
         cp -Lr ${config.home.homeDirectory}/.nix-profile/share/applications/* ${config.xdg.dataHome}/"applications/home-manager/"
       '';
     };
   };

  programs.home-manager.enable = true;
}
