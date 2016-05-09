class PersonalInfoService
  attr_reader :client

  def initialize
    @client = Faraday.new("https://api.rach.io/1/public/") do |faraday|
      faraday.headers = rachio_headers
      faraday.adapter Faraday.default_adapter
    end
  end

  def retrieve_id
    response = client.get("person/info")
    id = JSON.parse(response.body)["id"]
  end

  private

  def rachio_headers
    {"Authorization" => "Bearer #{ENV['ACCESS_TOKEN']}",
     "Content-Type" => "application/json" }
  end
end