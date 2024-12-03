{ lib
, python3
, fetchPypi
, einx
}:

python3.pkgs.buildPythonApplication rec {
  pname = "vector-quantize-pytorch";
  version = "1.15.6";
  pyproject = true;

  src = fetchPypi {
    pname = "vector_quantize_pytorch";
    inherit version;
    hash = "sha256-fH//6eoVZ46QT6JlyhTlAtQ9AujyWEuZFg4+FoD7n9Q=";
  };

  nativeBuildInputs = [
    python3.pkgs.hatchling
  ];

  propagatedBuildInputs = with python3.pkgs; [
    einops
    einx
    torch
  ];

  passthru.optional-dependencies = with python3.pkgs; {
    examples = [
      torchvision
      tqdm
    ];
  };

  pythonImportsCheck = [ "vector_quantize_pytorch" ];

  meta = with lib; {
    description = "Vector Quantization - Pytorch";
    homepage = "https://pypi.org/project/vector-quantize-pytorch/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "vector-quantize-pytorch";
  };
}
