class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy] 
  
  def new
    @post = current_user.posts.build 
  end 

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Рецепт создан!"
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  
  def destroy
  end
  
  private

    def post_params
      params.require(:post).permit(:title, :content)
    end

end