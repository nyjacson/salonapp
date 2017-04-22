require 'csv'
require 'nkf'

csv_str = CSV.generate do |csv|
  csv << @shopbranch.column_names
    @shopbranch.all.each do |items|
      csv << items.attributes.values_at(*@shopbranch.column_names)
    end
end

NKF::nkf('--sjis -Lw', csv_str)
