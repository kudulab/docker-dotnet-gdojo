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
