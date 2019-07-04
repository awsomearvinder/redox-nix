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
nix-shell

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

## Components

As a part of the goal to slowly move the main build system to GNU
make, we have started nix-ifying some repositories in the
`components/` directory.

 - [redoxfs](https://gitlab.redox-os.org/redox-os/redoxfs/) can be compiled by executing `nix-build components -A redoxfs`
 - [redoxer](https://gitlab.redox-os.org/redox-os/redoxer/) can be compiled by executing `nix-build components -A redoxer`
 - `binary-gcc-install`, `binary-rust-install`, and
   `binary-relibc-install` download and patch some toolchains from
   [static.redox-os.org](https://static.redox-os.org/toolchain/x86_64-unknown-redox/). May
   run out of memory.

Every other component, for now, is available as normal in the `redox/`
submodule.

## Overrides

You can override the source of most components using
`my-overrides.nix` in the root of the repository, like this:

```nix
{
  redoxer = ./redoxer;
  redoxfs = ./redoxfs;
}
```

the sources are automatically stripped from binary files and other
data that shouldn't be copied around endlessly to the nix store.

To temporarily ignore overrides, you can pass `--arg ignoreOverrides
true` to the command, such as
```bash
nix-build components -A redoxer --arg ignoreOverrides true
```

---

## redoxer

An amazing tool for testing programs on redox is `redoxer`. However,
it currently has a few runtime dependencies that can be easy to miss
or have broken versions of. Nix eliminates this problem:

```bash
nix run -f ./components redoxer

# Only needed first install:
redoxer install
rm -rf ~/.redoxer/toolchain
nix-build components -A binary-rust-install -o ~/.redoxer/toolchain
```

It's sadly still not really one-click, but it's close enough for a
one-time setup.
