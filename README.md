# redox-nix

A work-in-progress "guaranteed" way to build Redox without errors for
people with the the [nix](https://nixos.org/nix/) package manager
installed on their system.

## What's nix?

Nix is a package manager that focuses on being reliable and
reproducible. It supports rollbacks and installing multiple versions
of packages. In some ways it is an alternative to docker, but is more
lightweight on your system as it does not require building a whole
filesystem for each application...

## Roadmap

`redox-nix` was created in order to be able to build Redox on NixOS
without needing to constantly send and upstream patches to the Redox
repositories. The short term idea was to gather all patches in one
place. The long term idea is to replace the GNU make build system and
only use nix to build each separate component that makes up redox.

# Usage

If you don't have [direnv](https://direnv.net/) installed (highly
recommended though)

```sh
# Clone the repository
git clone --recurse-submodules https://gitlab.redox-os.org/redox-os/redox-nix

# Enter a nix development shell with all the necessary packages and patches.
cd redox-nix
./shell.sh

# Happy hacking on Redox!
cd redox
```

If you **do** have direnv installed:

```sh
# Clone the repository
git clone --recurse-submodules https://gitlab.redox-os.org/redox-os/redox-nix

# Happy hacking on Redox!
cd redox-nix/redox
direnv allow # only needed first time
```
