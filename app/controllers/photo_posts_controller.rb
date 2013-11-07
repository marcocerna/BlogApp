class PhotoPostsController < ApplicationController
  def create
    @photo_post = PhotoPost.create(params[:photo_post])

    render :json => @photo_post, status: 201
  end
end
