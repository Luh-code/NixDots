{ pkgs, lib, ... }:

{
  vim.tabline.nvimBufferline = {
    enable = true;

    setupOpts = {
      options = {
        always_show_bufferline = true;
        tab_size = 12;
        seperator_style = "padded_slope";
        style_preset = "no_italic";
      };
    };

    mappings = {
      cycleNext = "<Tab>";
      cyclePrevious = "<S-Tab>";
      closeCurrent = "<leader><Tab>q";
    };
  };
}
