class FavoritesController < ApplicationController
  before_action :require_sign_in

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)

    if favorite.save
      flash[:notice] = "Post successfully added to favorites!"
    else
      flash[:alert] = "Unable to add to favorites, please try again."
    end

    redirect_to [post.topic, post]
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])

    if favorite.destroy
      flash[:notice] = "Post successfully removed from favorites!"
    else
      flash[:alert] = "Unable to remove from favorites, please try again."
    end

    redirect_to [post.topic, post]
  end
end
