require_relative './spec_helper'
require 'English'
require 'open3'

context 'operations' do

  before :all do
    generate_idefiles()
  end

  after :all do
    rm_idefiles()
  end

  context 'when full identity' do
    it 'is correctly initialized; pwd shows /ide/work' do
      cmd = "cd #{test_ide_work} && ide \"pwd && whoami\""

      output, exit_status = run_cmd(cmd)

      expect(output).to include('ide init finished')
      expect(output).to include('/ide/work')
      expect(output).to include('ide')
      expect(output).to include('using mono-gide')
      expect(output).not_to include('root')
      expect(exit_status).to eq 0
    end
    it 'monodevelop is invocable' do
      cmd = "cd #{test_ide_work} && DISPLAY="" ide --not_i \"monodevelop --help\""

      output, exit_status = run_cmd(cmd)

      expect(output).to include('MonoDevelop 5.10')
      expect(exit_status).to eq 0
    end
    it 'monodevelop-nunit is installed' do
      cmd = "cd #{test_ide_work} && ide \"dpkg -s monodevelop-nunit\""

      output, exit_status = run_cmd(cmd)

      expect(exit_status).to eq 0
    end
    it 'monodevelop-versioncontrol is installed' do
      cmd = "cd #{test_ide_work} && ide \"dpkg -s monodevelop-versioncontrol\""

      output, exit_status = run_cmd(cmd)

      expect(exit_status).to eq 0
    end
    it 'mono-xsp4 is installed' do
      cmd = "cd #{test_ide_work} && ide \"dpkg -s mono-xsp4\""

      output, exit_status = run_cmd(cmd)

      expect(exit_status).to eq 0
    end
    it 'custom monodevelop config exists' do
      cmd = "cd #{test_ide_work} && ide \"cat /home/ide/.config/MonoDevelop-5.0/MonoDevelopProperties.xml\""

      output, exit_status = run_cmd(cmd)
      expect(output).to include('key="Testing.EnableUnitTestEditorIntegration" value="True"')
      expect(output).to include('key="DefaultCommentFolding" value="False"')

      expect(exit_status).to eq 0
    end
  end
end
