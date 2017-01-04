class ShopbranchesController < ApplicationController
    def index
        @shopbranch = Shopbranch.paginate(page: params[:page],per_page: 15)

        respond_to do |format|
         format.html
         format.csv { send_data @shopbranch.to_csv }
        end
    end
    def show
        @shopbranch = Shopbranch.find(params[:id])
    end
    def new
        @shopbranch = Shopbranch.new
    end
    def create
        @shopbranch = Shopbranch.new(branch_params)
            if @shopbranch.save
                flash[:success] = "successfully created!"
                redirect_to @shopbranch
            else
                render action: 'new'
            end
    end
    def update
        @shopbranch = Shopbranch.find(params[:id])
        if @shopbranch.update_attributes(branch_params)
            flash[:success] = "Branch information updated"
            redirect_to @shopbranch
        else
            render action: 'edit'
        end
    end
    def edit
        @shopbranch = Shopbranch.find(params[:id])
    end
    def destroy
        Shopbranch.find(params[:id]).destroy
        redirect_to shopbranches_path
    end
    # import excel/csv ##
    def import
        Shopbranch.import(params[:file])
        redirect_to shopbranches_path, notice: "商品を追加しました。"
    end
    # import excel/csv end ##
    private
        def branch_params
            params.require(:shopbranch).permit(:shopinfo_id, :shopname, :branchname, :address, :tel, :starthour, :endhour, :e_starthour, :e_endhour, :holiday, :longitude,:latitude, :train, :station, :train2, :station2,:train3, :station3, :area, :prefec, :city,:access,:sheet,:info )
        end
end
