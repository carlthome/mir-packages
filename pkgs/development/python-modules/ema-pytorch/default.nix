{ lib
, python3
, fetchPypi
}:

python3.pkgs.buildPythonApplication rec {
  pname = "ema-pytorch";
  version = "0.5.2";
  pyproject = true;

  src = fetchPypi {
    pname = "ema_pytorch";
    inherit version;
    hash = "sha256-T15IOQtle5hHR7h1L6Wa7+WT3Th4VDh3Xvs4XcUVRwc=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    torch
  ];

  pythonImportsCheck = [ "ema_pytorch" ];

  meta = with lib; {
    description = "Easy way to keep track of exponential moving average version of your pytorch module";
    homepage = "https://pypi.org/project/ema-pytorch/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "ema-pytorch";
  };
}
