class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :create, :new]
  before_action :write_profile, except: [:new, :create]
  
  def new
     @profile = Profile.new
  end
  
  def create
    # 왜 롤백되는지 찾아보기
    
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    @profile.save
      
 
      redirect_to my_profile_url
    

  end

  def show
  end

  def edit
  end
  
  def update
   if @profile.update(profile_params)
      redirect_to my_profile_url
    else
      render 'edit'
   end
  end
  
  private
    def set_profile
      @profile = current_user.profile
    end
    def profile_params
      params.require(:profile).permit(:name, :adress, :birth, :mobile)
    end
    def write_profile
      redirect_to new_profile_url if current_user.profile.nil?
    end
end
  
