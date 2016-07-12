class SearchController < ApplicationController
    def tokyo1
        @tokyo1 = Shopbranch.where('city LIKE(?)', "%区%")
    end
    def tokyo2
        @tokyo2 = Shopbranch.find_by_sql(['select * from shopbranches where (prefec = :prefec) AND (city LIKE :city)', {prefec: '東京都',city: '%市%'}])
    end
end
