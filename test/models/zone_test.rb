require 'test_helper'

class ZoneTest < ActiveSupport::TestCase
  test 'retrieve zones saves device to database' do
    VCR.use_cassette('device_zones') do
      service = RachioService.new
      first_zone_id = "4f1b562e-1dc3-40d7-acf1-2a1998a47786"
      second_zone_id = "61197df9-d256-4959-8117-7625f919b2b3"
      assert_difference 'Zone.count', 8 do
        service.retrieve_device_zones
      end
      assert Zone.all.one? { |zone| zone.zone_id == first_zone_id }
      assert Zone.all.one? { |zone| zone.zone_id == second_zone_id}
    end
  end
end