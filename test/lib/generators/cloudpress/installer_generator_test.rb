require 'test_helper'
require 'generators/installer/installer_generator'

module Cloudpress
  class InstallerGeneratorTest < Rails::Generators::TestCase
    tests InstallerGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    # test "generator runs without errors" do
    #   assert_nothing_raised do
    #     run_generator ["arguments"]
    #   end
    # end
  end
end
