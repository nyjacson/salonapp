# coding: utf-8
require "csv"

CSV.foreach('shoplist.csv') do |row|
 print "Shopinfo.create!("
 print ":shopname => " + %Q["#{row[0]}"]
 print ",:company => " + %Q["#{row[1]}"]
 print ",:affili => " + %Q["#{row[2]}"]
 print ",:ranking => #{row[3]}"
 print ",:recommend => " + %Q["#{row[4]}"]
 print ",:shoptype => " + %Q["#{row[5]}"]
 print ",:treattype => " + %Q["#{row[6]}"]
 print ",:body => " + %Q["#{row[7]}"]
 print ",:machine => " + %Q["#{row[8]}"]
 print ",:campaign => " + %Q["#{row[9]}"]
 print ",:price1 => " + %Q["#{row[10]}"]
 print ",:price2 => " + %Q["#{row[11]}"]
 print ",:price3 => " + %Q["#{row[12]}"]
 print ",:pic1 => " + %Q["#{row[13]}"]
 print ",:pic2 => " + %Q["#{row[14]}"]
 print ",:pic3 => " + %Q["#{row[15]}"]
 print ",:pic4 => " + %Q["#{row[16]}"]
 print ",:pic5 => " + %Q["#{row[17]}"]
 print ",:recommend2 => " + %Q["#{row[18]}"]
 print ",:recommend3 => " + %Q["#{row[19]}"]
 print ")\n"
end
