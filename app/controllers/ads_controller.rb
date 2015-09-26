class AdsController < ApplicationController
  include ApplicationHelper

  before_action :set_ad, only: [:show, :edit, :update, :destroy]
  #caches_action :list, :show, layout: false, unless: :current_user, skip_digest: true
  #caches_action :index, :cache_path => Proc.new { |c| c.params }, unless: :current_user
  load_and_authorize_resource

  # GET /
  def index
    if user_signed_in?
      url = current_user.woeid? ? ads_woeid_path(id: current_user.woeid, type: 'give') : location_ask_path
      redirect_to url
    else
      list
    end
  end

  def list
    @ads = Ad.give.available.includes(:user).page(params[:page])
    @location = get_location_suggest
  end

  # GET /ads/1
  # GET /ads/1.json
  def show
    redirect_to ads_path unless @ad.user
    @ad.increment_readed_count!
  end

  # GET /ads/new
  def new
    @ad = Ad.new
    if current_user.woeid.nil?
      redirect_to location_ask_path
    end
  end

  # GET /ads/1/edit
  def edit
  end

  # POST /ads
  # POST /ads.json
  def create
    @ad = Ad.new(ad_params)
    @ad.user = current_user
    @ad.ip = request.remote_ip
    @ad.status = 1

    respond_to do |format|
      if verify_recaptcha(:model => @ad, :message => t('nlt.captcha_error')) && @ad.save
        format.html { redirect_to adslug_path(@ad, slug: @ad.slug), notice: t('nlt.ads.created') }
        format.json { render action: 'show', status: :created, location: @ad }
      else
        format.html { render action: 'new' }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ads/1
  # PATCH/PUT /ads/1.json
  def update
    respond_to do |format|
      if @ad.update(ad_params)
        expire_fragment(  cache_key_for( "ad_#{I18n.locale}_" + @ad.id.to_s, current_user ) )
        format.html { redirect_to @ad, notice: t('nlt.ads.updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', alert: @ad.errors }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.json
  def destroy
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to ads_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ad
    #@ad = Rails.cache.fetch("set_ad_#{params[:id]}") do
    @ad = Ad.includes(:user).find(params[:id])
    #end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ad_params
    params.require(:ad).
           permit(:title, :body, :type, :status, :woeid_code, 
                  :grams, :expiration_date, :pick_up_date, 
                  :comments_enabled, :image, :user_owner, :ip)
  end
end
