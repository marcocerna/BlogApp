class PostsController < ApplicationController
  def index
    text_posts = TextPost.all
    photo_posts = PhotoPost.all
    @posts = []
    @posts << text_posts << photo_posts
    @posts.flatten!.sort_by! {|hash| hash[:created_at] }

    @posts.each do |post|
      post[:comments] = post.comments
    end

    @text_post = TextPost.new
    @photo_post = PhotoPost.new

    respond_to do |format|
      format.html
      format.json {render json: @posts}
    end
  end

end
