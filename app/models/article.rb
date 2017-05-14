class Article < ActiveRecord::Base
    validates :title, uniqueness: true
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
        ["title", "article", "category", "picthum", "published_date"]
    end

end
