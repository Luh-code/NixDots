{ inputs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Luh-code";
    userEmail = "Lasse@hueffler.de";
    extraConfig = {
      safe = {
        directory = "*";
      };
    };
  };
}
