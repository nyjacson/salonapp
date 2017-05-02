class ShopbranchesController < ApplicationController
    before_action :authenticate_admin!, except: [:show]
    def index
        @shopinfo = Shopinfo.find(params[:shopinfo_id])
    end
    def download
        @shopbranch = Shopbranch.all
        respond_to do |format|
            format.html { redirect_to :action => 'download', :format => 'csv'}
            format.csv { render :content_type => 'text/csv' }
        end
    end
    def show
        @shopbranch = Shopbranch.find(params[:id])
        @shopinfo = Shopinfo.find(params[:shopinfo_id])
        @shopfbs = Shopfb.find(params[:shopinfo_id])
    end
    def new
        @shopinfo = Shopinfo.find(params[:shopinfo_id])
        @shopbranch = @shopinfo.shopbranches.build
        # @shopbranch = Shopbranch.new
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
        @shopinfo = Shopinfo.find(params[:shopinfo_id])
    end
    def destroy
        Shopbranch.find(params[:id]).destroy
        redirect_to shopbranches_path
    end
    def import
        if params[:csv_file].blank?
            redirect_to(static_pages_admin_path, alert: 'インポートするCSVファイルを選択してください')
        else
            num = Shopbranch.import(params[:csv_file])
            redirect_to(shopinfo_shopbranches_path, notice: "#{num.to_s}件追加されました")
        end
    end
    private
        def branch_params
            params.require(:shopbranch).permit(:shopinfo_id, :shopname, :branchname, :address, :tel, :starthour, :endhour, :e_starthour, :e_endhour, :holiday, :longitude,:latitude, :train, :station, :train2, :station2,:train3, :station3, :area, :prefec, :city,:access,:sheet,:info )
        end
end
