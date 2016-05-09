class UserIdService
  attr_reader :client

  def initialize
    @client = Faraday.new("https://api.rach.io/1/public/") do |faraday|
      faraday.headers = rachio_headers
      faraday.adapter = Faraday.default_adapter
    end
  end

  def retrieve_id
    id = JSON.parse(client.get("person/info"))
  end

  private

  def rachio_headers
    {"Authorization" => "Bearer #{ENV['ACCESS_TOKEN']}",
     "Content-Type" => "application/json" }
  end
end