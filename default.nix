{ nixpkgs, system, ... }:
let
  pkgs = import nixpkgs {
    system = system;
    config.allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
      "torch"
      "triton"
      "cudnn"
      "cuda_cudart"
      "cuda_cupti"
      "cuda_cccl"
      "cuda_nvcc"
      "cuda_nvrtc"
      "cuda_nvtx"
      "libcublas"
      "libcufft"
      "libcurand"
      "libcusolver"
      "libcusparse"
      "libnvjitlink"
    ];
  };
  pythonPackages = import ./pkgs/development/python-modules { inherit pkgs; };
  pythonEnv = pkgs.python3.buildEnv.override {
    extraLibs = (with pkgs.python3Packages; [ ipython ]) ++ builtins.attrValues pythonPackages;
    ignoreCollisions = true;
  };
in
pythonPackages // { default = pythonEnv; }
