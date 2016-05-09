require 'test_helper'

class UserIdServiceTest < ActiveSupport::TestCase
  test 'retrieves user id' do
    service = UserIdService.new
    assert_equal ENV['USER_ID'], service.retrieve_id
  end
end