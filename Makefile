.PHONY: verify selftest test install package release

verify:
	./verify.sh

selftest:
	./selftest.sh

test: selftest

install:
	./install.sh

package:
	./scripts/package.sh

release: package
	@echo "Release zip built in dist/. Push a v* tag to trigger .github/workflows/release.yml"
