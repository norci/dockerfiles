ENV["JULIA_PKG_SERVER"] = "https://mirrors.bfsu.edu.cn/julia/static"

try
    using Revise
    using InteractiveCodeSearch
catch e
    @warn(e.msg)
end
