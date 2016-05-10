module StoreDevice
  def save_devices(devices, user_id)
    user = User.find_or_create_by(user_id: user_id)
    devices.each do |single_device|
      device = user.devices.find_or_create_by(device_id: single_device["id"])
      device.user_id = user.id
      device.save
    end
  end

  def save_zones(zones, device_id)
    device = Device.find_by(device_id: device_id)
    zones.each do |single_zone|
      zone = device.zones.find_or_create_by(zone_id: single_zone["id"])
      zone.device_id = device.id
      zone.save
    end
  end
end