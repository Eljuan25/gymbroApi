class PostsController < ApplicationController
    before_action  :set_post, only: %i[show edit update destroy]


def index 
    @posts = Post.find(params[:id])
    render json: @post
end

def new

    @post = Post.new
end

def edit
end

def create
    @post = Post.new(post_params)
end

def update
    if @post.update(post_params)
        redirect_to @post 
    else
        render :edit
    end
end

def destroy
    @post.destroy
    redirect_to post_url
end

private

def set_post
    @post = Post.find(paramas[:id])

end

def post_params
    params.requier(:post).permit(:description, id_user)


end
