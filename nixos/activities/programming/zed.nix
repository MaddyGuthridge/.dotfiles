# -- Source - https://stackoverflow.com/a/68523368
# -- Posted by nh2
# -- Retrieved 2026-05-22, License - CC BY-SA 4.0
#
# This snippet shows how to override a nix package by copying all of the
# files of an already-built package, and then modifying some of them,
# thus avoiding a full rebuild.
#
# Example usage:
#
# Build the package:
#     nix-build --no-out-link change-file-after-build-example.nix
# See our replacement worked:
#     $ $(nix-build --no-out-link change-file-after-build-example.nix)/share/git/contrib/fast-import/git-import.sh
#     USAGE: git-import branch import-message
{
  environment,
  pkgs ? import <nixpkgs> { },
  lib ? pkgs.lib,
  ...
}:
let
  originalPackage = pkgs.unstable.zed-editor;

  # We use `overrideAttrs` instead of defining a new `mkDerivation` to keep
  # the original package's `output`, `passthru`, and so on.
  zeditor = originalPackage.overrideAttrs (old: {
    name = "zed-overridden";

    # Using `buildCommand` replaces the original packages build phases.
    buildCommand = ''
      set -euo pipefail

      ${
        # Copy original files, for each split-output (`out`, `dev` etc.).
        # E.g. `${package.dev}` to `$dev`, and so on. If none, just "out".
        # Symlink all files from the original package to here (`cp -rs`),
        # to save disk space.
        # We could alternatiively also copy (`cp -a --no-preserve=mode`).
        lib.concatStringsSep "\n" (
          map (outputName: ''
            echo "Copying output ${outputName}"
            set -x
            cp -rs --no-preserve=mode "${originalPackage.${outputName}}" "''$${outputName}"
            set +x
          '') (old.outputs or [ "out" ])
        )
      }

      # Example change:
      # Change `usage:` to `USAGE:` in a shell script.
      # Make the file to be not a symlink by full copying using `install` first.
      # This also makes it writable (files in the nix store have `chmod -w`).

      install -D ${./zeditor1024.png} $out/share/icons/hicolor/1024x1024/apps/zed.png
      install -D ${./zeditor512.png} $out/share/icons/hicolor/512x512/apps/zed.png
    '';

  });
in
{
  environment.systemPackages = [ 
    zeditor
    (pkgs.writeShellScriptBin "zed" "exec -a $0 ${zeditor}/bin/zeditor $@")
  ];
}
