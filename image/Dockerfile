# 0.1.0 must be replaced with existing git tag.
# I added {{ }} so that docker build fails if it is not replaced.
FROM docker-registry.ai-traders.com/mono-ide:0.1.0

COPY etc_ide.d/scripts/* /etc/ide.d/scripts/
COPY etc_ide.d/variables/* /etc/ide.d/variables/

# (1 Oct 2016) apt-get install monodevelop gets latest monodevelop available
# as .deb package, 5.10.0.871-0xamarin2, thanks to apt repo added in mono-ide:
# http://download.mono-project.com/repo/debian/ wheezy/snapshots/4.6.1.3/main amd64 Packages
#
# then install F# language bindings
RUN apt-get update &&\
  DEBIAN_FRONTEND=noninteractive apt-get -y install monodevelop monodevelop-nunit \
  monodevelop-versioncontrol mono-xsp4 &&\
  mkdir /tmp/MonoDevelop.FSharpBinding.5.5.0 && cd /tmp/MonoDevelop.FSharpBinding.5.5.0 &&\
  wget http://addins.monodevelop.com/Stable/Linux/5.5/MonoDevelop.FSharpBinding-5.5.0.mpack &&\
  unzip MonoDevelop.FSharpBinding-5.5.0.mpack && cd /tmp &&\
  mv /tmp/MonoDevelop.FSharpBinding.5.5.0 /usr/lib/monodevelop/AddIns/

# enable code folding
# do not fold comments by default
# syntax highlighting - visual studio
# errors pad visible on unit testing layout

ENTRYPOINT ["/usr/bin/tini", "-g", "--", "/usr/bin/entrypoint.sh"]
CMD ["monodevelop"]
