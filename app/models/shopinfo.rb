class Shopinfo < ActiveRecord::Base
    has_many :shopbranches
    has_many :shopfbs

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
        ["shopname", "company", "affili", "ranking", "recommend", "recommend2", "recommend3", "shoptype", "treattype", "body", "machine", "campaign", "price1", "price2", "price3", "pic1", "pic2", "pic3", "pic4", "pic5"]
    end

end
