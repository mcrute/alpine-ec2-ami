ALL_SCRIPTS := $(wildcard scripts/*)
CORE_PROFILES := $(wildcard profiles/*/*)
TARGET_PROFILES := $(wildcard profiles/*.conf)
PROFILE := default
BUILD :=

# by default, use the 'packer' in the path
PACKER := packer
export PACKER

.PHONY: amis clean

amis: build build/packer.json build/profile/$(PROFILE)
	build/make-amis $(PROFILE) $(BUILD)

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
	rm -rf build scrub-old-amis.py gen-readme.py
