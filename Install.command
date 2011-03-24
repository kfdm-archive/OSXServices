#!/usr/bin/env ruby

$source = File.dirname(__FILE__)
$dest = File.expand_path('~/Library/Services')

Dir.mkdir($dest) if not File.exists?($dest)

Dir.glob("#{$source}/*workflow").each do |workflow|
	@dir = File.basename(workflow)
	@dest = File.join($dest,@dir)
	
	if not File.exists? @dest
		puts `cp -R '#{workflow}' '#{@dest}' `
	end
end

sh `open "#{$dest}"`