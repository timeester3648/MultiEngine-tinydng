include "../../premake/common_premake_defines.lua"

project "tinydng"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
	cdialect "C17"
	targetname "%{prj.name}"
	inlining "Auto"

	files {
		"./tiny_dng_loader.h",
		"./tiny_dng_writer.h",
		"./*.cpp"
	}

	includedirs {		
		"%{IncludeDir.mle}",
		"%{IncludeDir.stb}",
		"%{IncludeDir.fmt}",
		"%{IncludeDir.zlib}",
		"%{IncludeDir.boost}",
		"%{IncludeDir.spdlog}",
		"%{IncludeDir.magic_enum}",
		"%{IncludeDir.intrinsics}",
		"%{IncludeDir.general_includes}"
	}

	defines {
		"MLE_DEPENDENCY_HEADER_ONLY"
	}

	filter "toolset:msc"
		disablewarnings { "4244" }