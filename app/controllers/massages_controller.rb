class MassagesController < ApplicationController
    before_action :set_massage, only: %i[show edit update destroy]

    def index
        @massages = Massage.all
        render json: @massages
    end

    def new
        @massage = Massage.new
    end

    def create
        @massage = Massage.new(massage_params)
        if @massage.save
            render json: @massage, status: :created, location: @massage
        else
            render json: @massage.errors, status: :unprocessable_entity
        end
    end
    
    def show
        render json: @massage
    end

    def edit
    end
    
    def update
        if @massage.update(massage_params)
            render json: @massage
        else
            render json: @massage.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @massage.destroy
        head :no_content
    end

    private

    def set_massage
        @massage = Massage.find(params[:id])
    end 

    def massage_params 
        params.require(:massages).permit(:body, :user_id)
    end
end


