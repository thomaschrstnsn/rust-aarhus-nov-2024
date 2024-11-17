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

  scripts.present-pyo3.exec = ''
    rm -rf ./pyO3-talk/demo-project/
    present ./pyO3-talk/pyo3.md $@
  '';

  # https://devenv.sh/languages/
  languages.rust.enable = true;
  languages.rust.channel = "stable";

  languages.python.enable = true;
  languages.python.directory = "./pyO3-talk/";

  enterShell = ''
    figlet -w 120 rust aarhus | lolcat
    echo
    echo "✅" $(presenterm --version)
    echo "✅" $(cargo --version)
    echo "✅" $(python --version)
    echo
    echo usage:
    echo "$ present <slides.md>"
  '';
}
