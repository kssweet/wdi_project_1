module NytimesHelper
  class NYTimes
    @@url_base  = "http://api.nytimes.com/svc/news/v3/content/nyt/world.json?api-key="
    @@client_id = Rails.application.secrets.nytimes_top_id
    @@search_id = Rails.application.secrets.nytimes_search_id

    def self.retrieve_articles
      NYTimes.build_article_hash
    end

    def self.articles
      news  = HTTParty.get(@@url_base + @@client_id)
      media = news["results"]
    end

    def self.build_article_hash
      # first we build a hash where the keys will be the sections 
      articles = {}

      NYTimes.articles.each do |article|

        # the first time we have a new section, it won't be a key yet,
        # so, if the hashes key doesn't exit, create it and make it an
        # empty array
        if articles[article["subsection"]].nil?
          articles[article["subsection"]] = []
        end

        # then, push the article on to the existing sections' array
        articles[article["subsection"]].push({
          :title             => article["title"],
          :abstract          => article["abstract"],
          :link              => article["url"],
          :geographic_facet  => article["geo_facet"],
          :description_facet => article["des_facet"]
        })
      end
      
      return articles
    end


    def self.relevant_articles
      find = HTTParty.get("http://api.nytimes.com/svc/search/v1/article?format=json&query=#{[:description_facet]}&offset=#{[:geographic_facet]}&rank=newest&api-key=#{@@search_id}")
    end


  end

end


#When to use a helper? self - what is that doing? 
#calling it on the class? 
#how that hash was built?