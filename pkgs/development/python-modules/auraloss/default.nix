{ lib
, python3
, fetchPypi
}:

python3.pkgs.buildPythonApplication rec {
  pname = "auraloss";
  version = "0.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-hus7zoGq9XnZ4t9ZsMrnq43nk5AsNEr3LyVdU8PVyVQ=";
  };

  nativeBuildInputs = [
    python3.pkgs.attrs
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    numpy
    torch
  ];

  passthru.optional-dependencies = with python3.pkgs; {
    all = [
      librosa
      matplotlib
      scipy
    ];
  };

  pythonImportsCheck = [ "auraloss" ];

  meta = with lib; {
    description = "Collection of audio-focused loss functions in PyTorch";
    homepage = "https://pypi.org/project/auraloss/";
    license = licenses.asl20;
    maintainers = with maintainers; [ ];
    mainProgram = "auraloss";
  };
}
