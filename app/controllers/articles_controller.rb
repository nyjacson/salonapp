class ArticlesController < ApplicationController

    def index
        @article = Article.all
    end
    def download
        @article = Article.all
        respond_to do |format|
            format.html { redirect_to :action => 'download', :format => 'csv'}
            format.csv { render :content_type => 'text/csv' }
        end
    end
    def show
        @article = Article.find(params[:id])
        @articleAll = Article.all
        @article_1_2 = Article.find_by_sql(['select * from articles where category = :cat OR category = :cat2', {cat: 'something', cat2: 'beginner'}])
        @article_3 = Article.find_by_sql(['select * from articles where category = :cat', {cat: 'campaign'}])
    end
    def new
        @article = Article.new
    end
    def edit
        @article = Article.find(params[:id])
    end
    def create
        @article = Article.new(article_params)
            if @article.save
                flash[:success] = "successfully created!"
                redirect_to @article
            else
                render action: 'new'
            end
    end
    def update
        @article = Article.find(params[:id])
        if @article.update_attributes(article_params)
            flash[:success] = "Article was updated"
            redirect_to @article
        else
            render action: 'edit'
        end
    end

    def import
        if params[:csv_file].blank?
            redirect_to(static_pages_admin_path, alert: 'インポートするCSVファイルを選択してください')
        else
            num = Article.import(params[:csv_file])
            redirect_to(articles_path, notice: "#{num.to_s}件追加されました")
        end
    end

    private
        def article_params
            params.require(:article).permit(:title, :article, :category, :picthum, :timestamps)
        end
end
