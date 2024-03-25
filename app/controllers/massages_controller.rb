class MassagesController < ApplicationController
    before_action set_massage, only: %i[show edit update destroy]

def index
    @massage = Massage.find(params[:id])
    render json:  @post

end

def new
    @massage = Massage.new
end

def edit
end
    
def  create
    @massage = Massage.new(massage_params)
end
         
def update
    if @massage.update(massage_params)
        redirect_to @massage
    else
        render :edit
        end
end

def destroy
    
    @massage.destroy
    redirect_to massage_url
end

private

def set_massage
    @massage = Massage.fin(paramas[:id])

end 

def massage_params 
    params.requier(:massage).permit(:body, :id_user)
    end
end

