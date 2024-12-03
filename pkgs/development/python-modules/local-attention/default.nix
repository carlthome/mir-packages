{ lib
, python3
, fetchPypi
}:

python3.pkgs.buildPythonApplication rec {
  pname = "local-attention";
  version = "1.9.14";
  pyproject = true;

  src = fetchPypi {
    pname = "local_attention";
    inherit version;
    hash = "sha256-g08MUGhXtVAr3VrurCG7BJsPLk2WyRg5++5J16PPudw=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    einops
    torch
  ];

  pythonImportsCheck = [ "local_attention" ];

  meta = with lib; {
    description = "Local attention, window with lookback, for language modeling";
    homepage = "https://pypi.org/project/local-attention/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "local-attention";
  };
}
