class UsersController < ApplicationController
    before_action :set_user, only: %i[show edit update destroy ]
    def index
        @users = User.all       
        render json: @users
    end

    def show 
   
        #binding.irb
        render json:  @user.as_json.merge(avatar_url: url_for(@user.avatar))
    end

    def new 
        @users = User.new
        
    end

    def edit
    end

    def create           
   
       @user = User.new(users_params)
        
        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      
      
    def update
        if @user.update(user_params)
            redirect_to user_url(@user)
        else
        render :edit
        end
    end 

    def destroy
        @user.destroy
        redirect_to users_url
    end


    private

    def set_user
        @user = User.find(params[:id])
    end
        
    def users_params
        params.require(:user).permit(:email, :password, :name, :age, :avatar)
      end
end


