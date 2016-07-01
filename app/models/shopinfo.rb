class Shopinfo < ActiveRecord::Base
    has_many :shopbranches
    has_many :shopfbs
end
