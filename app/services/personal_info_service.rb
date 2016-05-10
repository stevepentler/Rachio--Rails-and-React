class PersonalInfoService
  attr_reader :client,
              :user_id

  def initialize
    @client = Faraday.new("https://api.rach.io/1/public/") do |faraday|
      faraday.headers = rachio_headers
      faraday.adapter Faraday.default_adapter
    end
  end

  def retrieve_user_id
    response = client.get("person/info")
    user_id = parse_body(response)["id"]
    User.store_user(user_id)
    return user_id
  end

  def retrieve_user_info
    id = retrieve_user_id
    response = client.get("person/#{id}")
    info = parse_body(response)
  end

  def retrieve_device_ids
    devices = retrieve_user_info["devices"]
    format_devices(devices)
  end

  def format_devices(devices)
    devices.map { |device| device["id"] }
  end

  def retrieve_device_zones(device_id=nil)
    id = device_id ||= retrieve_device_ids.first
    response = client.get("device/#{id}")
    zones = parse_body(response)["zones"]
    format_device_zones(zones)
  end

  def format_device_zones(zones)
    zones.map { |zone| zone["id"] }
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