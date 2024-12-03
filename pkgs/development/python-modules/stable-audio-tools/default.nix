{ lib
, python3
, fetchPypi
, aeiou
, prefigure
, pedalboard
, alias-free-torch
, auraloss
, descript-audio-codec
, einops-exts
, ema-pytorch
, laion-clap
, local-attention
, v-diffusion-pytorch
, vector-quantize-pytorch
, x-transformers
}:

python3.pkgs.buildPythonApplication rec {
  pname = "stable-audio-tools";
  version = "0.0.16";
  pyproject = true;

  src = fetchPypi {
    pname = "stable_audio_tools";
    inherit version;
    hash = "sha256-8LsoYqMCiymZez0CSVZe6IlH3LsPa8Ma9aTZna/e86I=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    aeiou
    alias-free-torch
    auraloss
    descript-audio-codec
    einops
    einops-exts
    ema-pytorch
    encodec
    gradio
    huggingface-hub
    importlib-resources
    k-diffusion
    laion-clap
    local-attention
    pandas
    pedalboard
    prefigure
    pytorch-lightning
    pywavelets
    s3fs
    safetensors
    sentencepiece
    torch
    torchaudio
    torchmetrics
    tqdm
    transformers
    v-diffusion-pytorch
    vector-quantize-pytorch
    wandb
    webdataset
    x-transformers
  ];

  pythonImportsCheck = [ "stable_audio_tools" ];

  meta = with lib; {
    description = "Training and inference tools for generative audio models from Stability AI";
    homepage = "https://pypi.org/project/stable-audio-tools/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "stable-audio-tools";
  };
}
