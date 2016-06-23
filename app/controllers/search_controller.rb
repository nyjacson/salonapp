class SearchController < ApplicationController
    def tokyo1
        @tokyo1 = Shopbranch.where('city LIKE(?)', "%区%")
    end
end
