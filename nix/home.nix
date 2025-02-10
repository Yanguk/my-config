{
  config,
  pkgs,
  ...
}:
{
  home.username = "yanguk";
  home.homeDirectory = "/Users/yanguk";

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
