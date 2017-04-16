# coding: utf-8
require "csv"

CSV.foreach('shopfbs.csv') do |row|
 print "Shopfb.create!("
 print ":shopinfo_id => " + %Q["#{row[0]}"]
 print ",:fbshopname => " + %Q["#{row[1]}"]
 print ",:fbtitle => " + %Q["#{row[2]}"]
 print ",:fbcomment => " + %Q["#{row[3]}"]
 print ",:auther => " + %Q["#{row[4]}"]
 print ",:fbrank => #{row[5]}"
 print ",:ages => " + %Q["#{row[6]}"]
 print ",:jobs => " + %Q["#{row[7]}"]
 print ")\n"
end
