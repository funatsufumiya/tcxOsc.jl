module tcxOsc
  using CxxWrap
  using tcxOsc_prebuilt_jll

  function get_tmp_lib()
    # WORKAROUND to avoid error on dll loading
    tmp_dir = normpath(joinpath(@__DIR__, "..", "tmp"))
    # rm(tmp_dir, force=true, recursive=true)
    if !isdir(tmp_dir)
      mkdir(tmp_dir)
    end
    lib_path = tcxOsc_prebuilt_jll.get_lib_path()
    lib_name = basename(lib_path)
    cp(lib_path, normpath(joinpath(tmp_dir, lib_name)), force=true);
    return normpath(joinpath(tmp_dir, lib_name))
  end

  # @wrapmodule(() -> tcxOsc_prebuilt_jll.get_lib_path())
  @wrapmodule(() -> get_tmp_lib())

  function __init__()
    @initcxx
  end

  # export Osc

end # module tcxOsc
