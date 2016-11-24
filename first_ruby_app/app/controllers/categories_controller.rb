class   CategoriesController < ApplicationController
    
    before_action :require_admin, except: [:index, :show]
    
    
    def index
        @categories = Category.paginate(page: params[:page], per_page: 5)
    end
    
    
    def new 
        @category = Category.new
    end
    
    
    def show
        
    end
    
    def create
       @category = Category.new(category_params) 
       if @category.save
          flash[:success] = 'You have successfully created the category' 
          redirect_to categories_path
       else
           render 'new'
       end
    end
    
    
    
    
    
    
    private
    
    def category_params
       params.require(:category).permit(:name) 
    end
    
    
    def require_admin
       if !logged_in? || (logged_in? && !current_user.admin?) 
           flash[:danger] = "Only Admin can perform such actions"
           redirect_to root_path
       end
    end
    
    
end