# based on https://github.com/ipetkov/ipetkov.github.io/blob/e5439410ef38130179ee8548765a8f94fcf3ba52/blog.nix
{ stdenv
, zola
}:

let
  version = builtins.date "+%Y.%m.%d-%H.%M.%S";
in
stdenv.mkDerivation {
  name = "website";
  
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
