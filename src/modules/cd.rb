require_relative 'module'

module Woodsh
  module Modules
    # Replaces the cd command of the system
    class Cd < Module
      def self.exec(path)
        begin
          path = ENV[:last_dir] if path == '-'
          path = ::ENV['HOME'] if path.nil?
          Woodsh::ENV[:last_dir] = File.realpath('.')
          ::FileUtils.cd(path)
          Woodsh::ENV[:working_dir] = File.realpath('.')
        rescue Errno::ENOENT => e
          puts "woodsh: can't cd to #{path}: #{e.message}"
        end
      end
    end
  end
end