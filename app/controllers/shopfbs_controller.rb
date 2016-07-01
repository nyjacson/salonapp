class ShopfbsController < ApplicationController
    def index
        @shopfb = Shopfb.all
    end
end
