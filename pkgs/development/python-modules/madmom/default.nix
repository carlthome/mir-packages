{ lib
, python3
, fetchFromGitHub
, ffmpeg
}:

python3.pkgs.buildPythonPackage rec {
  pname = "madmom";
  version = "0.16.1.dev0";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "CPJKU";
    repo = "madmom";
    rev = "0551aa8f48d71a367d92b5d3a347a0cf7cd97cc9";
    hash = "sha256-ELmv6w4UWtbpMoSnji+HcBptky+zEylpBLMsLaDt/fw=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = with python3.pkgs; [
    wheel
    cython
  ];

  propagatedBuildInputs = with python3.pkgs; [
    ffmpeg
    mido
    numpy
    scipy
    # TODO Add pyfftw for improved FFT performance.
    #pyfftw
    # TODO Add pyaudio for real-time audio I/O.
    #pyaudio
  ];

  # Remove source files so pytest only uses the built package.
  preCheck = ''
    rm -r madmom
  '';

  nativeCheckInputs = with python3.pkgs; [
    ffmpeg
    pytest-runner
    pytestCheckHook
  ];

  pythonImportsCheck = [ "madmom" ];

  disabledTests = [
    # TODO Resolve numerical failures on aarch64-darwin.
    "TestCLPChromaClass"
    "TestResampleFunction"
    # TODO https://github.com/CPJKU/madmom/pull/531
    "TestTCNBeatTrackerProgram"
    "TestTCNTempoDetectorProgram"
    "TestTCNBeatProcessorClass"
  ];

  meta = with lib; {
    description = "Python audio and music signal processing library";
    homepage = "https://github.com/CPJKU/madmom";
    changelog = "https://github.com/CPJKU/madmom/blob/${src.rev}/CHANGES.rst";
    license = with licenses; [ bsd3 ];
    maintainers = with maintainers; [ carlthome ];
  };
}
