{
  description = "A Nix-flake-based Quarto development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs = { self , nixpkgs ,... }: let
    # system should match the system you are running on
    system = "x86_64-linux";
  in {
    devShells."${system}".default = let
      pkgs = import nixpkgs { inherit system; };
    in pkgs.mkShell {
      packages = with pkgs; [
        jekyll
        ruby
        bundler
      ];

      shellHook = ''
        export GEM_HOME=$PWD/.gem
        export GEM_PATH=$GEM_HOME
        export PATH=$GEM_HOME/bin:$PATH

        # Install specific bundler version
        gem install bundler

        ruby -v
        bundler -v
        fish
      '';
    };
  };
}
