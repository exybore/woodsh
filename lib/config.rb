require 'yaml'

module Woodsh
  # The app's configuration object
  class Config
    # @return [Hash<String>] Theme of the shell
    attr_reader :theme

    # @return [Array] Custom commands for the user
    attr_reader :custom_commands

    # Initialize the config
    #
    # @param config_path [String] path to the config
    def initialize(config_path)
      files = ['custom_commands', 'theme']
      for file in files
        data = File.open("#{config_path}/#{file}.yml").read
        parsed_data = ::YAML.load(data)
        instance_variable_set("@#{file}", parsed_data)
      end
    end
  end
end