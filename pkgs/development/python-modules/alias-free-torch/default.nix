{ lib
, python3
, fetchPypi
}:

python3.pkgs.buildPythonApplication rec {
  pname = "alias-free-torch";
  version = "0.0.5";
  pyproject = true;

  src = fetchPypi {
    pname = "alias_free_torch";
    inherit version;
    hash = "sha256-e6CZ5weKq8TT03FpL4J9rmZ8Bzrui/Cx2LgwP33TZdM=";
  };

  nativeBuildInputs = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  pythonImportsCheck = [ "alias_free_torch" ];

  meta = with lib; {
    description = "Alias free torch";
    homepage = "https://pypi.org/project/alias-free-torch/";
    license = licenses.asl20;
    maintainers = with maintainers; [ ];
    mainProgram = "alias-free-torch";
  };
}
