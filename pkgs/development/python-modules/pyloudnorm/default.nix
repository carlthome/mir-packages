{ lib
, python3
, fetchPypi
}:

python3.pkgs.buildPythonApplication rec {
  pname = "pyloudnorm";
  version = "0.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Y81OGX3qTneVFg6gjtAtMYCRvOiD5Dam28WWMya3Hh4=";
  };

  nativeBuildInputs = [
    python3.pkgs.attrs
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    future
    numpy
    scipy
  ];

  pythonImportsCheck = [ "pyloudnorm" ];

  meta = with lib; {
    description = "Implementation of ITU-R BS.1770-4 loudness algorithm in Python";
    homepage = "https://pypi.org/project/pyloudnorm/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "pyloudnorm";
  };
}
