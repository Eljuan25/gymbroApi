class SessionsController < ApplicationController
    before_action :set_user, only: %i[show destroy]
    def index

        @sessions = User.all
        render json: @sessions


    end
    
    def create
      @user = User.find_for_database_authentication(email: params[:email])
      if @user && @user.valid_password?(params[:password])
        sign_in(@user)
        render json: @user
      else
        render json: { error: 'Correo electrónico o contraseña incorrectos' }, status: :unauthorized
      end
    end
  
    def show
      if current_user
        render json: current_user
      else
        render json: { error: 'Usuario no autenticado' }, status: :unauthorized
      end
    end
  
    def destroy
      if current_user
        sign_out(current_user)
        render json: { message: 'Sesión cerrada exitosamente' }
      else
        render json: { error: 'Usuario no autenticado' }, status: :unauthorized
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :encrypted_password, :password_confirmation)
    end
end
