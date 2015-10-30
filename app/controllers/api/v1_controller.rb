class Api::V1Controller < ApplicationController

  def ad_show
    @ad = Ad.find params[:id]
  end

  def idea_show
    @idea = Idea.find params[:id]
  end

  def user_show
    @user = User.find params[:id]
  end

  def woeid_show
    if params[:type] == 'give'
      ads = Ad.give
    else
      ads = Ad.want
    end
    @woeid = params[:id]
    @page = params[:page]
    @ads = ads.available.where(:woeid_code => @woeid).page(params[:page])
  end

  def woeid_list
    @section_locations = AdHelper.get_locations_ranking
  end

end
