class ShopinfosController < ApplicationController
    def index
        @shopinfo = Shopinfo.all
    end
    def show
        @shopinfo = Shopinfo.find(params[:id])
    end
    def new
        @shopinfo = Shopinfo.new
    end
    def create
        @shopinfo = Shopinfo.new(shop_params)
            if @shopinfo.save
                flash[:success] = "successfully created!"
                redirect_to @shopinfo
            else
                render action: 'new'
            end
    end
    def edit
        @shopinfo = Shopinfo.find(params[:id])
    end
    def destroy
        Shopinfo.find(params[:id]).destroy
        redirect_to shopinfos_path
    end

    private
        def shop_params
            params.require(:shopinfo).permit(:shopname, :company, :affili, :ranking, :recommend, :shoptype, :treattype, :body, :machine, :campaign,:pic1,:pic2,:pic3,:pic4,:pic5,:price1,:price2,:price3)
        end

end
