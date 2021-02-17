# The envs below must be set in system env
# JULIA_NUM_THREADS
# JULIA_DEPOT_PATH

ENV["JULIA_PKG_SERVER"] = "https://mirrors.sjtug.sjtu.edu.cn/julia"

@static if Sys.iswindows()
    ENV["CONDA_JL_HOME"] = ∘(abspath, joinpath)(homedir(), raw"miniconda3\envs\jl")
end

@static if haskey(ENV, "CUDNN_VERSION")
    ENV["JULIA_CUDA_USE_BINARYBUILDER"] = false
end

for m in (:Revise, :Debugger)
    try
        eval(:(using $(m)))
    catch e
        dump(e)
    end
end
