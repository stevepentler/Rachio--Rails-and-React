class UserId
  def intialize
    @client = Faraday.new("https://api.rach.io/1/public/person/") do |faraday|
      faraday.headers = rachio_headers
      faraday.adapter = Faraday.default_adapter
    end
  end

  private

  def rachio_headers
    {"Authorization" => "Bearer #{ENV['ACCESS_TOKEN']}",
     "Content-Type" => "application/json" }
  end
end