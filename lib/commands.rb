module Woodsh
  module Commands
    # Setup the custom commands
    def self.setup
      CONFIG.custom_commands.each do |name, data|
        Woodsh::COMMAND_LIST[name] = ->(_) do
          data['commands'].each do |command|
            system command
          end
        end
      end
    end
  end
end