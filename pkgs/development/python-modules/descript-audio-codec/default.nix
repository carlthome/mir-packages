{ lib
, python3
, fetchPypi
, argbind
, descript-audiotools
}:

python3.pkgs.buildPythonApplication rec {
  pname = "descript-audio-codec";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-VqWlQRKGhoIVcHVlEtQFU06depeLNK3yUQz+mB8LAOA=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    argbind
    descript-audiotools
    einops
    numpy
    torch
    torchaudio
    tqdm
  ];

  passthru.optional-dependencies = with python3.pkgs; {
    dev = [
      encodec
      jupyterlab
      onnx
      onnx-simplifier
      pandas
      pesq
      psutil
      pynvml
      pytest
      pytest-cov
      seaborn
      tabulate
      watchdog
    ];
  };

  pythonImportsCheck = [ "descript_audio_codec" ];

  meta = with lib; {
    description = "A high-quality general neural audio codec";
    homepage = "https://pypi.org/project/descript-audio-codec/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "descript-audio-codec";
  };
}
