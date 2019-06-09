# docker-dotnet-gdojo

A [Dojo](https://github.com/ai-traders/dojo) docker image with graphical tools for dotnet development.
Based on [docker-dotnet-dojo](https://github.com/kudulab/docker-dotnet-dojo) image.

## Specification
All what's in [docker-dotnet-dojo](https://github.com/kudulab/docker-dotnet-dojo) and:
 * Visual Studio Code 1.27.2
 * Visual Studio Code extensions: Ionide.Ionide-FAKE, Ionide.Ionide-fsharp,
 Ionide.Ionide-Paket, ms-vscode.csharp (omnisharp-vscode)

## Usage
1. Install [Dojo](https://github.com/ai-traders/dojo)
2. Provide an Dojofile:

```
# this image is tagged as: <THIS_IMAGE_VERSION>_<BASE_IMAGE_VERSION>
DOJO_DOCKER_IMAGE="kudulab/dotnet-gdojo:3.0.0_3.1.0"
```

3. Run, example commands:

```bash
dojo
monodevelop &
code &

# to run any mono command like in the base image, e.g.:
dojo "cd stc-vince && ./build.sh CopyBinaries"
```

By default current directory in docker container is `/dojo/work`.

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
 and `~/.local/share/MonoDevelop-5.0` and then to copy them from the dotnet-gdojo into
 your home. When using dotnet-gdojo for the 2nd time, those dirs will be copied from
 your home.


## Development
### Dependencies
* Bash
* Docker daemon
* Bats
* Dojo

### Tests
No tests are repeated from the base image, because we expect them to be passed if
the base image was published.

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
      * `./tasks set_version 1.2.3` to update version in changelog
    * push to master onto private git server
1. CI server (GoCD) builds, tests and releases.

### Release
This repo has conditional code release, because we build a docker image from this image:
 * if there are new commits in master branch
 * if new base docker image was published

In the latter case there are no new commits in this git repo and release was
already done before. Then, we only want to build and publish new docker image.
