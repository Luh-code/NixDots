{ lib, stdenv, fetchFromGitHub, kernel }:

stdenv.mkDerivation rec {
  pname = "r8125";
  version = "9.014.01"; 

  src = fetchFromGitHub {
    owner = "notpeelz";
    repo = "r8125";
    rev = version;
    sha256 = "vYgAOmKFQZDKrZsS3ynXB0DrT3wU0JWzNTYO6FyMG9M=0sqyx7hd6vy7nfk6v6w3qc5x860lrn7vxm199pad0narvnb8an7k";
  };

  preBuild = ''
    substituteInPlace src/Makefile --replace "BASEDIR :=" "BASEDIR ?="
    substituteInPlace src/Makefile --replace "modules_install" "INSTALL_MOD_PATH=$out modules_install"
  '';

  makeFlags = [
    "BASEDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}"
  ];

  buildFlags = [ "modules" ];

  meta = with lib; {
    description = "Realtek RTL8125 2.5GbE Ethernet driver";
    license = licenses.gpl2;
    platforms = platforms.linux;
  };
}

