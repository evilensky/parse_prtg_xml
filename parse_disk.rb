require "nokogiri"
file = File.new("vfsmcbitsdb.xml")
doc  = Nokogiri::XML file

subnodes = doc.xpath("//item")



subnodes.each do | node |
  datetime = node.xpath("datetime").text
  freebytes = node.xpath("value_raw[@channel='Free Bytes']").text
  date_str = datetime.to_s

  print date_str[0..8] + ',' + freebytes + "\n"
end
