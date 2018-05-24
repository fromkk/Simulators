# Simulators

![simulators](./simulators.png)

build and launch multi iOS simulators

## Install

```bash
git clone https://github.com/fromkk/Simulators.git
cd ./Simulators
make install
```

## Usage

```bash
simulators [--project <project>] | [--workspace <workspace>] --scheme <scheme> --bundleIdentifier <bundleIdentifier> --beforeClean <beforeClean> --devices <devices> --osVersion <osVersion>
```

## Options

Key | Description
-----|--------------
project | set XXX.xcodeproj path
workspace | set XXX.xcworkspace path
scheme | set build scheme
bundleIdentifier | set bundleIdentifier
beforeClean | set if clean before build [true,false]
devices | set devices [iPhone SE,iPhone 7,iPhone 7 Plus,iPhone X,etc...]
osVersion |  set OS versions [10.3,11.3,etc...]
