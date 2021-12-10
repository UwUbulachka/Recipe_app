class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy] 
  before_action :correct_user, only: :destroy

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
    @post.destroy
    flash[:success] = "Рецепт удален"
    redirect_to request.referrer || root_url
  end
  
  private

    def post_params
      params.require(:post).permit(:title, :content, {pictures: []}, :image)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end