{ pkgs }: {
  deps = [
    pkgs.strace
    pkgs.python38Full
  	pkgs.cudatoolkit
  	pkgs.cudaPackages.cuda_cudart
  	pkgs.cudaPackages.libcublas
  	pkgs.cudaPackages.libcufft
  	pkgs.cudaPackages.libcurand
  	pkgs.cudaPackages.libcusolver
  	pkgs.cudaPackages.libcusparse
  	pkgs.cudaPackages.cudnn
  ];
  env = {
    PYTHON_LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
      # Needed for pandas / numpy
      pkgs.stdenv.cc.cc.lib
      pkgs.zlib
      # Needed for pygame
      pkgs.glib
      # Needed for matplotlib
      pkgs.xorg.libX11
      pkgs.cudatoolkit
      pkgs.cudaPackages.cuda_cudart
      pkgs.cudaPackages.cudnn
      pkgs.cudaPackages.libcublas
      pkgs.cudaPackages.libcufft
      pkgs.cudaPackages.libcurand
      pkgs.cudaPackages.libcusolver
      pkgs.cudaPackages.libcusparse
    ];
    PYTHONBIN = "${pkgs.python38Full}/bin/python3.8";
    LANG = "en_US.UTF-8";
  };
}