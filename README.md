## Deno Nightly

🌙 Nightly builds for Deno 🦕

**HERE BE DRAGONS**

It goes without saying but, **DO NOT** use these binaries in any production environments. They may have dangerous bugs and/or vulnerabilities.

## Builds

You can find all the builds on the [releases](https://github.com/maximousblk/deno_nightly/releases) page. All builds are tagged by the date they were built. Date format is `YYYY.MM.DD`. There is also a release named `latest` which is updated everyday with the latest build.

## Install

One-line commands to install Deno Nightly builds on your system.

#### Latest Build

**With Bash:**

```sh
curl -fsSL https://deno.land/x/nightly/install.sh | sh
```

**With PowerShell:**

```ps1
iwr https://deno.land/x/nightly/install.ps1 -useb | iex
```

#### Specific Build

**With Bash:**

```sh
curl -fsSL https://deno.land/x/nightly/install.sh | sh -s 2020.06.27
```

**With PowerShell:**

```ps1
$v="2020.06.27"; iwr https://deno.land/x/nightly/install.ps1 -useb | iex
```

### Environment Variables

##### DENO_INSTALL

The directory in which to install Deno. This defaults to `$HOME/.deno`. The executable is placed in `$DENO_INSTALL/bin`

One application of this is a system-wide installation:

**With Bash:**

```sh
curl -fsSL https://deno.land/x/nightly/install.sh | sudo DENO_INSTALL=/usr/local sh
```

**With PowerShell:**

```ps1
# Run as administrator:
$env:DENO_INSTALL = "C:\Program Files\deno"
iwr https://deno.land/x/nightly/install.ps1 -useb | iex
```

## Compatibility

- The Bash installer can be used on Windows via the [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/about).

## Known Issues

#### Unzip is required

The program [`unzip`](https://linux.die.net/man/1/unzip) is a requirement for the Bash installer.

```sh
$ curl -fsSL https://deno.land/x/nightly/install.sh | sh
Error: unzip is required to install Deno (see: 'https://deno.land/x/nightly#unzip-is-required').
```

**When does this issue occur?**

During the installation process, `unzip` is used to extract the zip archive.

**How can this issue be fixed?**

You can install unzip via `brew install unzip` on MacOS or `apt-get install unzip -y` on Linux.
