class Shopbranch < ActiveRecord::Base
    belongs_to :shopinfo
    geocoded_by :address
    after_validation :geocode, if: :address_changed?
    # import excel/csv ##
     def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
         # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
         product = find_by(id: row["id"]) || new
         # CSVからデータを取得し、設定する
         product.attributes = row.to_hash.slice(*updatable_attributes)
         # 保存する
         product.save!
       end
     end
     # 更新を許可するカラムを定義
    def self.updatable_attributes
        ["shopinfo_id", "shopname", "branchname", "address", "tel", "starthour", "endhour", "e_starthour", "e_endhour", "holiday", "latitude", "longitude", "train", "station", "train2", "station2", "train3", "station3", "area", "prefec", "city", "access", "sheet", "info"]
    end
    # import excel/csv end ##
end
