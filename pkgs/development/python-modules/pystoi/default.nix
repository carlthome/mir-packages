{ lib
, python3
, fetchPypi
}:

python3.pkgs.buildPythonApplication rec {
  pname = "pystoi";
  version = "0.4.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-HG9Q1vv+5GsAySJFjNvScijZgwyoHOp4j9YA/C995uQ=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    numpy
    scipy
  ];

  pythonImportsCheck = [ "pystoi" ];

  meta = with lib; {
    description = "Computes Short Term Objective Intelligibility measure";
    homepage = "https://pypi.org/project/pystoi/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "pystoi";
  };
}
