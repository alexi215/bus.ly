class PredictionsController < ApplicationController
  # before_action :bus_route_id, only [:routes, :stops]

  def routes
    response = HTTParty.get("http://api.wmata.com/Bus.svc/json/JRoutes?api_key=#{WMATA_KEY}")
    @routes = response['Routes']
  end

  def stops
    if params.has_key?(:route) && !params[:route].empty?
      response = HTTParty.get("http://api.wmata.com/Bus.svc/json/JRouteDetails?routeId=#{params[:route]}&api_key=#{WMATA_KEY}")
      @route_id           = response['RouteID']
      
      @direction_0        = response['Direction0']
      @direction_0_sign   = response['Direction0']['TripHeadsign']
      @direction_0_stops  = response['Direction0']['Stops']
      @stop_times         = response['Direction0']['StopTimes']

      @direction_1        = response['Direction1']
      @direction_1_sign   = response['Direction1']['TripHeadsign']
      @direction_1_stops  = response['Direction1']['Stops']
      @stop_times         = response['Direction1']['StopTimes']
    else
      redirect_to bus_routes_path
    end
  end # END of stops

  def times
    if params[:stop] && params[:route]
      response = HTTParty.get("http://api.wmata.com/NextBusService.svc/json/jPredictions?StopID=#{params[:stop]}&api_key=#{WMATA_KEY}")
      @predictions = response['Predictions'].select do |time|
        time['RouteID'] == params[:route]
      @stop_name = response['StopName']
      end
    else
      redirect_to bus_stops_path
    end
  end # END of times
end # END of PredictionsController
