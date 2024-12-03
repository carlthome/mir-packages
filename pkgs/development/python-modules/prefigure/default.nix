{ lib
, python3
, fetchPypi
}:

python3.pkgs.buildPythonApplication rec {
  pname = "prefigure";
  version = "0.0.9";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-yMHLsCOTuQQtNjCbYyMGHIAXgUW0HUL1/jooB3MiGac=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    #argparse
    configparser
    gin-config
    gradio
    pytorch-lightning
    wandb
  ];

  pythonImportsCheck = [ "prefigure" ];

  meta = with lib; {
    description = "Run configuration management utils: combines configparser, argparse, and wandb.API";
    homepage = "https://pypi.org/project/prefigure/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "prefigure";
  };
}
