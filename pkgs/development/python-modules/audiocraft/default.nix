{ lib
, python3
, fetchPypi
, demucs
, flashy
, hydra-colorlog
}:

python3.pkgs.buildPythonPackage rec {
  pname = "audiocraft";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-GA4bbAYOmo7LX/l3ddyFTA9FWybgforLVBGIL1HT2Gg=";
  };

  propagatedBuildInputs = with python3.pkgs; [
    av
    demucs
    einops
    encodec
    flashy
    gradio
    huggingface-hub
    hydra-colorlog
    hydra-core
    julius
    librosa
    num2words
    numpy
    protobuf
    sentencepiece
    spacy
    torch
    torchaudio
    torchmetrics
    tqdm
    xformers
  ];

  pythonImportsCheck = [ "audiocraft" ];

  meta = with lib; {
    description = "Audio generation research library for PyTorch";
    homepage = "https://pypi.org/project/audiocraft/";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ carlthome ];
  };
}
