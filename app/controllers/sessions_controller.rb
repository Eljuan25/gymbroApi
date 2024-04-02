class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only:  %i[show destroy]
    

   
  
    
    
    
    def create
      @user = User.find_for_database_authentication(email: params[:email])
      if @user && @user.valid_password?(params[:password])
        sign_in(@user)
        render json: { message: "Inicio de sesión exitoso", user: @user }, status: :ok
      else
        render json: { error: "Credenciales inválidas" }, status: :unauthorized
      end
    end
  
    def show
      if current_user
        render json: current_user, status: :ok
      else
        render json: { error: "No hay sesión iniciada" }, status: :unauthorized
      end
    end
  
    def destroy
      if current_user
        sign_out(current_user)
        render json: { message: "Sesión cerrada exitosamente" }, status: :ok
      else
        render json: { error: "No hay sesión activa para cerrar" }, status: :unauthorized
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :encrypted_password, :password_confirmation)
    end
  end
  
