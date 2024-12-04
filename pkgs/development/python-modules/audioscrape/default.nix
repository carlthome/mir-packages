{ lib
, python3
, fetchPypi
, mediapipe
, soundcloud-lib
, ...
}:

python3.pkgs.buildPythonApplication rec {
  pname = "audioscrape";
  version = "0.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-O97DAYgN0Cg76e4y5dpNPbShQM0ZjBKYdWxW4mDkU64=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.setuptools-scm
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = with python3.pkgs; [
    mediapipe
    requests
    soundcloud-lib
    soundfile
    tqdm
    yt-dlp
  ];

  passthru.optional-dependencies = with python3.pkgs; {
    tests = [
      pytest
      pytest-cov
    ];
  };

  pythonImportsCheck = [ "audioscrape" ];

  meta = with lib; {
    description = "Scrape online audio with a simple command-line interface";
    homepage = "https://pypi.org/project/audioscrape/";
    license = licenses.mit;
    maintainers = with maintainers; [ carlthome ];
    mainProgram = "audioscrape";
  };
}
