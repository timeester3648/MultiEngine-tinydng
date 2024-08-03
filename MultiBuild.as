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
		"./tiny_dng_loader.h",
		"./tiny_dng_writer.h",
		"./*.cpp"
	});
	
	{
		MultiBuild::ScopedFilter _(project, "project.compiler:VisualCpp");
		properties.disable_warnings("4244");
	}
}