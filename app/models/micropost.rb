class Micropost < ActiveRecord::Base
  attr_accessible :description, :title, :user_id
  belongs_to :user
  has_many :relationships, foreign_key: "micropost_title", dependent: :destroy

  validates :title, :presence => true
  validates :description , :presence => true
  validates :user_id , :presence => true

  default_scope order: 'microposts.created_at DESC'


 def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end

end
