{ inputs, ...}:

{
  programs.alvr = {
    enable = true;

    openFirewall = true;
  };
}
