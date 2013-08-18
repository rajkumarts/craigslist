class Post < ActiveRecord::Base
  attr_accessible :micropost_title
  validates :micropost_title, :presence => true


end
