{ lib
, python3
, fetchFromGitHub
, opencv-contrib-python
}:

python3.pkgs.buildPythonApplication rec {
  pname = "mediapipe";
  version = "0.10.11";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "google";
    repo = "mediapipe";
    rev = "v${version}";
    hash = "sha256-+9Io6ta7wzjR6r0jVHPnEvro+he2wBw9nlbdIbcjjpE=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    absl-py
    attrs
    flatbuffers
    jax
    jaxlib-bin
    matplotlib
    numpy
    opencv-contrib-python
    protobuf
    sounddevice
    torch
  ];

  pythonImportsCheck = [ "mediapipe" ];

  meta = with lib; {
    description = "Cross-platform, customizable ML solutions for live and streaming media";
    homepage = "https://github.com/google/mediapipe";
    license = licenses.asl20;
    maintainers = with maintainers; [ ];
    mainProgram = "mediapipe";
  };
}
