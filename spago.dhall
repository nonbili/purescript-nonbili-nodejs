{ name =
	"nonbili-nodejs"
, dependencies =
	[ "aff", "aff-promise", "effect", "console", "psci-support" ]
, packages =
	./packages.dhall
, sources =
	[ "src/**/*.purs", "test/**/*.purs" ]
}