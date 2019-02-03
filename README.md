# docker-mono-gide

A Dojo docker image with C# CLI and graphical tools. Based on [mono-ide](http://gogs.ai-traders.com/stcdev/docker-mono-ide).

## Specification
All what's in [mono-ide](http://gogs.ai-traders.com/stcdev/docker-mono-ide) and:
 * MonoDevelop 7.5
 * monodevelop-nunit, monodevelop-versioncontrol, mono-xsp4
 * Visual Studio Code 1.27.2
 * Visual Studio Code extensions: Ionide.Ionide-FAKE, Ionide.Ionide-fsharp,
 Ionide.Ionide-Paket, ms-vscode.csharp (omnisharp-vscode)

with:
 * F# language support
 * custom snippet (template) to create log4net object
 * custom properties:
   * enable code folding
   * do not fold comments by default
   * syntax highlighting - visual studio
   * set SourceAnalysis -> Enable text editor unit test integration

## Usage
1. Install [Dojo](https://github.com/ai-traders/dojo)
2. Provide an Dojofile:

```
# mono-gide is tagged as: <THIS_IMAGE_VERSION>_<BASE_IMAGE_VERSION>
DOJO_DOCKER_IMAGE="docker-registry.ai-traders.com/mono-gide:1.0.0_2.0.1"
# or just:
DOJO_DOCKER_IMAGE="docker-registry.ai-traders.com/mono-gide:latest"
```

3. Run, example commands:

```bash
# to run monodevelop (your terminal must be interactive):
dojo

# or this way:
dojo /bin/bash
monodevelop &

# to run any mono command like in mono-ide, e.g.:
dojo "cd stc-vince && ./build.sh CopyBinaries"
```

By default:
 * current directory in docker container is `/dojo/work`.
 * default command is `monodevelop` and it starts in a new graphical window

### Configuration
Those files are used inside the dojo docker image:

1. `~/.ssh/config` -- will be generated on docker container start
2. `~/.ssh/id_rsa` -- it must exist locally, because it is a secret
 (but the whole `~/.ssh` will be copied)
2. `~/.gitconfig` -- if exists locally, will be copied
3. `~/.profile` -- will be generated on docker container start, in
   order to ensure current directory is `/dojo/work`.
5. `~/.local/share/recently-used.xbel` -- if exists locally, will be copied.
6. `~/.mono` -- if exists locally, will be copied.

It is recommended to start this image first with empty `~/.config/MonoDevelop-5.0`
 and `~/.local/share/MonoDevelop-5.0` and then to copy them from mono-gide into
 your home. When using mono-gide for the 2nd time, those dirs will be copied from
 your home.


## Development
### Dependencies
* Bash
* Docker daemon
* Bats
* Ide

### Tests
No tests are repeated from mono-ide, because we expect them to be passed if
mono-ide image was published.

### Lifecycle
1. In a feature branch:
    * you make changes
    * you build docker image: `./tasks build`
    * and test it:
      * `./tasks itest`
      * `./tasks itest_i` -- interactively test that xfce4 desktop starts,
      stop with ctrl+c
1. You decide that your changes are ready and you:
    * merge into master branch
    * run locally:
      * `./tasks prepare_code_release` to update local files (changelog) with next_version
      from OVersion OR
      * `./tasks set_version 1.2.3` to set version to a particular version
        Version is set in Changelog and OVersion backend
    * push to master onto private git server
1. CI server (GoCD) builds, tests and releases.

### Release
This repo has conditional code release, because we build a docker image from this image:
 * if there are new commits in master branch
 * if new mono-ide docker image was published

In the latter case there are no new commits in this git repo and release was
already done before. Then, we only want to build and publish new docker image.
