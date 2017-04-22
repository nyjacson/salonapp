require 'csv'
require 'nkf'

csv_str = CSV.generate do |csv|
  csv << @shopinfo.column_names
    @shopinfo.all.each do |items|
      csv << items.attributes.values_at(*@shopinfo.column_names)
    end
end

NKF::nkf('--sjis -Lw', csv_str)
