{
  description = "DevShell with Jekyll (Ruby + Bundler) and Protobuf";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            # Ruby + Bundler
            pkgs.ruby
            pkgs.bundler

            # Correct protobuf package on nixos-24.05
            pkgs.protobuf
          ];

          shellHook = ''
            export GEM_HOME=$PWD/.gem
            export PATH="$GEM_HOME/bin:$PATH"

            export BUNDLE_PATH="$GEM_HOME"
            export BUNDLE_BIN="$GEM_HOME/bin"
            export BUNDLE_GEMFILE=$PWD/Gemfile

            unset GEM_PATH

            echo "Ruby version: $(ruby -v)"
            echo "Gem home: $GEM_HOME"
            echo "protoc: $(protoc --version 2>/dev/null || echo 'not found')"
          '';
        };
      });
}
