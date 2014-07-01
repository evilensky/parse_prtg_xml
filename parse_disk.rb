#!/usr/bin/env ruby

require 'slop'
require 'nokogiri'


#get some options.  cool stuff like usernames and passwords can go in here


opts = Slop.parse do
  banner 'xml_to_csv.rb [options] --filename xxxx --channel yyyy'
  on 'filename=', 'filename'
  on 'channel=', 'channel'
end

#we're only going to load one file at a time.



def load_file(filename, opts)
  file = File.new(opts[:filename])
  doc  = Nokogiri::XML file
  return doc
end

#within the downloaded XML file, 
subnodes = doc.xpath("//item")

def print_subnodes(subnodes, opts)

  subnodes.each do | node |
    datetime = node.xpath("datetime").text
    channel = node.xpath("#{opts[:channel]}").text
    date_str = datetime.to_s

    print date_str[0..8] + ',' + channel + "\n"
  end

end

load_file(filename, opts)

print_subnodes(subnodes, opts)
