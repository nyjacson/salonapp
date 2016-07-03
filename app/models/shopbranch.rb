class Shopbranch < ActiveRecord::Base
    belongs_to :shopinfo
    geocoded_by :address
    after_validation :geocode, if: :address_changed?
end
