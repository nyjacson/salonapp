class ShopbranchesController < ApplicationController
    def index
        @shopbranch = Shopbranch.all
    end
    def show
        @shopbranch = Shopbranch.find(params[:id])
    end
    def new
        @shopbranch = Shopbranch.new(branch_params)
    end
    def create
    end
    def edit
        @shopbranch = Shopbranch.find(params[:id])
    end
    def destroy
        Shopbranch.find(params[:id]).destroy
        redirect_to shopbranches_path
    end
    private
        def branch_params
            params.require(:shopbranch).permit(:shopinfo_id, :shopname, :branchname, :tel, :starthour, :endhour, :e_starthour, :e_endhour, :holiday, :longitude, :train, :station, :train2, :station2,:train3, :station3, :area, :prefec, :city,:access,:sheet,:info )
        end
end
