class Shopbranch < ActiveRecord::Base
    belongs_to :shopinfo
    geocoded_by :address
    after_validation :geocode, if: :address_changed?

    def self.import(file)
        imported_num = 0
        open(file.path, 'rb:Shift_JIS:utf-8', undef: :replace) do |f|
            csv = CSV.new(f, :headers => :first_row)
            csv.each do |row|
                next if row.header_row?
                table = Hash[[row.headers, row.fields].transpose]
                item = find_by(:id => table["id"])
                if item.nil?
                    item = new
                end
                item.attributes = table.to_hash.slice(*updatable_attributes)
                if item.valid?
                    item.save!
                    imported_num += 1
                end
            end
        end
        imported_num
    end

    def self.updatable_attributes
        ["shopinfo_id", "shopname", "branchname", "address", "tel", "starthour", "endhour", "e_starthour", "e_endhour", "holiday", "latitude", "longitude", "train", "station", "train2", "station2", "train3", "station3", "area", "prefec", "city", "access", "sheet", "info"]
    end

    
end
