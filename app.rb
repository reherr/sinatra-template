require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

get("/") do
  erb(:index)
end

get("/random_dog") do 
  dog_api_url = "https://random.dog/woof.json"
  raw_response = HTTP.get(dog_api_url)
  parsed_response = JSON.parse(raw_response)
  @dog_image_url = parsed_response.fetch("url")
  erb(:show)
end
