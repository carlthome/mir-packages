{ lib
, python3
, fetchPypi
, opencl-headers
, ninja
, lapack
, openblas
, openjpeg
}:

python3.pkgs.buildPythonApplication rec {
  pname = "opencv-contrib-python";
  version = "4.9.0.80";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-/xwAsG4sP0rUfeZPqcUn1n98b86T9RO2QWPUG+p8QbI=";
  };

  nativeBuildInputs = [
    python3.pkgs.cmake
    python3.pkgs.numpy
    python3.pkgs.pip
    python3.pkgs.scikit-build
    python3.pkgs.setuptools
    python3.pkgs.wheel

    #python3.pkgs.opencv4
    #opencl-headers
    #ninja
    #lapack
    #openblas
    #openjpeg
  ];

  dontUseCmakeConfigure = true;

  #ENABLE_CONTRIB = 1;
  #CMAKE_ARGS = "-DCMAKE_VERBOSE_MAKEFILE=ON";
  #VERBOSE = 1;

  # Take latest packages by default.
  postPatch = ''
    substituteInPlace pyproject.toml --replace-fail "==" ">="
  '';

  propagatedBuildInputs = with python3.pkgs; [
    numpy
  ];

  pythonImportsCheck = [ "opencv_contrib_python" ];

  meta = with lib; {
    description = "Wrapper package for OpenCV python bindings";
    homepage = "https://pypi.org/project/opencv-contrib-python/";
    license = with licenses; [ asl20 mit ];
    maintainers = with maintainers; [ carlthome ];
    mainProgram = "opencv-contrib-python";
  };
}
