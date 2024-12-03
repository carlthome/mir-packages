{ lib
, python3
, fetchPypi
, pystoi
}:

python3.pkgs.buildPythonApplication rec {
  pname = "torch-stoi";
  version = "0.2.1";
  pyproject = true;

  src = fetchPypi {
    pname = "torch_stoi";
    inherit version;
    hash = "sha256-r7K3eE9XlKihFGNAcwSYuqkNHEA1OvMMHsv2tj1fjd0=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    numpy
    pystoi
    torch
    torchaudio
  ];

  pythonImportsCheck = [ "torch_stoi" ];

  meta = with lib; {
    description = "Computes Short Term Objective Intelligibility in PyTorch";
    homepage = "https://pypi.org/project/torch-stoi/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "torch-stoi";
  };
}
