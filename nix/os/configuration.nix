{ config, pkgs, ... }:

{
  imports = [
    ./modules/de/gnome.nix
    ./modules/shell.nix
    ./modules/steam.nix
  ];

  # Grub
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.theme = "${
    (fetchTarball {
      url = "https://github.com/krypciak/crossgrub/releases/download/1.0.0/crossgrub.tar.gz";
      sha256 = "0v2dhcqip7sh41lk5rfbacmc13qmpqcfzrjpbwidymmzbs6dwlgp";
    })
  }";

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
        pkgs.tlrc
        pkgs.file
        pkgs.onefetch
        pkgs.fd
        pkgs.ripgrep
        pkgs.zoxide

        pkgs.zed-editor

        pkgs.spotify
        pkgs.vesktop

        pkgs.gimp
        pkgs.inkscape

        pkgs.libreoffice

        pkgs.iosevka
      ];

      programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        enableCompletion = true;
        plugins = [
          {
            name = "zsh-nix-shell";
            file = "nix-shell.plugin.zsh";
            src = pkgs.fetchFromGitHub {
              owner = "chisui";
              repo = "zsh-nix-shell";
              rev = "v0.8.0";
              sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
            };
          }
        ];
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
          alias = {
            fucked = "reset --hard HEAD";
          };
        };
      };

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

      home.shellAliases = {
        md = "mkdir";
        c = "clear";
        q = "exit";
        # z = "zoxide";
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
