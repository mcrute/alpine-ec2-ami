# vim: ts=8 noet:

ALL_SCRIPTS := $(wildcard scripts/*)
CORE_PROFILES := $(wildcard profiles/*/*)
TARGET_PROFILES := $(wildcard profiles/*.conf)
PROFILE :=
BUILD :=
BUILDS := $(BUILD)
LEVEL :=

# by default, use the 'packer' in the path
PACKER := packer
export PACKER

.PHONY: amis prune release-readme clean

amis: build build/packer.json build/profile/$(PROFILE) build/update-release.py
	build/make-amis $(PROFILE) $(BUILDS)

prune: build build/prune-amis.py
	build/prune-amis.py $(LEVEL) $(PROFILE) $(BUILD)

release-readme: build build/gen-release-readme.py
	build/gen-release-readme.py $(PROFILE)

build: $(SCRIPTS)
	[ -d build/profile ] || mkdir -p build/profile
	python3 -m venv build/.py3
	build/.py3/bin/pip install pyhocon pyyaml boto3
	(cd build; for i in $(ALL_SCRIPTS); do ln -sf ../$$i .; done)

build/packer.json: build packer.conf
	build/.py3/bin/pyhocon -i packer.conf -f json > build/packer.json

build/profile/$(PROFILE): build build/resolve-profile.py $(CORE_PROFILES) $(TARGET_PROFILES)
	build/resolve-profile.py $(PROFILE)

%.py: %.py.in build
	sed "s|@PYTHON@|#!`pwd`/build/.py3/bin/python|" $< > $@
	chmod +x $@

clean:
	rm -rf build
