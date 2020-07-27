# JULIA_DEPOT_PATH is the root dir of julia's user files. (The default is $HOME/.julia)
# it must be set before launching julia. so set it in the system env.
# ENV["JULIA_DEPOT_PATH"] = "D:\\ProgramData\\JULIA_DEPOT_PATH\\"
###
ENV["JULIA_PKG_SERVER"] = "https://mirrors.bfsu.edu.cn/julia/static"
ENV["JULIA_NUM_THREADS"] =  Base.Sys.CPU_THREADS

if ENV["OS"]!="Windows_NT"
    ENV["JULIA_EDITOR"] = "emacsclient"
end

try
    using Revise

    if ENV["OS"]!="Windows_NT"
        using InteractiveCodeSearch
        InteractiveCodeSearch.CONFIG.interactive_matcher = `percol`
    end
catch e
    @warn(e.msg)
end
