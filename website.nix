# based on https://github.com/ipetkov/ipetkov.github.io/blob/e5439410ef38130179ee8548765a8f94fcf3ba52/blog.nix
{ stdenv
, zola
}:

stdenv.mkDerivation {
  pname = "website";
  version = "0.0.6";

  src = ./.;

  buildInputs = [ zola ];

  configurePhase = ''
    echo link any themes that we may want
  '';

  buildPhase = ''
    zola build
  '';

  installPhase = ''
    mv public $out
  '';
}
