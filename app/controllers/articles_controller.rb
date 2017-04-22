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

    # import excel/csv ##
    def import
        Article.import(params[:file])
        redirect_to articles_path, notice: "記事を追加しました"
    end
    # import excel/csv end ##

    private
        def article_params
            params.require(:article).permit(:title, :article, :category, :picthum, :timestamps)
        end
end
