{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/packages/
  packages = with pkgs; [
    figlet
    presenterm
    lolcat
    qrencode
    plantuml

    # pyo3 talk
    maturin
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

  languages.python.enable = true;
  languages.python.directory = "./pyO3-talk/";

  enterShell = ''
    figlet -f epic -w 120 pyO3-talk
    echo
    echo "✅" $(presenterm --version)
    echo
    echo usage:
    echo "$ present <slides.md>"
  '';
}
