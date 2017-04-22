require 'csv'
require 'nkf'

csv_str = CSV.generate do |csv|
  csv << @article.column_names
    @article.all.each do |items|
      csv << items.attributes.values_at(*@article.column_names)
    end
end

NKF::nkf('--sjis -Lw', csv_str)
