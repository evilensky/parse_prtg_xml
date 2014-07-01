#!/usr/bin/env ruby

require 'slop'
require 'nokogiri'

opts = Slop.parse do
  banner 'xml_to_csv.rb [options] --filename xxxx --channel yyyy'
  on 'filename=', 'filename'
  on 'channel=', 'channel'
end

file = File.new(opts[:filename])
doc  = Nokogiri::XML file

subnodes = doc.xpath("//item")



subnodes.each do | node |
  datetime = node.xpath("datetime").text
  channel = node.xpath("#{opts[:channel]}").text
  date_str = datetime.to_s

  print date_str[0..8] + ',' + channel + "\n"
end
