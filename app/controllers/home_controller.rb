class HomeController < ApplicationController
  def index

    require 'net/http'
    require 'json'

    @url = 'https://api.tidesandcurrents.noaa.gov/api/prod/datagetter?date=latest&station=8721604&product=water_level&datum=NAVD&units=english&time_zone=lst_ldt&application=ports_screen&format=json'

    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    # error handling
    if @output.include? 'error'
      render plain: @output['error']
    end

    puts getCity

  end

  def getCity
    params[:]
  end
end
