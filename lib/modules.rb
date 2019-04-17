module Woodsh
  module Modules
    # Setup the Woodsh modules
    def self.setup
      Dir["src/modules/*.rb"].each do |path|
        resp = Regexp.new("([a-z0-9]+)\.rb$").match(path)
        if resp != nil && resp[1] != 'module'
          moduleName = resp[1]
          mdl = load_module(moduleName)
          Woodsh::COMMAND_LIST[moduleName] = ->(args) { mdl.exec (args) }
        end
      end
    end

    # Load a module from the files
    #
    # @param module [String] the module's name
    def self.load_module(name)
      require_relative "../src/modules/#{name}"
      eval "Woodsh::Modules::#{name.capitalize}"
    end
  end
end