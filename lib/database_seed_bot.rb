require 'net/http'
require 'json'

class DatabaseSeedBot

  def self.seed_db
    urls = fetch_urls
    urls.each do |village|
      @new_url = Url.create!({decoded_url: 'http://' + village['name']})
      id = @new_url.id
      @new_url.create_slug(id)
      @new_url.access_count = (1..20).to_a.sample      
      @new_url.save
    end
  end

  def self.fetch_urls
    url = 'http://govt-urls.api.usa.gov/government_urls/search?q=village&size=100'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    json = JSON.parse(response)['results']
  end

  def self.run
    self.seed_db
  end

end
