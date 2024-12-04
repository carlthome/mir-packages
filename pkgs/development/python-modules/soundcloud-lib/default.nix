{ lib
, python3
, fetchPypi
}:

python3.pkgs.buildPythonApplication rec {
  pname = "soundcloud-lib";
  version = "0.6.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-hRadbn45zTntMGjr99VKGm+oZZWSA7UL1oKQdL40bmQ=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  propagatedBuildInputs = [
    python3.pkgs.mutagen
    python3.pkgs.beautifulsoup4
    python3.pkgs.aiohttp
  ];

  pythonImportsCheck = [ "soundcloud_lib" ];

  meta = with lib; {
    description = "Python Soundcloud API";
    homepage = "https://pypi.org/project/soundcloud-lib/";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "soundcloud-lib";
  };
}
