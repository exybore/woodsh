module Woodsh
  module Theme
    # Generate the theme to display in the shell
    def self.generate_theme
      formats = {
        'user': ::ENV['USER'],
        'sys': ::ENV['NAME'],
        'arch': ::ENV['HOSTTYPE'],
        'lang': ::ENV['LANG'],
        'dir': Woodsh::ENV[:working_dir]
      }
      formated = Woodsh::CONFIG.theme['format']
      formats.each do |key, value|
        formated = formated.gsub(/{#{key}}/, value)
      end
      formated + ' '
    end
  end
end