{ lib, stdenv, pkgs }:

{
nvchad = stdenv.mkDerivation rec {
  pname = "nvchad";
  version = "";
  dontBuild = true;

  src = pkgs.fetchFromGitHub {
    owner = "NvChad";
    repo = "starter";
    #rev = "refs/heads/v2.5";
    rev = "refs/heads/main";
    # rev = "32b0a008a96a3dd04675659e45a676b639236a98";
    # sha256 = "sha256-s/nnGUGFgJ+gpMAOO3hYJ6PrX/qti6U1wyB6PzTiNtM=";
    #sha256 = "sha256-ehz0vQHY1DlGPvhilx565V2pIZo+WZkK8kDcKMgRDaA=";
    sha256 = "sha256-J99bmCY/AC3/iLMDb4y4pFpJF/2Afc00FQQnQ0LbMo4=";
  };

  #configPhase = ''
  #  mkdir $out
  #  mkdir -p $out/lua/custom/
  #''

  installPhase = ''
    #export out=/tmp/nvchad
    mkdir $out
    echo $out
    mkdir -p "$out/lua/custom"
    cp -r $src/* "$out/"
    cp -r ${./custom}/* "$out/lua/custom/"
    chmod -R 755 $out
    '';#mkdir -p $out/lua/custom
    #cp -aR /etc/nixos/nvchad/custom/* $out/lua/custom/
    #'';
    #cp -r * "$out/"
    #mkdir -p "$out/lua/custom"
    #cp -r ${./custom}/* "$out/lua/custom/"
  #'';

  meta = with lib; {
    description = "NvChad";
    homepage = "https://github.com/NvChad/NvChad";
    platforms = platforms.all;
    maintainers = [ maintainers.rayandrew ];
    license = licenses.gpl3;
  };
};

}
