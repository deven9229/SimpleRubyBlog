class PostsController < ApplicationController
 layout false 
 before_action :set_post, only: [:show, :edit, :update, :destroy]
 
 def index
 @posts = Post.all.order("created_at DESC")
 end

  def show
  	@post = Post.find(params[:id])
  end

  def edit
  	@post = Post.find(params[:id])
  end
  
  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  		if @post.save
  			redirect_to @post, notice: "you create a post"
  		else
  			render :new, alert: "your post wasn't created"
  		end
  end

   def update
    if @post.update(post_params)
      redirect_to @post, notice: "post was successfully updated"
    else
      render :edit, alert: "your post wasn't updated"
   end
  end
  
    def destroy
      @post.destroy
      redirect_to posts_path notice: "your post was deleted"
    end

  private
  
  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
  	params.require(:post).permit(:title, :body)
  end
end
