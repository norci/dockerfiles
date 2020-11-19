import Pkg
Pkg.update();
Pkg.add.([
    "Debugger"
    "JuliaFormatter"
    "PkgTemplates"
    "Revise"
]);
Pkg.precompile();
