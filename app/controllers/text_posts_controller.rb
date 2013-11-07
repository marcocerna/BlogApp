class TextPostsController < ApplicationController
  def create
    @text_post = TextPost.create(params[:text_post])

    render :json => @text_post, status: 201
  end
end
