# docker-mono-gide

An IDE docker image with C# CLI and graphical tools. Based on [mono-ide](http://gogs.ai-traders.com/stcdev/docker-mono-ide).

## Specification
All what's in [mono-ide](http://gogs.ai-traders.com/stcdev/docker-mono-ide) and:
 * MonoDevelop 5.10
 * monodevelop-nunit, monodevelop-versioncontrol, mono-xsp4
 * Visual Studio Code 1.12.2
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
1. Install [IDE](https://github.com/ai-traders/ide)
2. Provide an Idefile:
```
# mono-gide is tagged as: <THIS_IMAGE_VERSION>_<BASE_IMAGE_VERSION>
IDE_DOCKER_IMAGE="docker-registry.ai-traders.com/mono-gide:0.1.0_0.1.0"
# or just:
IDE_DOCKER_IMAGE="docker-registry.ai-traders.com/mono-gide:latest"
```
3. Run, example commands:
```bash
# to run monodevelop (your terminal must be interactive):
ide

# or this way:
ide /bin/bash
monodevelop &

# to run any mono command like in mono-ide, e.g.:
ide cd stc-vince && ./build.sh CopyBinaries
```

By default:
 * current directory in docker container is `/ide/work`.
 * default command is `monodevelop` and it starts in a new graphical window

### Configuration
Those files are used inside the ide docker image:

1. `~/.ssh/config` -- will be generated on docker container start
2. `~/.ssh/id_rsa` -- it must exist locally, because it is a secret
 (but the whole `~/.ssh` will be copied)
2. `~/.gitconfig` -- if exists locally, will be copied
3. `~/.profile` -- will be generated on docker container start, in
   order to ensure current directory is `/ide/work`.
4. `~/.config/MonoDevelop`, `~/.config/MonoDevelop-5.0`, `~/.config/Nuget`,
`~/.config/gtk-2.0`, `~/.config/stetic`, `~/.config/xbuild` -- if exist locally,
 will be copied. However, there is
 already the file `/home/ide/.config/MonoDevelop-5.0/MonoDevelopProperties.xml`
 burned into mono-gide.
5. `~/.local/share/MonoDevelop-5.0` -- if exists locally, will be copied. However, there are
already `/home/ide/.local/share/MonoDevelop-5.0/Policies/Default.mdpolicy.xml`
and `/home/ide/.local/share/MonoDevelop-5.0/Snippets/log.template.xml` burned into mono-gide.
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
      * `./tasks local_bump` to update local files (changelog) with next_version
      from OVersion OR
      * `./tasks bump 1.2.3` to bump to a particular version
        Version is bumped in Changelog and OVersion backend
    * push to master onto private git server
1. CI server (GoCD) builds, tests and releases.

### Release
This repo has conditional code release, because we build a docker image from this image:
 * if there are new commits in master branch
 * if new mono-ide docker image was published

In the latter case there are no new commits in this git repo and release was
already done before. Then, we only want to build and publish new docker image.
