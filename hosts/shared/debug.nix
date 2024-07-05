{}:

let
  currentDirectory = builtins.getEnv "PWD";
  nixosPath = ../../modules/nixos;
in
{
  environment.etc."debug-current-directory".text = currentDirectory;
  environment.etc."debug-nixos-path".text = builtins.toString nixosPath;
}

