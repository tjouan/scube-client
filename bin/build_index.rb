#!/usr/bin/env ruby

require 'json'

index     = File.read('public/index.html')
manifest  = JSON.parse(ARGF.read, symbolize_names: true)

manifest[:files].each do |built_file, file|
  index.gsub! file[:logical_path], built_file.to_s
end

puts index
