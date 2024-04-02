class PostsController < ApplicationController
    before_action :set_post , only:  %i[show edit update destroy]

    def index 
        @posts = Post.all
        render json: @posts
    end


    def show 
       @post = Post.fin(params[:id])
    end

    def new
        @post = Post.new
    end

    

    def edit 
    end  

    def create
        @post = Post.new(post_params)
        if @post.save
            render json: @post, status: :created, location: @post
        else
            render :new
        end
    end

    def update
        if @post.update(post_params)
            render json: @post
        else
        render :edit
        end
    end

    def destroy
        @post.destroy
        head :no_content
    end

    private

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:posts).permit(:description, :user_id)
    end    
end 

