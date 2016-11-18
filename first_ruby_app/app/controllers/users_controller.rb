class UsersController < ApplicationController
    
    before_action :set_user, only: [:edit, :update, :show]
    before_action :require_same_user, only: [:edit, :update]
    
    def index
        @users = User.paginate(page: params[:page], per_page: 2)    
    end
    
    
    def new
    
        @user = User.new
    
    end
    
    
    def create
    
    @user = User.new(user_params)
    
        if @user.save
        
        flash[:success] = "Welcome to the alpha blog #{@user.username}"
        
        redirect_to articles_path
        
        else
        
        render 'new'
        
        end
    
    end
    
    
    def edit
    # used before_action on top
    #   @user = User.find(params[:id]) 
    end
    
    def update
       # used before_action on top
      # @user = User.find(params[:id])
       if @user.update(user_params)
           flash[:success] = "You have successfully updated your account"
           redirect_to articles_path
       else
          render 'new' 
       end
        
    end
    
    
    def show
    # used before_action on top
    #  @user = User.find(params[:id]) 
     @user_articles = @user.articles.paginate(page: params[:page], per_page: 2)
    end
    
    
    
    
    private
    
    def user_params
    
    params.require(:user).permit(:username, :email, :password)
    
    end
    
    
    def set_user
        @user = User.find(params[:id])
    end
    
    
    def require_same_user
        if logged_in? && current_user != @user
            flash[:danger] = 'YOu can only edit/delete your own account'
            redirect_to users_path
        end
        
    end
    

end

