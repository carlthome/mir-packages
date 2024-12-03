{ lib
, python3
, fetchPypi
}:

python3.pkgs.buildPythonApplication rec {
  pname = "x-transformers";
  version = "1.31.14";
  pyproject = true;

  src = fetchPypi {
    pname = "x_transformers";
    inherit version;
    hash = "sha256-k1DWZYnhN+IBQyBAKQh58nsQZHfZ4+SFSOAkNvNGNsA=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    einops
    torch
  ];

  checkInputs = with python3.pkgs; [ pytest-runner ];

  pythonImportsCheck = [ "x_transformers" ];

  meta = with lib; {
    description = "X-Transformers - Pytorch";
    homepage = "https://pypi.org/project/x-transformers/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "x-transformers";
  };
}
