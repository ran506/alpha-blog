class ArticlesController <ApplicationController
    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end
        
        
        
    def new
        @article = Article.new
    end
    def create
        #render plain: params[:article].inspect
        #@article.save
        #redirect_to article_path(@article)
        @article =Article.new(article_params)
        @article.user = User.first
        if @article.save
            #do sth
            flash[:notice] = "Article was sucessfully created"
            redirect_to article_path(@article)
        else 
            render 'new'
        end
    end
    def edit
        @article = Article.find(params[:id])
    end
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)  
          flash[:notice] = "Article was successfully updated"
           redirect_to article_path(@article)
        else
          render 'edit'
        end
        end
    
    def destroy
        @article =Article.find(params[:id])
        @article.destroy
        flash[:notice]="Article was successfully deleted"
        redirect_to article_path
    end
    
    def show
        @article = Article.find(params[:id])
    end 
    private 
      def article_params
        params.require(:article).permit(:title, :description)
      end 
end