class Book < ActiveRecord::Base
  attr_accessible :author, :condition, :course, :edition, :name, :user_id

  belongs_to :user

  validates :user_id , :presence => true
  validates :author , :presence => true
  validates :name , :presence => true
  validates :condition , :presence => true

  default_scope order: 'books.created_at DESC'

end
