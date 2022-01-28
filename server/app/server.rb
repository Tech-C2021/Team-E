require 'sinatra'
require 'json'
require 'webrick'
require './Controllers/client/heroesController.rb'
require './Controllers/scraperController.rb'
configure do
  set :bind, '0.0.0.0'
end

heroesController = ClientHeroController.new()
scrapingController = ScrapingController.new()
get '/' do
  begin
  content_type :json
  heroesController.displayHeroes
  rescue TypeError => e
    p e
  end
end

post '/' do
  begin
 query = JSON.parse(request.body.read)
 heroesController.trackHeroes(query)
  rescue StandardError => e
    p e
  end
end

delete '/' do
    begin
      query = JSON.parse(request.body.read)
      heroesController.deleteHeroByName(query)
  rescue StandardError => e
    p e
  end
end


#when sending all heroes with their stats back have to change the data into json 


get '/meta/beginner' do
  begin
    scrapingController.getHeroesInMetaForBeginnerTier()
  rescue StandardError => e
    p e
  end  
end

get '/meta/intermediate' do
  begin
    scrapingController.getHeroesInMetaForIntermediateTier()
  rescue StandardError => e
    p e
  end  
end

get '/meta/top' do
  begin
    scrapingController.getHeroesInMetaForTopTier()
  rescue StandardError => e
    p e
  end  
end

get '/meta/low' do
  begin
    scrapingController.getHeroesInMetaForLowTier()
  rescue StandardError => e
    p e
  end
end

post '/meta/check' do
  begin
    query = JSON.parse(request.body.read)
    scrapingController.getUsersHeroesAccordingToTier(query)
  rescue StandardError => e
    p e
  end
end

get '/test' do
  begin
    scrapingController.nameMakerForFetchingIcons
  rescue StandardError => e
    p e
  end
end
  























