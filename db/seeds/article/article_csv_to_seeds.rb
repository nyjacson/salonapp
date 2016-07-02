# coding: utf-8
require "csv"

CSV.foreach('article.csv') do |row|
 print "Article.create!("
 print ":title => " + %Q["#{row[0]}"]
 print ",:article => " + %Q["#{row[1]}"]
 print ",:category => " + %Q["#{row[2]}"]
 print ",:picthum => " + %Q["#{row[3]}"]
 print ")\n"
end
