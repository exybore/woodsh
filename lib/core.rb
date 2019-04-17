require_relative 'commands'
require_relative 'modules'
require_relative 'theme'

module Woodsh
  # Informations about the environment
  ENV = {
    working_dir: File.realpath('.'),
    last_dir: File.realpath('.')
  }

  # Custom commands of Woodsh
  COMMAND_LIST = {
    'exit' => ->(_) { exit }
  }

  module Core
    # Setup the core
    def self.setup
      Commands.setup
      Modules.setup
      COMMAND_LIST.freeze
    end

    # Start the shell
    def self.start
      $stdout.print("#{CONFIG.theme['motd']}\n")
      $stdout.print(Woodsh::Theme::generate_theme)

      $stdin.each_line do |input|
        pid = Thread.new do
          unless input.delete(' ').empty?
            executed = false
            request_command = input.split
            
            # Test if the user typed a custom command / module
            Woodsh::COMMAND_LIST.each do |command, function|
              if request_command[0] == command
                function.(request_command[1]) if request_command[0] == command
                executed = true
                break
              end
            end
          end
          system input unless executed
        end

        pid.join
        $stdout.print(Woodsh::Theme::generate_theme)
      end
    end
  end
end