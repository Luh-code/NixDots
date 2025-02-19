{ stdenv, pkgs }:

let 
  interceptorFont = builtins.path {
    path = fonts/interceptor.zip;
    name = "interceptor-font";
  };
in
stdenv.mkDerivation {
  name = "interceptor-font"; 

  src = interceptorFont;

  unpackPhase = ''
    runHook preUnpack
    ${pkgs.unzip}/bin/unzip $src

    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/usr/local/share/fonts
    install -m444 ./Interceptor.otf $out/usr/local/share/fonts
  
    runHook postInstall
  '';
}
