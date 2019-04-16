require 'fileutils'
require_relative 'lib/core'

Woodsh.start

# # List all the available commands
# #
# # @param guild_id [Integer] (unused yet)
# def listCommands(guild_id = nil)
#   commands = {}
#   prefix = $config['prefix']
#   Dir["#{@core_folder}/src/commands/*.rb"].each do |path|
#     resp = Regexp.new("([a-z0-9]+)\.rb$").match(path)
#     if resp != nil && resp[1] != 'command'
#       cmd_name = resp[1]
#       cmd = loadCommand(cmd_name)
#       data = {
#         name:     cmd_name,
#         function: lambda { |args, context| cmd.exec(args, context) },
#         alias:    (cmd::ALIAS),
#         show:     (cmd::SHOW),
#         usage:    (cmd.const_defined?('USAGE') ? "#{prefix}#{cmd::USAGE.to_s}" : "#{prefix}#{cmd_name}"),
#         desc:     (cmd::DESC),
#         category: (cmd::CATEGORY),
#         channels: (cmd::CHANNELS),
#         roles:    (cmd::ROLES),
#         members:  (cmd::MEMBERS),
#         listen:   (cmd::LISTEN)
#       }
#       commands[cmd_name] = Classes::Command.new(data)
#     end
#   end
#   commands
# end

# # Load a command from the files
# #
# # @param command [String] the command's name
# def loadCommand(command)
#   require_relative "src/commands/#{command}"
#   eval "Commands::#{command.capitalize}"
# end