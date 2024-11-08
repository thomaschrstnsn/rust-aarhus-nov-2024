{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/packages/
  packages = with pkgs; [
    figlet
    presenterm
    lolcat
    qrencode
    plantuml
  ];

  scripts.present.exec = ''
    presenterm -x -X --config-file presenterm-config.yaml $@
  '';

  scripts.puml.exec = ''
    plantuml -utxt -pipe 2> /dev/null
  '';

  # https://devenv.sh/languages/
  languages.rust.enable = true;
  languages.rust.channel = "stable";

  enterShell = ''
    figlet -f epic -w 120 pyO3-talk
    echo
    echo "✅" $(presenterm --version)
    echo
    echo usage:
    echo "$ present <slides.md>"
  '';
}
