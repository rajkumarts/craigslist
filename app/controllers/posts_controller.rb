class PostsController < ApplicationController
  
  def show
    @allposts = Micropost.all
  end

end