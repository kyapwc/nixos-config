{
  pkgs,
  pwnvim,
  ...
}: {
  home = {
    # Backwards compat (don't change it when changing package input)
    stateVersion = "23.11";
    packages = [
      pkgs.ripgrep
      pkgs.fd
      pkgs.curl
      pkgs.less
      pkgs.tree
      # pwnvim.packages."aarch64-darwin".default; # disable first since I don't need it for now
    ];
    sessionVariables = {
      PAGER = "less";
      CLICOLOR = 1;
      EDITOR = "nvim";
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

      # plugins = [
      #   {
      #     name = "zsh-autosuggestions";
      #     src = pkgs.fetchGit {
      #       owner = "zsh-users";
      #       repo = "zsh-autosuggestions";
      #       rev = "v0.7.0";
      #     };
      #   }
      #   {
      #     name = "zsh-syntax-highlighting";
      #     src = pkgs.fetchGit {
      #       owner = "zsh-users";
      #       repo = "zsh-syntax-highlighting";
      #       rev = "0.8.0";
      #     };
      #   }
      # ];

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

  home.file.".inputrc".text = ''
    set show-all-if-ambiguous on
    set completion-ignore-case on
    set mark-directories on
    set mark-symlinked-directories on
    set match-hidden-files off
    set visible-stats on
    set keymap vi
    set editing-mode vi-insert
  '';
}
