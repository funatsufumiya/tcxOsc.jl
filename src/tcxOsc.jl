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

  Base.show(io::IO, v::tcxOsc.OscMessage) = print(io, "OscMessage(",tcxOsc.toString(v),")")

  export OscMessage,
    setAddress,
    getAddress,
    addInt,
    addFloat,
    addString,
    addBlob,
    addBool,
    getArgCount,
    getTypeTags,
    getArgAsInt,
    getArgAsFloat,
    getArgAsString,
    getArgAsBlob,
    getArgAsBool,
    toBytes,
    toString,
    clear,

    OscBundle,
    setTimetag,
    getTimetag,
    addMessage,
    addBundle,
    getElementCount,
    isBundle,
    isMessage,
    getMessageAt,
    getBundleAt,
    toBytes

end # module tcxOsc
