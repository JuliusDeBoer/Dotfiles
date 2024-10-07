{ config, pkgs, ... }:

{
  imports = [
    ./modules/de/gnome.nix
    ./modules/git.nix
    ./modules/shell.nix
    ./modules/steam.nix
    ./modules/grub.nix
  ];
  services.resolved.enable = true;

  hardware.graphics = {
    enable = true;

    extraPackages = [ pkgs.amdvlk ];
    extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  services.pcscd.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.julius = {
    isNormalUser = true;
    description = "Julius";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.julius =
    { pkgs, ... }:
    {
      home.stateVersion = "24.05";

      home.packages = [
        pkgs.clang
        pkgs.nodejs

        pkgs.pnpm
        pkgs.openssh
        pkgs.httpie
        pkgs.onefetch

        pkgs.zed-editor

        pkgs.spotify
        pkgs.vesktop

        pkgs.gimp
        pkgs.inkscape

        pkgs.libreoffice

        pkgs.iosevka
      ];

      programs.neovim = {
        enable = true;
        defaultEditor = true;
      };

      programs.wezterm = {
        enable = true;
        enableBashIntegration = false;
        enableZshIntegration = true;
        extraConfig = ''
          local wezterm = require 'wezterm'
          local config = wezterm.config_builder()

          config.color_scheme = 'Tokyo Night'

          -- config.font = wezterm.font('Iosevka Term')
          config.front_end = "WebGpu"
          config.enable_tab_bar = false

          return config
        '';
      };
    };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget
    vim
    neovim
    git
    openssh
    bat
    geist-font
    (rust-bin.selectLatestNightlyWith (toolchain: toolchain.default))
  ];

  system.stateVersion = "23.05";
}
