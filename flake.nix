{
  description = "Automatic, optimal tiling for i3wm";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }: {
      overlay = final: prev: {
        i3-auto-layout = prev.callPackage ./. {};
      };
    } // flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      rec {
        defaultPackage = pkgs.callPackage ./. {};
        defaultApp = flake-utils.lib.mkApp { drv = defaultPackage; };
      }
    );
}
