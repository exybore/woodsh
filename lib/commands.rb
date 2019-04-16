module Woodsh
  # Custom commands of Woodsh
  COMMAND_LIST = {
    'cd' => ->(args) { Woodsh::Commands.cd(args) },
    'exit' => ->(_) { exit }
  }.freeze

  module Commands
    # Go to another directory
    #
    # @param path [String] where to go on the filesystem
    def self.cd(path)
      begin
        path = ENV[:last_dir] if path == '-'
        Woodsh::ENV[:last_dir] = File.realpath('.')
        ::FileUtils.cd(path)
        Woodsh::ENV[:working_dir] = File.realpath('.')
      rescue Errno::ENOENT => e
        puts "woodsh: can't cd to #{path}: #{e.message}"
      end
    end
  end
end