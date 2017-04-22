require 'csv'
require 'nkf'

csv_str = CSV.generate do |csv|
  csv << @shopfb.column_names
    @shopfb.all.each do |items|
      csv << items.attributes.values_at(*@shopfb.column_names)
    end
end

NKF::nkf('--sjis -Lw', csv_str)
