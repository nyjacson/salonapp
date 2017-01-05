class Shopfb < ActiveRecord::Base
    belongs_to :shopinfo

    # import excel/csv ##
    def self.import(file)
        spreadsheet = open_spreadsheet(file)
        header = spreadsheet.row(1)

        (2..spreadsheet.last_row).each do |i|
          # {カラム名 => 値, ...} のハッシュを作成する
          row = Hash[[header, spreadsheet.row(i)].transpose]

          # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
          product = find_by(id: row["id"]) || new
          # CSVからデータを取得し、設定する
          product.attributes = row.to_hash.slice(*updatable_attributes)
          # 保存する
          product.save!
        end
    end

    def self.open_spreadsheet(file)
        case File.extname(file.original_filename)
        when '.csv'  then Roo::Spreadsheet.open(file.path, extension: :csv)
        when '.xlsx' then Roo::Spreadsheet.open(file.path, extension: :xlsx)
        when '.ods'  then Roo::Spreadsheet.open(file.path, extension: :ods)
        else raise "Unknown file type: #{file.original_filename}"
        end
    end

    def self.updatable_attributes
        ["shopinfo_id", "fbshopname", "fbtitle", "fbcomment", "auther", "fbrank", "ages", "jobs"]
    end
    # import excel/csv end ##
    # export csv ##
    def self.to_csv
       CSV.generate do |csv|
         csv << csv_column_names
         all.each do |product|
           csv << product.csv_column_values
         end
       end
    end

    def self.csv_column_names
         ["id", "shopinfo_id", "fbshopname", "fbtitle", "fbcomment", "auther", "fbrank", "ages", "jobs"]
    end

    def csv_column_values
         [id, shopinfo_id, fbshopname, fbtitle, fbcomment, auther, fbrank, ages, jobs]
    end
    # export csv end ##
end
