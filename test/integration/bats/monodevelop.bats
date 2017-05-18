load '/opt/bats-support/load.bash'
load '/opt/bats-assert/load.bash'

@test "monodevelop is invocable" {
  run /bin/bash -c "DISPLAY=\"\" ide --not_i --idefile Idefile.to_be_tested \"monodevelop --help\""
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
