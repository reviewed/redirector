class Redirector
  CATEGORY_MAP = {
    "www.coffeebrewerinfo.com" => "coffee",
    "www.vacuumcleanerinfo.com" => "vacuums",
    "www.washerdryerinfo.com" => "laundry",
    "www.espressomakerinfo.com" => "espresso",
    "www.computermonitorinfo.com" => "monitors",
    "www.grillsinfo.com" => "grills",
    "www.dishwashersinfo.com" => "dishwashers",
    "www.videoprojectorinfo.com" => "videoprojectors",
    "www.tabletreaderinfo.com" => "tablets",
    "www.oveninfo.com" => "ovens",
    "www.headphoneinfo.com" => "headphones",
    "www.printerinfo.com" => "printers",
    "www.refrigeratorinfo.com" => "refrigerators",
    "www.televisioninfo.com" => "televisions",
    "www.camcorderinfo.com" => "camcorders",
    "www.digitalcamerainfo.com" => "cameras",
    "www2.grillsinfo.com" => "grills"
  }

  class << self
    def call(env)
      request = Rack::Request.new(env)
      subdomain = CATEGORY_MAP[request.host]
      if subdomain
        url = "http://#{subdomain}.reviewed.com#{request.fullpath}"
        response = [301, {"Location" => url}, ["Redirecting you to our new home at Reviewed.com"]]
      else
        response = [500, {"Content-type" => "text/html"}, ["No redirect destination found for #{domain}"]]
      end
      response
    end
  end
end

run Redirector