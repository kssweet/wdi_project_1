class NewsController < ActionController::Base

def index

@africa = []
@americas = []
@asia_pacific = []
@europe = []
@middle_east = []


news = HTTParty::get ("http://api.nytimes.com/svc/news/v3/content/nyt/world.json?api-key=df6bc9fdc85da9cd93ae4d08776d88b1:16:54119632")

media = news["results"][0..15]

  for x in 0..(media.length-1)
      if media[x]["subsection"] == "Middle East"

      @middle_east.push media[x]["title"]
      @middle_east.push media[x]["abstract"]
      @middle_east.push media[x]["url"]


      elsif media[x]["subsection"] == "Africa"
      @africa.push media[x]["title"]
      @africa.push media[x]["abstract"]
      @africa.push media[x]["url"]

      elsif media[x]["subsection"] == "Americas"
      @americas.push media[x]["title"]
      @americas.push media[x]["abstract"]
      @americas.push media[x]["url"]

      elsif media[x]["subsection"] == "Asia Pacific"
      @asia_pacific.push media[x]["title"]
      @asia_pacific.push media[x]["abstract"]
      @asia_pacific.push media[x]["url"]

      elsif media[x]["subsection"] == "Europe"
      @europe.push media[x]["title"]
      @europe.push media[x]["abstract"]
      @europe.push media[x]["url"]

      else
      puts "No News Available Today"

      end
    end
  end

end
