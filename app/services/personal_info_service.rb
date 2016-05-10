class PersonalInfoService
  include StoreDevice
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
  end

  def retrieve_user_info
    id = retrieve_user_id
    response = client.get("person/#{id}")
    info = parse_body(response)
  end

  def retrieve_device_ids
    devices = retrieve_user_info["devices"]
    formatted_devices = format_devices(devices)
    save_devices(formatted_devices)
    return formatted_devices
  end

  def format_devices(devices)
    devices.map { |device| device["id"] }
  end

  def retrieve_device_zones(id=nil)
    device_id = id ||= retrieve_device_ids.first
    response = client.get("device/#{device_id}")
    zones = parse_body(response)["zones"]
    save_zones(zones, device_id)
    return zones
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