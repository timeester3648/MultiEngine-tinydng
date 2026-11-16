void main(MultiBuild::Workspace& workspace) {	
	auto project = workspace.create_project(".");
	auto properties = project.properties();

	project.name("tinydng");
	properties.binary_object_kind(MultiBuild::BinaryObjectKind::eStaticLib);
	project.license("./miniz.LICENSE");
	properties.tags({ "use_header_only_mle", "utf8" });

	properties.project_includes({
		"stb",
		"fmt",
		"zlib",
		"Boost",
		"spdlog",
		"magic_enum",
		"Intrinsics"
	});

	project.include_own_required_includes(true);
	project.add_required_project_include({
		"."
	});

	properties.files({
		"./*.h",
		
		"./tinydng_api.c",
		"./tinydng_io.c",
		"./tinydng_tiff.c",
		"./tinydng_dng.c",
		"./tinydng_codec.c",
		"./tinydng_write.c",
		"./tinydng_psd.c",
		"./tinydng_psd_write.c",

		"./tinydng_miniz.c",
 		"./tinydng_stb_image.c",

		"./tiny_dng_ljpeg92_v2.c"
	});
	
	{
		MultiBuild::ScopedFilter _(project, "project.compiler:VisualCpp");
		properties.disable_warnings("4244");
		properties.defines("_CRT_SECURE_NO_WARNINGS");
	}
}