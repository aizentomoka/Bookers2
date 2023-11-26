class UsersController < ApplicationController
 
  def show
    @user = User.find(params[:id])
    @books = @user.books  
   
  end
  
  def edit
    @user = current_user
    
  end

  def index
    @users = User.all
    @user = current_user
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path(@user)  
    else
       redirect :edit
    end
  end
  
  
  
  private
    
    def user_params
      params.require(:user).permit(:name, :email, :introduction, :profile_image)
    end
      
  
  
  
end
