require 'test_helper'

class ZoneTest < ActiveSupport::TestCase
  test 'retrieve zones saves device to database' do
    VCR.use_cassette('device_zones') do
      service = RachioService.new
      assert_difference 'Zone.count', 8 do
        service.retrieve_device_zones
      end
      assert_equal "4f1b562e-1dc3-40d7-acf1-2a1998a47786", Zone.first.zone_id
      assert_equal "61197df9-d256-4959-8117-7625f919b2b3", Zone.last.zone_id
    end
  end
end