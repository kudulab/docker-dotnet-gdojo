### 3.2.1 (2019-Oct-30)

* new vault token

### 3.2.0 (2019-Oct-04)

* install new vscode version 1.38.1
* install new vscode plugin version: OmniSharp 1.21.4
* install new vscode plugin version: ionide 4.1.0
* install new vscode plugin version: vscode-docomment 0.1.8
* install new vscode plugin version: vscode-docker 0.8.1
* split installing vscode plugins into many docker image layers

### 3.1.0 (2019-Jun-09)
* removed monodevelop
* updated build system

### 3.0.1 (2019-May-01)

* remove debug statements
* fix docker image tag

### 3.0.0 (2019-Apr-29)

* rename to docker-dotnet-gdojo

### 2.1.0 (2019-Apr-29)

* change base image to kudulab/dotnet-dojo
* use newer vscode-docker 0.6.1
* download more tools from the Internet instead of from private servers

### 2.0.1 (2019-Apr-28)

* use newer ops scripts, do not use oversion

### 2.0.0 (2019-Feb-03)

* transform from ide docker image to dojo docker image #17139

### 1.1.2 (2018-Dec-02)

fix repo key setup

### 1.1.1 (2018-Nov-28)

Improvements to make vscode faster on large project \#12074

### 1.1.0 (2018-Nov-26)

ionide, use .net core runtime for F\# compiler service

### 1.0.0 (2018-Sep-27)

Updated base image to debian stretch.
Updated tools:
 * vscode 1.27.2
 * omnisharp-vscode 1.61.1
 * vscode paket 1.12.0

### 0.5.0 (2018-May-05)

updated
 * vscode 1.23.0
 * omnisharp-vscode 1.15.0-beta6
 * ionide-fsharp 3.19.4
 * vscode paket 1.9.1
 * monodevelop 7.4

Installing vscode-omnisharp from package with bundled omnisharp and Core debugger.

### 0.4.1 (2017-Dec-06)

 * do not copy nuget config and alike from users home, base image has correct config

### 0.4.0 (2017-Oct-14)

* updated vscode - 1.17.1
* updated vscode-fsharp - 3.5.1
* updated omnisharp-vscode - 1.13.0-beta3

### 0.3.5 (2017-Aug-19)

* update vscode extensions:
  * omnisharp-vscode 1.12.1
  * vscode-fsharp 2.33.2
  * vscode-packet 1.7.3
  * vscode-docomment 0.0.17
* add new vscode extensions:
  * csharpextensions 1.3.0 (from a specified commit, not git tag,
    http://gogs.ai-traders.com/stcdev/vsix-csharpextensions)
  * vscode-docker 0.0.16 (from a specified commit, not git tag,
    http://gogs.ai-traders.com/stcdev/vsix-vscode-docker)

### 0.3.4 (2017-Aug-18)

* fix: monodevelop 5.10 is not found in apt source:
`deb http://download.mono-project.com/repo/debian jessie/snapshots/5.2.0.215 main`
 so let's add debian stretch apt source #11176
* fix: "libXtst.so.6: cannot open shared object file: No such file or directory"
 when installing visual studio code extensions

### 0.3.3 (2017-Aug-17)

* libgcrypt11_1.5.0-5+deb7u6_amd64.deb does not exist any more on
 http://security.debian.org/, but libgcrypt11_1.5.0-5+deb7u6_amd64.deb does
* do not use tini

### 0.3.1 (2017-Jun-28)

 * downgrade vscode to `1.17.1`, buggy intellisense in `1.13.0`

### 0.3.0 (2017-Jun-27)

 * added `xdot`
 * updated plugins
 * added new C# plugin - for XML docs

### 0.2.3 (2017-Jun-19)

switch to elastic agents

### 0.2.2 (2017-May-22)

* fix release cycle, do check version when already tagged
* fix task names to indicate what they actually do

### 0.2.1 (2017-May-19)

* \#11120 fix publish task to tag docker image as "${this_img_version}_${base_img_version}"

### 0.2.0 (2017-May-18)

* \#11100 install visual studio and extensions
* CMD is now `/bin/bash`
* dev: no ruby, but releaser (bash)

### 0.1.1 (8 Oct 2016)

* #100200 fix copying from `/ide/identity/.local` and do not copy the whole:
 `/ide/identity/.local/share` or `/ide/identity/.config`

### 0.1.0 (1 Oct 2016)

Initial release of docker-mono-gide
