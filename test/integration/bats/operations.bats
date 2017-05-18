load '/opt/bats-support/load.bash'
load '/opt/bats-assert/load.bash'

@test "/usr/bin/entrypoint.sh returns 0" {
  run /bin/bash -c "ide --idefile Idefile.to_be_tested \"pwd && whoami\""
  # this is printed on test failure
  echo "output: $output"
  assert_line --partial "ide init finished"
  assert_line --partial "/ide/work"
  assert_line --partial "using mono-gide"
  assert_line --partial "Copying /ide/identity/.local/share/MonoDevelop-5.0"
  assert_line --partial "Copying /ide/identity/.config/MonoDevelop-5.0"
  assert_line --partial "Copying /ide/identity/.config/stetic"
  assert_line --partial "Copying /ide/identity/.mono"
  assert_line --partial "/ide/identity/.config/xbuild does not exist, won't copy"
  refute_output "root"
  assert_equal "$status" 0
}
@test "monodevelop is invocable" {
  run /bin/bash -c "DISPLAY="" ide --not_i --idefile Idefile.to_be_tested \"monodevelop --help\""
  # this is printed on test failure
  echo "output: $output"
  assert_line --partial "MonoDevelop 5.10"
  assert_equal "$status" 0
}
@test "monodevelop-nunit is installed" {
  run /bin/bash -c "ide --idefile Idefile.to_be_tested \"dpkg -s monodevelop-nunit\""
  # this is printed on test failure
  echo "output: $output"
  assert_equal "$status" 0
}
@test "monodevelop-versioncontrol is installed" {
  run /bin/bash -c "ide --idefile Idefile.to_be_tested \"dpkg -s monodevelop-versioncontrol\""
  # this is printed on test failure
  echo "output: $output"
  assert_equal "$status" 0
}
@test "mono-xsp4 is installed" {
  run /bin/bash -c "ide --idefile Idefile.to_be_tested \"dpkg -s mono-xsp4\""
  # this is printed on test failure
  echo "output: $output"
  assert_equal "$status" 0
}
@test "custom monodevelop configs exist" {
  run /bin/bash -c "ide --idefile Idefile.to_be_tested \"cat /home/ide/.config/MonoDevelop-5.0/MonoDevelopProperties.xml && cat /home/ide/.local/share/MonoDevelop-5.0/Policies/Default.mdpolicy.xml && cat /home/ide/.local/share/MonoDevelop-5.0/Snippets/log.template.xml\""
  # this is printed on test failure
  echo "output: $output"
  assert_line --partial "key=\"Testing.EnableUnitTestEditorIntegration\" value=\"True\""
  assert_line --partial "key=\"DefaultCommentFolding\" value=\"False\""
  assert_line --partial "<DirectoryNamespaceAssociation>Hierarchical</DirectoryNamespaceAssociation>"
  assert_line --partial "static readonly log4net"
  assert_equal "$status" 0
}
