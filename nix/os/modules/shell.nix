{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    interactiveShellInit = ''
      eval "$(zoxide init zsh)"
    '';
  };

  users.users.julius = {
    packages = [ pkgs.zsh ];
    shell = pkgs.zsh;
  };

  home-manager.users.julius =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.tlrc
        pkgs.file
        pkgs.fd
        pkgs.ripgrep
        pkgs.zoxide
        pkgs.p7zip
      ];

      home.shellAliases = {
        md = "mkdir";
        c = "clear";
        q = "exit";
        # z = "zoxide";
      };

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
    };
}
