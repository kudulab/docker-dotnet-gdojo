load '/opt/bats-support/load.bash'
load '/opt/bats-assert/load.bash'

@test "monodevelop is invocable" {
  run /bin/bash -c "DISPLAY=\"\" ide --not_i --idefile Idefile.to_be_tested \"monodevelop --help\""
  # this is printed on test failure
  echo "output: $output"
  assert_line --partial "MonoDevelop 7.5"
  assert_equal "$status" 0
}
