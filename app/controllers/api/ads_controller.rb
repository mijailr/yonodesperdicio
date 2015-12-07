class Api::AdsController < Api::BaseController
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  respond_to :json

  def index
    ads = Ad.joins(:comments).api_search(params).page(params[:page]).per(params[:per_page])
    render json: ads, meta: pagination(ads, params[:per_page])
  end

  def show
    respond_with Ad.find(params[:id])
  end

  def create
    ad = Ad.new(ad_params)
    ad.user = current_user
    if ad.save
      render json: ad, status: 201, location: [:api, ad]
    else
      render json: { errors: ad.errors }, status: 422
    end
  end

  def update
    ad = current_user.ads.find(params[:id])

    if ad.update(ad_params)
      render json: ad, status: 200, location: [:api, ad]
    else
      render json: { errors: ad.errors }, status: 422
    end
  end

  def destroy
    ad = current_user.ads.find(params[:id])
    ad.destroy
    head 204
  end

  private

  def ad_params
    params.require(:ad).
    permit(:title, :body, :type, :status,
      :grams, :expiration_date, :pick_up_date,
      :comments_enabled, :image,
      :zipcode, :city, :province,
      :food_category
      )
  end

end
