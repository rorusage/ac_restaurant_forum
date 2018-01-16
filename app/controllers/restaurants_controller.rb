class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def index
    @restaurants = Restaurant.page(params[:page]).per(9)
    @categories = Category.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new
  end

  def feeds
    @recent_restaurants = Restaurant.all.order(created_at: :desc).limit(10)
    @recent_comments = Comment.all.order(created_at: :desc).limit(10)
  end

  def dashboard
    @restaurant = Restaurant.find(params[:id])
  end

  def favorite
    @restaurant = Restaurant.find(params[:id])
    @restaurant.favorites.create!(user: current_user)
    @restaurant.count_favorites
    redirect_to :back
  end

  def unfavorite
    @restaurant = Restaurant.find(params[:id])
    favorite = Favorite.where(restaurant: @restaurant, user: current_user)
    favorite.destroy_all
    @restaurant.count_favorites
    redirect_to :back
  end

  def like
    @restaurant = Restaurant.find(params[:id])
    @restaurant.likes.create!(restaurant: @restaurant, user: current_user)
    redirect_to :back
  end

  def unlike
    @restaurant = Restaurant.find(params[:id])
    like = Like.where(restaurant: @restaurant, user: current_user)
    like.destroy_all
    redirect_to :back
  end

  def ranking
    @restaurants = Restaurant.all.order(favorites_count: :desc).limit(10)
  end
end
