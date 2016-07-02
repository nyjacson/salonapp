class ShopfbsController < ApplicationController
    def index
        @shopfb = Shopfb.all
    end
    def show
        @shopinfo = Shopinfo.find(params[:id])
        @shopfb = Shopfb.find_by_sql(['SELECT * FROM shopfbs where shopinfo_id = ?', params[:id]])
    end

end
