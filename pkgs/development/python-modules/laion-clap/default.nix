{ lib
, python3
, fetchPypi
}:

python3.pkgs.buildPythonApplication rec {
  pname = "laion-clap";
  version = "1.1.6";
  pyproject = true;

  src = fetchPypi {
    pname = "laion_clap";
    inherit version;
    hash = "sha256-qY9RyufVQo9vNGqLa8B4p8orX2H+uiJy65Gbe36fDe4=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    braceexpand
    ftfy
    h5py
    librosa
    llvmlite
    numpy
    pandas
    progressbar
    regex
    scikit-learn
    scipy
    soundfile
    torchlibrosa
    tqdm
    transformers
    wandb
    webdataset
    wget
  ];

  pythonImportsCheck = [ "laion_clap" ];

  meta = with lib; {
    description = "Contrastive Language-Audio Pretraining Model from LAION";
    homepage = "https://pypi.org/project/laion-clap/";
    license = licenses.cc0;
    maintainers = with maintainers; [ ];
    mainProgram = "laion-clap";
  };
}
