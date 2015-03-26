# set-PREPROCESSOR_DEFINITION
#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'xcodeproj'


def set_preprocessor_to_targets(xcproj, target_name, flags)
  xcproj.targets.each do |target|
    next unless target_name === target.name
    target.build_configurations.each do |cfg|
      old = cfg.build_settings['GCC_PREPROCESSOR_DEFINITIONS']

      cfg.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] = flags
    end
  end
end

#ARGV.shift
xcproj_path = '../xcode/General.xcodeproj'
target_name = 'General'
flags = 'aaa'

xcproj = Xcodeproj::Project.new(xcproj_path)
xcproj.initialize_from_file

set_preprocessor_to_targets(xcproj, target_name, flags)

xcproj.save
