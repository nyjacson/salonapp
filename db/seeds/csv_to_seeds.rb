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
 print ")\n"
end
