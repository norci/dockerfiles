ENV["JULIA_PKG_SERVER"] = "https://mirrors.bfsu.edu.cn/julia/static"

try
    using Revise
catch e
    @warn(e.msg)
end
