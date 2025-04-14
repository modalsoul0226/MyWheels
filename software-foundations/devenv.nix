{ pkgs, ... }:

{
  # https://devenv.sh/packages/
  packages = with pkgs; [ coq git ocaml opam ];

  enterShell = ''
    echo 🐪 Initializing OCaml environment...
    eval $(opam env)
  '';

  cachix.enable = false;
}
