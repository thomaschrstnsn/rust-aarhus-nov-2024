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

  scripts.mmdc.exec = ''
    $DEVENV_ROOT/node_modules/.bin/mmdc $@
  '';

  # https://devenv.sh/languages/
  languages.rust.enable = true;
  languages.rust.channel = "stable";

  languages.python.enable = true;
  languages.python.directory = "./pyO3-talk/";

  # for mermaid-cli
  languages.javascript = {
    enable = true;
    npm.enable = true;
    npm.install.enable = true;
  };

  enterShell = ''
    figlet -f univers -w 120 rust aarhus | lolcat
    figlet -f univers -w 120 PyO3 | lolcat
    figlet -f univers -w 120 Pool Monitor | lolcat
    echo
    echo "✅" $(presenterm --version)
    echo "✅" $(cargo --version)
    echo "✅" $(python --version)
    echo "✅" mermaid-cli $(mmdc --version)
    echo
    echo usage:
    echo "$ present <slides.md>"
  '';
}
