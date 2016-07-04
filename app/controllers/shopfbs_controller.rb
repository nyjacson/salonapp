class ShopfbsController < ApplicationController
    def index
        @shopfb = Shopfb.all
    end
    def show
        @shopinfo = Shopinfo.find(params[:id])
        @shopfb = Shopfb.find_by_sql(['SELECT * FROM shopfbs where shopinfo_id = ?', params[:id]])
    end
    def new
        @shopfb = Shopfb.new
    end
    def edit
        @shopfb = Shopfb.find(params[:id])
    end
    def create
        @shopfb = Shopfb.new(feedback_params)
            if @shopfb.save
                flash[:success] = "successfully created!"
                redirect_to @shopfb
            else
                render action: 'new'
            end
    end
    private
        def feedback_params
            params.require(:shopfb).permit(:shopinfo_id, :fbshopname, :fbtitle, :fbcomment, :auther, :fbrank, :ages, :jobs )
        end

end
