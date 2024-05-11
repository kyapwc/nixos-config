{
  pkgs,
  # pwnvim,
  ...
}: {
  home = {
    # Backwards compat (don't change it when changing package input)
    stateVersion = "23.11";
    packages = with pkgs; [
      ripgrep
      fd
      curl
      less
      tree
      # pwnvim.packages."aarch64-darwin".default; # disable first since I don't need it for now
    ];
    sessionVariables = {
      PAGER = "less";
      CLICOLOR = 1;
      EDITOR = "nvim";
      NIXPKGS_ALLOW_UNFREE=1;
    };
    username = "kenyap";
    homeDirectory = "/Users/kenyap";
  };

  programs = {
    home-manager = {enable = true;};
    bat = {
      enable = true;
      config = {theme = "TwoDark";};
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    eza = {enable = true;};
    git = {enable = true;};
    zsh = {
      enable = true;
      enableCompletion = true;

      autosuggestion = {enable = true;};
      syntaxHighlighting = {enable = true;};

      shellAliases = {
        nixswitch = "darwin-rebuild switch --flake ~/nixos-config/.#";
        nixup = "pushd ~/nixos-config; nix flake update; nixswitch; popd";
      };

      oh-my-zsh = {
        enable = true;
        custom = "$HOME/dotfiles/zsh/.oh-my-zsh/custom";
        plugins = ["git" "zsh-autosuggestions" "zsh-syntax-highlighting"];
        theme = "spaceship";
      };
    };

    starship = {
      enable = true;
      enableBashIntegration = true;
      enableTransience = true;
      enableZshIntegration = true;
    };

    wezterm = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };

  home.file.".inputrc".source = ./dotfiles/inputrc;
}
