{ lib
, python3
, fetchPypi
, argbind
, pyloudnorm
, pystoi
, randomname
, torch-stoi
}:

python3.pkgs.buildPythonApplication rec {
  pname = "descript-audiotools";
  version = "0.7.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-LN02MCXHcbisxT1e+ex340+S4YInLEvn/QEYqZtqXio=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    argbind
    ffmpy
    flatten-dict
    importlib-resources
    ipython
    julius
    librosa
    markdown2
    matplotlib
    numpy
    protobuf
    pyloudnorm
    pystoi
    randomname
    rich
    scipy
    soundfile
    tensorboard
    torch
    torch-stoi
    torchaudio
    tqdm
  ];

  passthru.optional-dependencies = with python3.pkgs; {
    docs = [
      myst-nb
      myst-parser
      sphinx
      sphinx-multiversion
      sphinx-rtd-theme
    ];
    tests = [
      gradio
      line-profiler
      pesq
      pytest
      pytest-cov
      transformers
    ];
    whisper = [
      transformers
    ];
  };

  pythonImportsCheck = [ "descript_audiotools" ];

  meta = with lib; {
    description = "Utilities for handling audio";
    homepage = "https://pypi.org/project/descript-audiotools/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "descript-audiotools";
  };
}
