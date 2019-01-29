class DrinkController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @post_all = Drink.all
  end
  def show
  end
  def new
    @post = Drink.new
    @token=form_authenticity_token
  end
  def create
    @post = Drink.new(post_params)
    @post.user = current_user
    @post.save
    if @post.save
      redirect_to drink_path(@post)
   else
      render "new"
    end
  end
  def edit
  end
  def update
    @post.user = current_user
    if @post.update(post_params)
     redirect_to drink_path(@post)
    else
      render "edit"
    end
  end
  def destroy
    @post.destroy
    redirect_to '/drink', notice:  "The post #{@post.title} has been deleted."
  end
  # def index
  #   @post_all = Drink.all
  # end
  # def show
  #   @post=Drink.find(params[:id])
  # end
  # def new
  #   #@token=form_authenticity_token
  #   @post = Drink.new
  # end
  # def create
  #   debugger
  #   @post = Drink.new
  #   # @post.title = params[:post_title]
  #   # @post.content = params[:post_content]
  #   # @post.cover = params[:cover]
  #   # @post.save
    
  #   # if @post.save
  #   #     redirect_to "/drink/#{@post.id}", method: "get", notice: "The post #{@post.title} has been uploaded."
  #   #   else
  #   #       redirect_to new_drink_path
  #   # end
  # end
  # def edit
  #   @token=form_authenticity_token
  #   @post = Drink.find(params[:id])
  # end
  # def update
  #   post = Drink.find(params[:id])
  #   post.title = params[:post_title]
  #   post.content = params[:post_content]
  #   post.save
    
  #   redirect_to drink_path
  # end
  # def destroy
  #   @post = Drink.find(params[:id])
  #   @post.destroy
  #   redirect_to '/drink', notice:  "The post #{@post.title} has been deleted."
  # end
  
   private
   def set_post
     @post = Drink.find(params[:id])
   end
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:drink).permit(:title, :content, :cover)
    end
    
   
end

