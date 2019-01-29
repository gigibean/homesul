class Drink < ActiveRecord::Base
    # TO DO 
    #VALIDATION 
    acts_as_commentable
#이미지업로드모델
    # validates_presence_of :cover
    mount_uploader :cover, CoverUploader
    belongs_to :user
    has_many :likes
    has_many :l_users, through: :likes, source: :user
    
    
    
end
