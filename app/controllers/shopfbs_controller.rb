class ShopfbsController < ApplicationController
    def index
        @shopfb = Shopfb.all
    end
    def download
        @shopfb = Shopfb.all
        respond_to do |format|
            format.html { redirect_to :action => 'download', :format => 'csv'}
            format.csv { render :content_type => 'text/csv' }
        end
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
    def update
        @shopfb = Shopfb.find(params[:id])
        if @shopfb.update_attributes(feedback_params)
            flash[:success] = "Feedback was updated"
            redirect_to @shopfb
        else
            render action: 'edit'
        end
    end
    # import excel/csv ##
    def import
        Shopfb.import(params[:file])
        redirect_to shopfbs_path, notice: "レビューを追加しました"
    end
    # import excel/csv end ##

    private
        def feedback_params
            params.require(:shopfb).permit(:shopinfo_id, :fbshopname, :fbtitle, :fbcomment, :auther, :fbrank, :ages, :jobs )
        end
end
