#!/usr/bin/ruby

require 'yaml'
require 'erb'
require 'lib/helpers'

def content_for_layout(mode = 'input')
	content = ''
	case mode
		when 'input'
			content = File.open('views/form.html') do |f|
				ERB.new(f.read).result(binding)
			end
		when 'send'
	end
	content
end

layout = File.open('views/layout.html') do |f| 
	ERB.new(f.read).result(binding)
end

File.open('result.html', 'w+b') do |f|
	f.write(layout)
end

