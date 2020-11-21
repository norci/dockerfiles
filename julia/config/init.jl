import Pkg
Pkg.update();
Pkg.add.([
    "Conda"
    "Debugger"
    "JuliaFormatter"
    "PkgTemplates"
    "Revise"
]);
Pkg.precompile();
