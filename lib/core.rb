require_relative 'commands'

module Woodsh
  # Informations about the environment
  ENV = {
    working_dir: File.realpath('.'),
    last_dir: nil
  }

  def self.start
    puts 'Woodsh - A little Ruby shell'
    $stdout.print "#{Woodsh::ENV[:working_dir]} -> "

    $stdin.each_line do |input|
      ::FileUtils.cd(Woodsh::ENV[:working_dir])
      pid = Thread.new do
        unless input.delete(' ').empty?
          executed = false
          request_command = input.split
          Woodsh::COMMAND_LIST.each do |command, function|
            if request_command[0] == command
              function.(request_command[1]) if request_command[0] == command
              executed = true
              break
            end
          end
        end
        system input
      end

      pid.join
      $stdout.print "#{Woodsh::ENV[:working_dir]} -> "
    end
  end
end