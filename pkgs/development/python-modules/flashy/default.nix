{ lib
, python3
, fetchPypi
, dora-search
}:

python3.pkgs.buildPythonApplication rec {
  pname = "flashy";
  version = "0.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-5/WvwxMNWvXdvOHSL0pynxkABVSIywtTHNvBkNx56f0=";
  };

  nativeBuildInputs = with python3.pkgs; [
    setuptools
    wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    colorlog
    dora-search
    numpy
    torch
  ];

  patches = [
    ./torch-distributed-optional.patch
  ];

  pythonImportsCheck = [ "flashy" ];

  meta = with lib; {
    description = "Minimal solver for deep learning";
    homepage = "https://pypi.org/project/flashy/";
    license = licenses.mit;
    maintainers = with maintainers; [ carlthome ];
  };
}
