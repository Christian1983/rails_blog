class PostsController < ApplicationController
  def index
    
    #TODO: nicht performant, group in datenbank lösen
    @posts =  Post.order(ref_date: :desc).map.with_object({}) do |post, hash|
      hash[post.ref_date.strftime('%B')] ||= []
      hash[post.ref_date.strftime('%B')] << post
    end
    
  end

  def show
    @post = Post.find(params[:id])
  end
end
