class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_user_same_user,  only: [:edit, :update, :destroy]
    def index
    @articles = Article.paginate(page: params[:page], per_page: 3)   
    end
    
    
   def new
       @article = Article.new
   end
   
   
   def edit
    #   @article = Article.find(params[:id])
   end 
   
   def update
    #   @article = Article.find(params[:id])
      if @article.update(article_params)
          flash[:success] = "You have successfully updated your article"
          redirect_to article_path(@article)
      else
          render 'edit'
      end
       
   end
   
   def create
    #   render plain: params[:article].inspect
       @article = Article.new(article_params)
       
     @article.user = current_user  #//set user for crating articles
        if @article.save
        flash[:success] = 'You have successfully created a new article'
        redirect_to article_path(@article)
        else
            render 'new'
        end
    
   end
   
   
   
   def show
    #   @article = Article.find(params[:id]) 
       
   end
   
   
   def destroy
    #   @article = Article.find(params[:id])
      @article.destroy
      flash[:danger] = 'You have successfully deleted your article'
      redirect_to articles_path 
   end
   
   
   
   private
   
   def set_article
       @article = Article.find(params[:id])
   end
   
#   set paramaters
   def article_params
      params.require(:article).permit(:title, :description) 
   end
   
   def require_user_same_user
       if logged_in? != @article.user and !current_user.admin?
           flash[:danger] = 'You can only edit/delete your own articles'
           redirect_to articles_path
       end
    end
    
    
end