class PredictionsController < ApplicationController
  


  def routes
    response = HTTParty.get('http://api.wmata.com/Bus.svc/json/JRoutes?api_key=ud7ahaty74qdc2ghs4h34y5g')
    @routes = response['Routes']
  end

  def stops
    if params.has_key?(:route) && !params[:route].empty?
      response = HTTParty.get("http://api.wmata.com/Bus.svc/json/JRouteDetails?routeId=#{params[:route]}&api_key=ud7ahaty74qdc2ghs4h34y5g")
      @route_id           = response['RouteID']
      @direction_0        = response['Direction0']
      @direction_0_sign   = response['Direction0']['TripHeadsign']
      @direction_0_stops  = response['Direction0']['Stops'] 

      @direction_1        = response['Direction1']
      @direction_1_sign   = response['Direction1']['TripHeadsign']
      @direction_1_stops  = response['Direction1']['Stops']
    else
      redirect_to bus_routes_path
    end
  end

  def times
    if params.has_key?(:stop) && !params[:stop].empty?
      response = HTTParty.get("http://api.wmata.com/NextBusService.svc/json/JPredictions?StopID=#{params[:stop]}&api_key=ud7ahaty74qdc2ghs4h34y5g")
      @stop_name           = response['StopName']
      @route               = response['Predictions']
    else
      redirect_to bus_stops_path
    end
  end



end # END OF PredictionsController
