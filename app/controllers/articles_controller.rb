class ArticlesController < ApplicationController
    before_action :authenticate_admin!, except: [:show]
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
        @article_1_2 = Article.find_by_sql(['select * from articles where category = :cat OR category = :cat2 OR category = :cat3', {cat:'脱毛あれこれ' ,cat2: '脱毛マスター', cat3: '脱毛入門'}])
        @article_3 = Article.find_by_sql(['select * from articles where category = :cat', {cat: 'キャンペーン'}])
        @desc = @article.article[0, 80]
        prepare_meta_tags(title: @article.title, description: '脱毛に関する疑問やお悩みは脱毛レスキューにおまかせ下さい。サロン選びに役立つ情報から某サロンの口コミ、キャンペーン情報を豊富に掲載しています。'+ '「' + @article.title + '」 ' + @desc)
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
    def destroy
        Article.find(params[:id]).destroy
        redirect_to articles_path
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
            params.require(:article).permit(:title, :article, :category, :picthum, :timestamps, :published_date)
        end
end
