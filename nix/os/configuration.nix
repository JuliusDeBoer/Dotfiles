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
  boot.loader.grub.theme = "${
      (pkgs.fetchFromGitHub {
        owner = "Blaysht";
        repo = "grub_bios_theme";
        rev = "035554c30df6a10158a5a71acfbc4975045fc7ac";
        sha256 = "0hddg3xx3aykxsyl94bifrwbi0w18pmw1h07387rr2kx4lq091wi";
      })
    }/OldBIOS";

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
    shell = pkgs.zsh;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.julius = { pkgs, ... }: {
    home.stateVersion = "24.05";

    home.packages = [
      pkgs.clang
      pkgs.nodejs

      pkgs.pnpm
      pkgs.openssh
      pkgs.httpie
      pkgs.tlrc

      pkgs.neovim
      pkgs.zed-editor

      pkgs.firefox
      pkgs.spotify
      pkgs.vesktop

      pkgs.gnomeExtensions.open-bar
    ];

    home.sessionVariables = {
      EDITOR = "nvim";
    };

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
        favorite-app = [];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/open_terminal" = {
        name = "Open terminal";
        binding = "<Super>Return";
        command = "wezterm";
      };
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
    geist-font
    (rust-bin.selectLatestNightlyWith (toolchain: toolchain.default))
  ];

  programs.gnupg.agent = {
    enable = true;
    # TODO: Dont use curses
    pinentryPackage = pkgs.pinentry-curses;
  };

  system.stateVersion = "23.05";
}