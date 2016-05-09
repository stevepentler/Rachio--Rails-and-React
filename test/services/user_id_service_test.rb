require 'test_helper'

class UserIdServiceTest < ActiveSupport::TestCase
  test 'retrieves user id' do
    service = UserIdService.new
    assert_equal 3, service.retrieve_id
  end
end