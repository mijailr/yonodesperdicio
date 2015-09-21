module WoeidHelper

  def self.convert_woeid_name woeid
    # search by woeid, return place
    #
    # param woeid: integer. example: 244444
    # return place: string. format: "City, State, Country"
    #
    key = 'woeid_' + woeid.to_s
    if Rails.cache.fetch(key)
      return Rails.cache.fetch(key)
    else
      GeoPlanet.appid = Rails.application.secrets["geoplanet_app_id"]
      place_raw = GeoPlanet::Place.new(woeid.to_i, :lang => :es)
      #place =  { full: "#{place_raw.name}, #{place_raw.admin1}, #{place_raw.country}" , short: "#{place_raw.name}" }
      place =  { full: "#{place_raw.name}, #{place_raw.country}" , short: "#{place_raw.name}" }
      Rails.cache.write(key, place)
      return place
    end
  end

  def self.search_by_name name
    # search by name, return possible places
    #
    # param name: string. example: "Madrid"
    # return places: list. format: [[full name, woeid, ad_count], ...]
    #                      example: [["Madrid, Madrid, España (2444 anuncios)",766273],["Madrid, Comunidad de Madrid, España (444 anuncios)",12578024],["Madrid, Cundinamarca, Colombia (0 anuncios)",361938]]
    #
    key = 'location_' + name
    if Rails.cache.fetch(key)
      return Rails.cache.fetch(key)
    else
      GeoPlanet.appid = Rails.application.secrets["geoplanet_app_id"]
      locations = GeoPlanet::Place.search(name, :lang => :es, :count => 0)
      if locations.nil?
        places = nil
      else
        places = locations.map {|l| ["#{WoeidHelper.convert_woeid_name(l.woeid)[:full]} (#{Ad.where(woeid_code: l.woeid).count} anuncios)", l.woeid] }
      end
      Rails.cache.write(key, places)
      return places
    end
  end

end
