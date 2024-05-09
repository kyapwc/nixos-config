{
  description = "Testing out Nix-Darwin";

  inputs = {
    # Where we get the most of our software
    # Giant monorepo with recipes called `derivations` that say how to build software
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable"; # Other options, nixos-22-11

    # Home manager is a way of managing nix specifically to software
    # manages config links into home directory
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Controls system level software and settings (inclusive of fonts)
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    darwinConfigurations.Kens-MacBook-Pro-2 = inputs.darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      pkgs = import inputs.nixpkgs {
        system = "aarch64-darwin";
      };

      modules = [
        ({pkgs, ...}: {
          users.users."kenyap" = {
            name = "kenyap";
            home = "/Users/kenyap";
          };

          # Here go the darwin preferences and configuration
          programs.zsh.enable = true;
          environment = {
            shells = [pkgs.bash pkgs.zsh];
            loginShell = pkgs.zsh;
            shellAliases = {
              gs = "git status";
              glog = "git log --oneline --decorate --color --graph --all";
              gco = "git checkout";
              gb = "git branch";
              ref = "source ~/.zshrc && echo refresh zshrc done";
              vimrc = "nvim ~/dotfiles/nvim/.config/nvim/init.lua";
              zshrc = "nvim ~/dotfiles/zsh/.zshrc";
              yabairc = "nvim ~/dotfiles/yabai/.yabairc";
              skhdrc = "nvim ~/dotfiles/yabai/.skhdrc";
              cl = "clear";
              ":q" = "exit";
              scripts = "cat package.json | jq -C .'scripts' | less -R";
              filesize = "du -hs ";
            };
            systemPackages = [pkgs.coreutils];
          };
          nix.extraOptions = ''
            experimental-features = nix-command flakes
          '';

          documentation.enable = true;
          documentation.man.enable = true;

          system = {
            keyboard = {
              enableKeyMapping = true;
              remapCapsLockToControl = true;
            };
            stateVersion = 4;
          };

          fonts.fontDir.enable = true;
          fonts.fonts = [
            (pkgs.nerdfonts.override {fonts = ["FiraCode" "SourceCodePro" "Cousine"];})
          ];

          services.nix-daemon.enable = true;
          system.defaults = {
            finder = {
              AppleShowAllExtensions = true;
              AppleShowAllFiles = true;
              _FXShowPosixPathInTitle = true;
            };

            NSGlobalDomain = {
              AppleShowAllExtensions = true;
              InitialKeyRepeat = 14;
              KeyRepeat = 1;
            };

            dock = {
              autohide = true;
            };
          };
        })

        inputs.home-manager.darwinModules.home-manager
        {
          # Can do for emails and so on later (research later)
          home-manager = {
            useGlobalPkgs = true;
            # useUserPkgs = true;
            users.kenyap.imports = [
              ({pkgs, ...}: {
                home = {
                  # Backwards compat (don't change it when changing package input)
                  stateVersion = "23.11";
                  packages = [pkgs.ripgrep pkgs.fd pkgs.curl pkgs.less pkgs.tree];
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
              })
            ];
          };
        }
      ];
    };
  };
}
