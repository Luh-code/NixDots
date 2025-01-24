{ stdenv, pkgs }:

let version = "1.0"; in
stdenv.mkDerivation {
  version = "${version}";
  name = "interceptor-${version}"; 

  src = ../../../resources/fonts/interceptor.zip;

  unpackPhase = ''
    runHook preUnpack
    ${pkgs.unzip}/bin/unzip $src

    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/usr/local/share/fonts
    install -m444 ./interceptor.ttf $out/usr/local/share/fonts
  
    runHook postInstall
  '';
}
