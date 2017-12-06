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
  refute_output "root"
  assert_equal "$status" 0
}
