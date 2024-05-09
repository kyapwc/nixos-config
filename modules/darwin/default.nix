{pkgs, ...}: {
  users.users."kenyap" = {
    name = "kenyap";
    home = "/Users/kenyap";
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
    systemPackages = import "./packages.nix";
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
    casks = ["raycast"];
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
      KeyRepeat = 1;
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
    };

    skhd = {enable = true;};

    sketchybar = {enable = true;};
  };
}
