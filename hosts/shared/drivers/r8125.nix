{ lib, stdenv, fetchurl, kernel }:

stdenv.mkDerivation rec {
  pname = "r8125";
  version = "9.014.01"; # Check for the latest version on Realtek's website!

  src = "/etc/nixos/hosts/shared/drivers/r8125-9.014.01.tar.bz2";

  nativeBuildInputs = kernel.moduleBuildDependencies;
  hardeningDisable = [ "pic" "format" ];

  buildPhase = ''
    make -C src/ clean
    make -C src/ KSRC=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build
  '';

  installPhase = ''
    mkdir -p $out/lib/modules/${kernel.modDirVersion}/kernel/drivers/net/ethernet/realtek
    cp src/r8125.ko $out/lib/modules/${kernel.modDirVersion}/kernel/drivers/net/ethernet/realtek/
  '';

  meta = with lib; {
    description = "Realtek RTL8125 2.5GbE Ethernet driver";
    license = licenses.gpl2;
    platforms = platforms.linux;
  };
}

