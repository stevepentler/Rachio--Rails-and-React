require 'test_helper'

class PersonalInfoServiceTest < ActiveSupport::TestCase
  test 'retrieves user id' do
    service = PersonalInfoService.new
    assert_equal ENV['USER_ID'], service.retrieve_id
  end
end