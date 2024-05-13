{pkgs, ...}:
let
  configDir = toString ./.;
  systemPackages = import "${configDir}/packages.nix" { inherit pkgs; };
  # yabaiExtraConfig = import "${configDir}/yabai_config.nix" { inherit pkgs; };
  # skhdConfig = import "${configDir}/skhd_config.nix" { inherit pkgs; };

  yabaiRc = (builtins.readFile "${configDir}/yabairc");
  skhdRc = (builtins.readFile "${configDir}/skhdrc");
in
{
  users.users."kenyap" = {
    name = "kenyap";
    home = "/Users/kenyap";
    createHome = true;
  };

  # Here go the darwin preferences and configuration
  programs.zsh.enable = true;
  environment = {
    shells = with pkgs; [bash zsh];
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
    systemPackages = systemPackages;
    systemPath = ["/opt/homebrew/bin"];
    pathsToLink = ["/Applications"];
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

  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.brewfile = true;
    # able to install MacOS Apps from App Store, just specify it here
    masApps = {};
    casks = ["raycast" "arc"];
    # brews = ["koekeishiya/formulae/yabai" "koekeishiya/formulae/skhd"];
  };

  fonts.fontDir.enable = true;
  fonts.fonts = [
    (pkgs.nerdfonts.override {fonts = ["FiraCode" "SourceCodePro" "Cousine"];})
  ];

  system.defaults = {
    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      _FXShowPosixPathInTitle = true;
    };

    NSGlobalDomain = {
      AppleShowAllExtensions = true;
      InitialKeyRepeat = 14;
      KeyRepeat = 5;
    };

    dock = {
      autohide = true;
    };
  };

  services = {
    nix-daemon.enable = true;

    yabai = {
      enable = true;
      enableScriptingAddition = true;
      config = {
        auto_balance = "on";
        mouse_modifier = "ctrl";
        focus_follows_mouse = "on";
        mouse_action1 = "move";
        mouse_follows_focus = "on";
      };
      # extraConfig = yabaiExtraConfig;
      extraConfig = yabaiRc;
    };

    skhd = {enable = true; skhdConfig = skhdRc; };

    sketchybar = {enable = true;};
  };
}
