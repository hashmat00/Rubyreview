class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    
    def index
    @articles = Article.all    
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
          flash[:notice] = "You have successfully updated your article"
          redirect_to article_path(@article)
      else
          render 'edit'
      end
       
   end
   
   def create
    #   render plain: params[:article].inspect
      @article = Article.new(article_params)
        if @article.save
        flash[:notice] = 'You have successfully created a new article'
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
      flash[:notice] = 'You have successfully deleted your article'
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
    
    
    
end