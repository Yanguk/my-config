{
  config,
  pkgs,
  ...
}:
let
  username = "yanguk";
in
{
  home.username = username;
  home.homeDirectory = "/Users/${username}";

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
