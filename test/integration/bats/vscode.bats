load '/opt/bats-support/load.bash'
load '/opt/bats-assert/load.bash'

@test "vscode is invocable" {
  run /bin/bash -c "DISPLAY=\"\" dojo -i=false -c Dojofile.to_be_tested \"code --version\""
  # this is printed on test failure
  echo "output: $output"
  assert_line --partial "1.27.2"
  assert_equal "$status" 0
}
@test "vscode extensions are installed" {
  run /bin/bash -c "DISPLAY=\"\" dojo -i=false -c Dojofile.to_be_tested \"code --list-extensions\""
  # this is printed on test failure
  echo "output: $output"
  assert_line --partial "Ionide.Ionide-FAKE"
  assert_line --partial "Ionide.Ionide-fsharp"
  assert_line --partial "Ionide.Ionide-Paket"
  assert_line --partial "k--kato.docomment"
  assert_line --partial "ms-vscode.csharp"
  assert_line --partial "PeterJausovec.vscode-docker"
  assert_equal "$status" 0
}
