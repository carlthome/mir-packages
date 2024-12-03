{ lib
, python3
, fetchPypi
}:

python3.pkgs.buildPythonApplication rec {
  pname = "einops-exts";
  version = "0.0.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-YW8UWzQR+Onjvl2lyWi743LlXCSd4R+qkJx6S3RYCmw=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    einops
  ];

  pythonImportsCheck = [ "einops_exts" ];

  meta = with lib; {
    description = "Einops Extensions";
    homepage = "https://pypi.org/project/einops-exts/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "einops-exts";
  };
}
