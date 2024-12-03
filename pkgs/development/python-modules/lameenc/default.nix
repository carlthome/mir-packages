{ lib
, python3
, fetchFromGitHub
, fetchurl
, lame
, cmake
, stdenv
}:

python3.pkgs.buildPythonPackage rec {
  pname = "lameenc";
  version = "1.7.0";
  format = "other";

  srcs = [
    (fetchFromGitHub {
      owner = "chrisstaite";
      repo = "lameenc";
      rev = "v${version}";
      name = pname;
      hash = "sha256-anZEJNr9eZP94fTkrzXoC8uxVoItaGgVj4jQZinQtoo=";
    })
    (fetchurl {
      url = "https://sourceforge.net/projects/lame/files/lame/3.100/lame-3.100.tar.gz/download";
      hash = "sha256-3f42yrhzeUA4riwSEFV600hXpLa9xRV4XR2p4XWx2h4=";
      name = "lame-3.100.tar.gz";
    })
  ];

  sourceRoot = pname;

  patches = [ ./no-download.patch ];

  nativeBuildInputs = with python3.pkgs; [
    setuptools
    wheel
    cmake
    pipInstallHook
  ];

  propagatedBuildInputs = [ lame ];

  cmakeFlags = [
    "-DCMAKE_OSX_ARCHITECTURES=${stdenv.hostPlatform.darwinArch}"
  ];

  installPhase = ''
    mkdir -p dist
    cp *.whl dist
    pipInstallPhase
  '';

  pythonImportsCheck = [ "lameenc" ];

  meta = with lib; {
    description = "Python bindings around the LAME encoder";
    homepage = "https://github.com/chrisstaite/lameenc";
    license = with licenses; [ lgpl3 ];
    maintainers = with maintainers; [ carlthome ];
  };
}
