class ShopinfosController < ApplicationController
    before_action :authenticate_admin!, except: [:show]
    def index
        @shopinfo = Shopinfo.paginate(page: params[:page],per_page: 15)
    end
    def download
        @shopinfo = Shopinfo.all
        respond_to do |format|
            format.html { redirect_to :action => 'download', :format => 'csv'}
            format.csv { render :content_type => 'text/csv' }
        end
    end
    def show
        @shopinfo = Shopinfo.find(params[:id])
        @shopfbs = Shopfb.find(params[:id])
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
    def update
        @shopinfo = Shopinfo.find(params[:id])
        if @shopinfo.update_attributes(shop_params)
            flash[:success] = "Shopinfo updated"
            redirect_to @shopinfo
        else
            render action: 'edit'
        end
    end
    def edit
        @shopinfo = Shopinfo.find(params[:id])
    end
    def destroy
        Shopinfo.find(params[:id]).destroy
        redirect_to shopinfos_path
    end
    def import
        if params[:csv_file].blank?
            redirect_to(static_pages_admin_path, alert: 'インポートするCSVファイルを選択してください')
        else
            num = Shopfb.import(params[:csv_file])
            redirect_to(shopinfos_path, notice: "#{num.to_s}件追加されました")
        end
    end

    private
        def shop_params
            params.require(:shopinfo).permit(:shopname, :company, :affili, :ranking, :recommend, :shoptype, :treattype, :body, :machine, :campaign,:pic1,:pic2,:pic3,:pic4,:pic5,:price1,:price2,:price3,:recommend2,:recommend3)
        end

end
