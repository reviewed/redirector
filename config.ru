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
    "www.digitalcamerainfo.com" => "cameras"
  }

  class << self
    def call(env)
      domain = env['HTTP_HOST']
      subdomain = CATEGORY_MAP[domain]
      if subdomain
        uri = env['REQUEST_URI'].gsub("http://#{domain}", '')
        url = "#{subdomain}.reviewed.com#{uri}"
        response = [301, {"Location" => url}, ["Redirecting you to our new home at Reviewed.com"]]
      else
        response = [500, {"Content-type" => "text/html"}, ["No redirect destination found for #{domain}"]]
      end
      response
    end
  end
end

run Redirector