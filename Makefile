PREFIX?=/usr/local

TEMPORARY_FOLDER=./tmp_portable_simulators
OSNAME=${shell uname -s}

build:
	swift build --disable-sandbox -c release -Xswiftc -static-stdlib

test:
	swift test

lint:
	swiftlint

clean:
	swift package clean

xcode:
	swift package generate-xcodeproj

install: build
	mkdir -p "$(PREFIX)/bin"
	cp -f ".build/release/Simulators" "$(PREFIX)/bin/simulators"

portable_zip: build
	mkdir -p "$(TEMPORARY_FOLDER)"
	cp -f ".build/release/Simulators" "$(TEMPORARY_FOLDER)/simulators"
	cp -f "LICENSE" "$(TEMPORARY_FOLDER)"
	(cd $(TEMPORARY_FOLDER); zip -r - LICENSE simulators) > "./portable_simulators.zip"
	rm -r "$(TEMPORARY_FOLDER)"
