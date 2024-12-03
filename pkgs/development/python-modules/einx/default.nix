{ lib
, python3
, fetchPypi
}:

python3.pkgs.buildPythonApplication rec {
  pname = "einx";
  version = "0.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-F/+HxqD2irNYwdpInwDpXx3hBv0S/xfQ+z4hCqoeX4w=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    frozendict
    numpy
    sympy
  ];

  passthru.optional-dependencies = with python3.pkgs; {
    keras = [
      keras
    ];
    torch = [
      torch
    ];
  };

  pythonImportsCheck = [ "einx" ];

  meta = with lib; {
    description = "Universal Tensor Operations in Einstein-Inspired Notation for Python";
    homepage = "https://pypi.org/project/einx/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "einx";
  };
}
