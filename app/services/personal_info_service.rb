class PersonalInfoService
  attr_reader :client

  def initialize
    @client = Faraday.new("https://api.rach.io/1/public/") do |faraday|
      faraday.headers = rachio_headers
      faraday.adapter Faraday.default_adapter
    end
  end

  def retrieve_user_id
    response = client.get("person/info")
    id = parse_body(response)["id"]
  end

  def retrieve_user_info
    id = retrieve_user_id
    response = client.get("person/#{id}")
    info = parse_body(response)
  end

  def retrieve_device_id
    retrieve_user_info["devices"].first["id"]
  end

  def retrieve_device_zones
    id = retrieve_device_id
    response = client.get("device/#{id}")
    zones = parse_body(response)["zones"]
    format_device_zones(zones)
  end

  def format_device_zones(zones)
    zones.map do |zone|
      zone["id"]
    end
  end

  private

  def rachio_headers
    {"Authorization" => "Bearer #{ENV['ACCESS_TOKEN']}",
     "Content-Type" => "application/json" }
  end

  def parse_body(response)
    JSON.parse(response.body)
  end
end