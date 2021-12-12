class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [ :index, :new, :create, :edit, :update, :destroy]
  def index
  	@categories = Category.all
  end 

  def show
     @posts = Post.where(category_id: [@category.id]).paginate(page: params[:page], per_page: 5)
  end 

  def new
  	@category = Category.new
  end 

  def create
  	@category = Category.new(category_params)
  	if @category.save
  	  flash[:success] = "Категория создана!"
      redirect_to categories_path
    else 
      flash[:danger] = "Категория не создана" 
      render 'new'
    end  
  end 

  def edit
  end  
  
  def update
  	if @category.update(category_params)
  	  flash[:success] = "Категория обновлена!"
  	  redirect_to categories_path
    else 
      flash[:danger] = "Категория не обновлена" 
      render 'edit'
    end  
  end

  def destroy
  	@category.destroy
  	flash[:success] = "Категория удалена!"
  	redirect_to categories_path 
  end  
  	  
  private

  	def category_params
  	  params.require(:category).permit(:name)
  	end
  	
  	def  set_category
  	  @category = Category.find(params[:id])	
  	end 

    def admin_user
      redirect_to(root_url) unless current_user.admin? 
    end  
end
