{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Grub
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.zsh.enable = true;

  users.users.julius = {
    isNormalUser = true;
    description = "Julius";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [
      pkgs.zsh
    ];
    # programs.zsh.enable = true;
    shell = pkgs.zsh;
  };

  home-manager.users.julius = { pkgs, ... }: {
    home.stateVersion = "24.05";

    home.packages = [
      pkgs.tlrc
      pkgs.openssh
      pkgs.neovim
      pkgs.firefox
      pkgs.zed-editor
      pkgs.vesktop
      pkgs.rustup
      pkgs.pnpm
      pkgs.nodejs
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
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget
    vim
    neovim
    git
    openssh
    tlrc
    bat
    gnupg
    pinentry-curses
  ];

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  system.stateVersion = "23.05";
}