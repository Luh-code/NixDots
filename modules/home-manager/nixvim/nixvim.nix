{ inputs, ... }:

{
  imports =
    [
      inputs.nixvim.homeManagerModules.nixvim
    ];

  programs.nixvim = {
    enable = true;
    
    plugins.bufferline = {
      enable = true;
    };
  };
}
