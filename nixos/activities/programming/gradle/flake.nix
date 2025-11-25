# I am specifically using Gradle 8.8, since it is required for COMP2511 at UNSW
{
  description = "Gradle 8.8";

  inputs = {
    nixpkgs.url = "https://github.com/NixOS/nixpkgs/archive/d9f258945d3532e399d7f73fcd9b6fa5b4393e01.tar.gz";
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }:
    {
      packages.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.gradle_8;
    };
}
