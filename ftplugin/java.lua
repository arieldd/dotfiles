local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
-- local workspace_dir = "~/ws/bb/ignite/portingplatforms/android/ignition-android/" .. project_name

local bundles = {
	vim.fn.glob(
		"/home/arieldd/android/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
		1
	),
}
vim.list_extend(bundles, vim.split(vim.fn.glob("/home/arieldd/android/vscode-java-test/server/*.jar", 1), "\n"))

local config = {
	cmd = {
		"java", -- or '/path/to/java17_or_newer/bin/java'
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		"/home/linuxbrew/.linuxbrew/Cellar/jdtls/1.43.0/libexec/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar",
		"-configuration",
		"/home/linuxbrew/.linuxbrew/Cellar/jdtls/1.43.0/libexec/config_linux",
		"-data",
		project_name,
	},

	root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),

	settings = {
		java = {},
	},

	init_options = {
		bundles = bundles,
	},
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require("jdtls").start_or_attach(config)
