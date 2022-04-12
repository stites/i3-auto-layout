{ lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "i3-auto-layout";
  version = "0.2";

  src = ./.; 

  cargoSha256 = "sha256-c+azlLEjJYDgVXF2j/8HhNtfzo/yj9HP6NHA+PdOcCE=";

  # Currently no tests are implemented, so we avoid building the package twice
  doCheck = false;

  meta = with lib; {
    description = "Automatic, optimal tiling for i3wm";
    homepage = "https://github.com/chmln/i3-auto-layout";
    license = licenses.mit;
    maintainers = with maintainers; [ mephistophiles ];
    platforms = platforms.linux;
  };
}
